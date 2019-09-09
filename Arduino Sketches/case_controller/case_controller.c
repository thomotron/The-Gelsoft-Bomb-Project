// This file is written to correspond with the
// following pinout:
//
//                    ATTiny24A
//                   .----v----.
//              Vcc -| 1    14 |- GND
// B0   MAX7219 DIN -| 2    13 |- CORRECT IN    A0
// B1   MAX7219 CLK -| 3    12 |- STRIKE IN     A1
// B3     ISP RESET -| 4    11 |- DISARM OUT    A2
// B2  MAX7219 LOAD -| 5    10 |- LOWPOWER OUT  A3
// A7        BUZZER -| 6     9 |- ISP SCK       A4
// A6      ISP MOSI -| 7     8 |- ISP MISO      A5
//                   *---------*

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdbool.h>

// Define some macros for the DIN, CLK, and LOAD connections to the MAX2719
#define DIN_PORT PORTB
#define DIN_PIN  0
#define CLK_PORT PORTB
#define CLK_PIN  1
#define LOAD_PORT PORTB
#define LOAD_PIN 2

// Function prototypes
void onCorrect();
void onStrike();
void enableInterrupts();
void disableInterrupts();
void enableInterrupt(int interrupt);
void disableInterrupt(int interrupt);
void writeDigit(int place, int value, bool dp);
void writeDigits(int values[], bool decimalPoints[]);

// Display font
const unsigned char digits[] = {
    0b1111110,
    0b0110000,
    0b1101101,
    0b1111001,
    0b0110011,
    0b1011010,
    0b1011111,
    0b1110000,
    0b1111111,
    0b1110011
};

// State variables
bool running = true;
volatile bool solved = false;
volatile int strikes = 0;
const int maxStrikes = 3;

void init() {
    // Enable pullups by setting MCUCR[6] (PUD) to 0 (~ is 1s complement, so NOT)
    MCUCR &= ~(1 << 6);

    // Set up interrupt registers and enable PCINT0 and PCINT1
    enableInterrupts();
    enableInterrupt(0);
    enableInterrupt(1);
}

void main() {
    init();

    if (!running) return;

    // Disable interrupts if solved or dead
    if (solved || strikes == maxStrikes)
    {
        disableInterrupt(0);
        disableInterrupt(1);
        running = false;
    }
}

void onCorrect()
{
    solved = true;
}

void onStrike()
{
    strikes = ++strikes > maxStrikes ? maxStrikes : strikes; // Cap strikes at maxStrikes
}

void enableInterrupts()
{
    // Enable global interrupts by setting SREG[7] to 1
    SREG |= (1 << 7);

    // Enable interrupt group PCINT[0-7] by setting GIMSK[4] to 1
    GIMSK |= (1 << 4);
}

void disableInterrupts()
{
    // Disable global interrupts by setting SREG[7] to 0
    SREG &= ~(1 << 7);

    // Disable interrupt group PCINT[0-7] by setting GIMSK[4] to 0
    GIMSK &= ~(1 << 4);
}

// Enables an interrupt pin in the PCINT[0-7] group
void enableInterrupt(int interrupt)
{
    // Enable interrupt pin by setting PCMSK0[interrupt] to 1
    PCMSK0 |= (1 << interrupt);
}

// Disables an interrupt pin in the PCINT[0-7] group
void disableInterrupt(int interrupt)
{
    // Disable interrupt pin by setting PCMSK0[interrupt] to 0
    PCMSK0 &= ~(1 << interrupt);
}

// Writes a digit to a multi-digit 7-seg display
//   place: Place to write the digit to (0-3)
//   value: Digit value (0-9)
//   dp: Whether to enable the decimal place indicator
void writeDigit(int place, int value, bool dp)
{
    // Write which digit we are updating
    // Only write the last four bits, since there are only 14 commands
    writeByteMSB(value & 0b00001111);

    // Set the decimal point
    writeBit(dp);

    writeByteMSB(digits[value]);

    // Pulse LOAD to write the MAX7219's shift register to the display
    LOAD_PORT |= (1 << LOAD_PIN);
    LOAD_PORT &= ~(1 << LOAD_PIN);
}

// Writes a series of digits to a multi-digit 7-seg display
//   values: Array of values to write
void writeDigits(int values[], bool decimalPoints[])
{
    // Iterate over values array
    for (int i = 0; i < 4; i++)
    {
        // Write value to the current place
        writeDigit(i, values[i], decimalPoints[i]);
    }
}

// Writes a single bit to the given port on the given pin
//   bit: Bit to write
void writeBit(bool bit)
{
    // Set or clear the pin, depending on the bit
    if (bit) DIN_PORT |= bit << DIN_PIN;
    else DIN_PORT &= ~(bit << DIN_PIN);

    // Pulse the clock
    CLK_PORT |= 1 << CLK_PIN;
    CLK_PORT &= ~(1 << CLK_PIN);
}

// Writes a single byte to the given port on the given pin (MSB-first)
//   byte: Byte to write
void writeByteMSB(unsigned char byte)
{
    // Iterate from MSB to LSB
    for (int i = 7; i >= 0; i--)
    {
        // Mask the relevant bit and write it
        writeBit(byte & (1 << i));
    }
}
