// This file is written to correspond with the
// following pinout:
//
//                    ATTiny24A
//                   .----v----.
//              Vcc -| 1    14 |- GND
// B0   MAX7219 DIN -| 2    13 |- LOWPOWER      A0
// B1   MAX7219 CLK -| 3    12 |- BUTTON PLUS   A1
// B3     ISP RESET -| 4    11 |- BUTTON MINUS  A2
// B2  MAX7219 LOAD -| 5    10 |- BUTTON OK     A3
// A7        BUZZER -| 6     9 |- SCK           A4
// A6          MOSI -| 7     8 |- MISO          A5
//                   *---------*

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdbool.h>
#include "max7219.c"
#include "spi.h"

// Define some macros for the DIN, CLK, and LOAD connections to the MAX2719
#define DIN_PORT PORTB
#define DIN_PIN  0
#define CLK_PORT PORTB
#define CLK_PIN  1
#define LOAD_PORT PORTB
#define LOAD_PIN 2

// Define some macros for the +, -, and OK buttons
#define BUTTON_PLUS_PORT  PINA
#define BUTTON_PLUS_PIN   1
#define BUTTON_MINUS_PORT PINA
#define BUTTON_MINUS_PIN  2
#define BUTTON_OK_PORT  PINA
#define BUTTON_OK_PIN     3

// Define some macros for the interrupt pins
#define LOWPOWER_PORT PORTA
#define LOWPOWER_PIN  0

// Define some macros for other pins
#define BUZZER_PORT PORTA
#define BUZZER_PIN 7

// Function prototypes
void init();
int initTime();
void onLowpower();
void enableInterrupts();
void disableInterrupts();
void enableInterrupt(int interrupt);
void disableInterrupt(int interrupt);
void writeBit(bool bit);
void writeByteMSB(unsigned char byte);
void displayTimeRemaining();
void displayTime(int s);
void updateDisplay();
void beep(int duration);

// State variables
bool running = true;
volatile bool solved = false;
volatile int strikes = 0;
const int maxStrikes = 3;
int timeRemaining = 300; // 5-minute countdown
bool displayBlinking = false;
bool displayBlankedLast = false;

// Interrupt states
bool lowpowerPinLast;

// Define interrupt handler
ISR(PCINT0_vect)
{
    // Get current interrupt pin states
    bool lowpowerPin = (LOWPOWER_PORT >> LOWPOWER_PIN) & 1;

    // Compare and run handlers
    if (lowpowerPinLast != lowpowerPin) onLowpower();

    // Shift states to history for the next run
    lowpowerPinLast = lowpowerPin;
}

void init()
{
    // Set port I/O directions
    DDRA |= 0b11000000;
    DDRB |= 0b00000000;

    // Set up interrupt registers and enable PCINT0
    enableInterrupts();
    enableInterrupt(0);

    // Initialise the LED display
    MAX7219_Init();

    // Test the display for one second
    MAX7219_DisplayTestStart();
    _delay_ms(1000);
    MAX7219_DisplayTestStop();
    MAX7219_Clear();
}

int main()
{
    // Initialise everything
    init();

    // Use the +, -, and OK buttons to set the time
    timeRemaining = initTime();

    // Enter the Main Run Loop (MRL) -- Advanced military tech right here
    while (running)
    {
        int delay_ms = 1000;

        // Decrement time remaining by 1 second
        timeRemaining--;

        // Update the display based on our current state
        updateDisplay();

        // Check if we should detonate
        if (timeRemaining < 0 || strikes == maxStrikes)
        {
            // Disable interrupts and clear running flag
            disableInterrupt(0);
            disableInterrupt(1);
            running = false;

            // TODO: Detonate more spectacularly
            // For now, we'll just make a nice long beep
            beep(3000);

            // Reached an end condition, break out
            break;
        }
        // Check if we've been solved
        else if (solved)
        {
            // Disable interrupts and clear running flag
            disableInterrupt(0);
            disableInterrupt(1);
            running = false;

            // Reached an end condition, break out
            break;
        }

        // Beep the buzzer if running
        if (timeRemaining >= 0) {
            beep(50);
            delay_ms -= 50;
        }

        // Wait until we have no delay left
        while (delay_ms-- > 0) _delay_ms(1);
    }

    // Loop forever until we're reset
    while (true) continue;
}

