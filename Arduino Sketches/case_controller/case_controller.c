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
#include "max7219.c"

// Define some macros for the DIN, CLK, and LOAD connections to the MAX2719
#define DIN_PORT PORTB
#define DIN_PIN  0
#define CLK_PORT PORTB
#define CLK_PIN  1
#define LOAD_PORT PORTB
#define LOAD_PIN 2

// Define some macros for the interrupt pins
#define CORRECT_PORT PORTA
#define CORRECT_PIN  0
#define STRIKE_PORT PORTA
#define STRIKE_PIN  1

// Function prototypes
void init();
void onCorrect();
void onStrike();
void enableInterrupts();
void disableInterrupts();
void enableInterrupt(int interrupt);
void disableInterrupt(int interrupt);
void writeBit(bool bit);
void writeByteMSB(unsigned char byte);

// State variables
bool running = true;
volatile bool solved = false;
volatile int strikes = 0;
const int maxStrikes = 3;
int timeRemaining = 600; // 5-minute countdown

// Interrupt states
bool correctPinLast;
bool strikePinLast;

// Define interrupt handler
ISR(PCINT0_vect)
{
    // Get current interrupt pin states
    bool correctPin = (CORRECT_PORT >> CORRECT_PIN) & 1;
    bool strikePin = (STRIKE_PORT >> STRIKE_PIN) & 1;

    // Compare and run handlers
    if (correctPinLast != correctPin) onCorrect();
    if (strikePinLast != strikePin) onStrike();

    // Shift states to history for the next run
    correctPinLast = correctPin;
    strikePinLast = strikePin;
}

void init()
{
    // Enable pullups by setting MCUCR[6] (PUD) to 0 (~ is 1s complement, so NOT)
    MCUCR &= ~(1 << 6);

    // Set up interrupt registers and enable PCINT0 and PCINT1
    enableInterrupts();
    enableInterrupt(0);
    enableInterrupt(1);

    // Initialise the LED display
    MAX7219_Init();

    MAX7219_DisplayTestStart();
    _delay_ms(2000);
    MAX7219_DisplayTestStop();

    MAX7219_Clear();
}

int main() {
    // Don't do anything if we aren't runnning
    if (!running) return 1;

    // Initialise everything
    init();

    // Enter the Main Run Loop (MRL) -- Advanced military tech right here
    while (true)
    {
        // Decrement time remaining by 1 second
        timeRemaining--;

        // Display the time remaining
        displayTimeRemaining();

        // Check if we should detonate
        if (timeRemaining < 0 || strikes == maxStrikes)
        {
            // Disable interrupts and clear running flag
            disableInterrupt(0);
            disableInterrupt(1);
            running = false;

            // TODO: Detonate

            return 1;
        }
        // Check if we've been solved
        else if (solved)
        {
            // Disable interrupts and clear running flag
            disableInterrupt(0);
            disableInterrupt(1);
            running = false;

            // Break out and commit not run anymore
            return 1;
        }

        // Wait 1000ms
        _delay_ms(1000);
    }
}

void displayTimeRemaining()
{
    // Check if we should 'line-out' the display
    if (timeRemaining < 0)
    {
        for (int i = 1; i <= 4; i++)
        {
            MAX7219_DisplayChar(i, '-');
        }
    }
    else
    {
        // Split the remaining time down into digits and display them
        int minutes = timeRemaining / 60;
        int seconds = timeRemaining - (minutes * 60);
        MAX7219_DisplayChar(4, (char) ((int)(minutes / 10) + 48)); // Values are offset by 48 for ASCII
        MAX7219_DisplayChar(3, (char) ((int)(minutes % 10) + 48));
        MAX7219_DisplayChar(2, (char) ((int)(seconds / 10) + 48));
        MAX7219_DisplayChar(1, (char) ((int)(seconds % 10) + 48));
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
