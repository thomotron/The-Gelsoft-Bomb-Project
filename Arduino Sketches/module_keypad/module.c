// This file is written to correspond with the
// following pinout:
//
//                     ATMega8
//                   .----v----.
// C6         RESET -| 1    28 |- LCD R/W       C5
// D0    LCD ENABLE -| 2    27 |- LCD REG SEL   C4
// D1   KEYPAD COL1 -| 3    26 |- LCD LED SINK  C3
// D2   KEYPAD COL2 -| 4    25 |- LCD STOR CLK  C2
// D3   KEYPAD COL3 -| 5    24 |- LCD SHFT CLK  C1
// D4   KEYPAD ROW1 -| 6    23 |- LCD DATA      C0
//              Vcc -| 7    22 |- GND
//              GND -| 8    21 |- AREF
// B6   LOWPOWER IN -| 9    20 |- AVCC
// B7  LCD SHFT CLR -| 10   19 |- ISP SCK       B5
// D5   KEYPAD ROW2 -| 11   18 |- ISP MISO      B4
// D6   KEYPAD ROW3 -| 12   17 |- ISP MOSI      B3
// D7   KEYPAD ROW4 -| 13   16 |- DISARM IN     B2
// B0   CORRECT OUT -| 14   15 |- STRIKE OUT    B1
//                   *---------*

#include <avr/io.h>
#include <avr/pgmspace.h>
#include <util/delay.h>
#include <stdbool.h>
#include "randomvals.h"

// Define some macros for the LCD_DATA, LCD_SHFT, and LCD_STOR connections to the SN74HC595
#define LCD_DATA_PORT PORTB
#define LCD_DATA_PIN  0
#define LCD_SHFT_PORT PORTB
#define LCD_SHFT_PIN  1
#define LCD_STOR_PORT PORTC
#define LCD_STOR_PIN 2

// Define some macros for the interrupt pins
#define DISARM_PORT PORTB
#define DISARM_PIN  2
#define LOWPOWER_PORT PORTB
#define LOWPOWER_PIN  6

// Define some macros for other pins
#define LCD_BACKLIGHT_PORT PORTC
#define LCD_BACKLIGHT_PIN 3

// Function prototypes
void init();
void onDisarm();
void onLowPower();
void writeBit(bool bit);
void writeByteMSB(unsigned char byte);
void generateSequence();
unsigned char getRandom();

// Consts
const unsigned char keypadChars[] = {'0','1','2','3','4','5','6','7','8','9','*','#'};
const unsigned char sequenceLength = 7;

// State variables
bool running = true;
unsigned short ptrRnd = 0;
unsigned char sequence[sequenceLength];
unsigned char sequenceIndex;

// Interrupt states
bool disarmPinLast;
bool lowPowerPinLast;

void init()
{
    // Set port I/O directions (0 = in, 1 = out)
    DDRB |= 0b10010011;
    DDRC |= 0b0111111;
    DDRD |= 0b00001111;

    // Populate the sequence buffer with random keypad characters
    generateSequence();
}

int main() {
    // Initialise everything
    init();

    // Enter the Main Run Loop (MRL) -- Advanced military tech right here
    while (true)
    {
        // Check if we should disarm or enter low power mode
        bool disarmPin = (DISARM_PORT >> DISARM_PIN) & 1;
        bool lowPowerPin = (LOWPOWER_PORT >> LOWPOWER_PIN) & 1;

        // Call handlers if the pin state has changed
        if (disarmPin != disarmPinLast) onDisarm(disarmPin);
        if (lowPowerPin != lowPowerPinLast) onLowPower(lowPowerPin);

        // Shift the current state into history
        lowPowerPinLast = lowPowerPin;
        disarmPinLast = disarmPin;

        // TODO: Update display
    }
}

// Handler for disarming the module
void onDisarm(bool disarm)
{
    // TODO: Write defused message to display and stop running
}

// Handler for setting low power state
void onLowPower(bool enabled)
{
    // Source current to the backlight -ve
    if (enabled) LCD_BACKLIGHT_PORT &= ~(1 << LCD_BACKLIGHT_PIN);
    // Sink current from the backlight -ve
    else LCD_BACKLIGHT_PORT |= (1 << LCD_BACKLIGHT_PIN);
}

// Writes a single bit to the given port on the given pin
//   bit: Bit to write
void writeBit(bool bit)
{
    // Set or clear the pin, depending on the bit
    if (bit) LCD_DATA_PORT |= bit << LCD_DATA_PIN;
    else LCD_DATA_PORT &= ~(bit << LCD_DATA_PIN);

    // Pulse the clock
    LCD_SHFT_PORT |= 1 << LCD_SHFT_PIN;
    LCD_SHFT_PORT &= ~(1 << LCD_SHFT_PIN);
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

// Read a random value from randomvals.h, wrap when reaching the end of the table.
unsigned char getRandom()
{
    unsigned char rnd = pgm_read_byte(&(random0[ptrRnd++]));

    if (ptrRnd == sizeof(random0)) ptrRnd = 0;

    return rnd;
}

// Populates the sequence buffer with random keypad characters
void generateSequence()
{
    for (int i = 0; i < sequenceLength; i++)
    {
        // Get a random keypad character and append it
        sequence[i] = keypadChars[getRandom() % 13];
    }
}