// Prompts the user to enter the time in minutes and seconds, returning the time in seconds
int initTime()
{
    // Set the display blinking flag
    displayBlinking = true;

    // Set up some state variables
    int currentDigit = 0;
    int minutes = 0;
    int seconds = 0;
    bool pressed = false;
    while (true)
    {
        // Check if this is a rising edge
        if (!pressed) {
            // Get each button state and determine which operation to perform
            if (BUTTON_OK_PORT & (1 << BUTTON_OK_PIN))
            {
                // Stop the init process if we have set both digits
                if (currentDigit >= 2) break;
                    // Otherwise move to the next digit
                else currentDigit++;
            }
            else if (BUTTON_PLUS_PORT  & (1 << BUTTON_PLUS_PIN))
            {
                // Increment minutes or seconds (whichever is current)
                currentDigit == 0 ? minutes++ : seconds++;
            }
            else if (BUTTON_MINUS_PORT & (1 << BUTTON_MINUS_PIN))
            {
                // Decrement minutes or seconds (whichever is current)
                currentDigit == 0 ? minutes-- : seconds--;
            }

            // Wrap the digits if we've overshot a boundary
            if (minutes < 0) minutes = 99;
            else if (minutes > 99) minutes = 0;
            if (seconds < 0) seconds = 59;
            else if (seconds > 59) seconds = 0;

            // Set the button as pressed so we don't process a button multiple times for a single press
            pressed = true;
        }
            // Check if this is a falling edge
        else if (pressed && !(BUTTON_OK_PORT & (1 << BUTTON_OK_PIN)) && !(BUTTON_PLUS_PORT  & (1 << BUTTON_PLUS_PIN)) && !(BUTTON_MINUS_PORT & (1 << BUTTON_MINUS_PIN)))
        {
            // Reset the pressed flag
            pressed = false;
        }

        // Update the display
        displayTime((minutes * 60) + seconds);
    }

    // Unset the display blinking flag
    displayBlinking = false;

    return (minutes * 60) + seconds;
}

// Updates the display based on the current time, strikes, and blink flag
void updateDisplay()
{
    // Blinking logic
    // Check if this is the blanking part of the blink cycle if we are blinking
    if (displayBlinking && !displayBlankedLast)
    {
        // Blank the display and set the blanked flag
        MAX7219_Clear();
        displayBlankedLast = true;

        // Stop here
        return;
    }
    else
    {
        // Reset the blanked flag
        displayBlankedLast = false;
    }

    // Actually update the display with content
    // Check which message we should display
    if (strikes == maxStrikes || timeRemaining < 0) // Are we dead?
    {
        // Write 'DEAD'
        MAX7219_DisplayChar(1, 'D', false);
        MAX7219_DisplayChar(2, 'E', false);
        MAX7219_DisplayChar(3, 'A', false);
        MAX7219_DisplayChar(4, 'D', false);
    }
    else
    {
        // Write remaining time
        displayTimeRemaining();
    }
}

// Displays the current time remaining
void displayTimeRemaining()
{
    displayTime(timeRemaining);
}

// Displays the given time in seconds
//   s: Time in seconds
void displayTime(int s)
{
    // Check if we have passed the point of no return
    if (timeRemaining < 0)
    {
        // 'Line-out' the display since we can't do negative numbers
        for (int i = 1; i <= 4; i++)
        {
            MAX7219_DisplayChar(i, '-', false);
        }
    }
    else
    {
        // Split the remaining time down into digits and display them
        int minutes = s / 60;
        int seconds = s - (minutes * 60);
        MAX7219_DisplayChar(1, (char) ((int)(minutes / 10) + 48), false); // Values are offset by 48 for ASCII
        MAX7219_DisplayChar(2, (char) ((int)(minutes % 10) + 48), true); // DP enabled to show a ':'
        MAX7219_DisplayChar(3, (char) ((int)(seconds / 10) + 48), true); // between digits 2 and 3
        MAX7219_DisplayChar(4, (char) ((int)(seconds % 10) + 48), false);
    }
}

void onLowpower()
{
    solved = true;
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

// Beeps for the given number of milliseconds
void beep(int duration)
{
    // Write the pin high
    BUZZER_PORT |= 1 << BUZZER_PIN;

    // Hacky workaround for runtime-variable delay
    while (duration-- > 0) _delay_ms(1);

    // Write the pin low
    BUZZER_PORT &= ~(1 << BUZZER_PIN);
}

// Adjusts the time remaining with the given delta value, capping at 0 and 5999
//   delta: Number of seconds to adjust by, can be positive or negative
void adjustTimeRemaining(int delta)
{
    // Apply the change
    timeRemaining += delta;

    // Cap at the lower and upper boundaries
    if (timeRemaining < 0) timeRemaining = 0;
    if (timeRemaining > 5999) timeRemaining = 5999;
}