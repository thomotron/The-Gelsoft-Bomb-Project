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

bool running = true;
volatile bool solved = false;
volatile int strikes = 0;
const int maxStrikes = 3;

volatile unsigned long onStrikeLast = 0;
volatile unsigned long onCorrectLast = 0;
const unsigned int bounceDelay = 200;

void onCorrect();
void onStrike();
void enableInterrupts();
void disableInterrupts();
void enableInterrupt(int interrupt);
void disableInterrupt(int interrupt);
void writeDigit(int place, int value, bool dp);
void writeDigits(int values[], bool decimalPoints[]);

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
    char digits[] = {
        0b11111100,
        0b01100000,
        0b11011010,
        0b11110010,
        0b01100110,
        0b10110100,
        0b10111110,
        0b11100000,
        0b11111110,
        0b11100110
    };

    // Iterate the remaining 7 digits
    for (int i = 0; i < 7; i++)
    {
        // Get the individual bit from the port and the digit
        unsigned char portBit = PORTB & 0b00000001;
        unsigned char digitBit = (digits[value] >> i) & 0b00000001;

        // Check if they differ
        if (portBit ^ digitBit)
        {
            // If the port is set, clear it
            if (portBit) PORTB &= ~0b00000001;
            // Otherwise, set it
            else PORTB |= 0b00000001;
        }

        // Pulse the clock
        PORTB |= (1 << 1);
        PORTB &= ~(1 << 1);
    }

    // Pulse LOAD to write the MAX7219's shift register to the display
    PORTB |= (1 << 2);
    PORTB &= ~(1 << 2);
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
