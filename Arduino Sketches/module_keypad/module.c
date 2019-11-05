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

// Define some macros for the keypad pins
#define KEY_COL1_PORT PORTD
#define KEY_COL1_PIN 1
#define KEY_COL2_PORT PORTD
#define KEY_COL2_PIN 2
#define KEY_COL3_PORT PORTD
#define KEY_COL3_PIN 3
#define KEY_ROW1_PORT PORTD
#define KEY_ROW1_PIN 4
#define KEY_ROW2_PORT PORTD
#define KEY_ROW2_PIN 5
#define KEY_ROW3_PORT PORTD
#define KEY_ROW3_PIN 6
#define KEY_ROW4_PORT PORTD
#define KEY_ROW4_PIN 7

// Define some macros for sequence generation
#define SEQUENCE_LENGTH ((unsigned char) 7)

// Define some macros for type shortcuts
#define byte unsigned char

// Function prototypes
void init();
int main();
void onDisarm(bool disarm);
void onLowPower(bool enabled);
void writeBit(bool bit);
void writeByteMSB(byte b);
byte getRandom();
void generateSequence();
void updateKeypadState();
bool readKeypadKey(unsigned char port, unsigned char row_pin, unsigned char column_pin);
byte getNumKeysPressed();
bool getKeypadKey(char key);

// Consts
const char keypadChars[] = {'0','1','2','3','4','5','6','7','8','9','*','#'};
const byte sequenceLength = SEQUENCE_LENGTH;

// State variables
bool running = true;
unsigned short ptrRnd = 0;
char sequence[SEQUENCE_LENGTH];
byte sequenceIndex;

// Interrupt states
bool disarmPinLast;
bool lowPowerPinLast;

// Keypad state
bool keypadState[4][3] =
{
    { // Row 1
        false, // Button 1
        false, // Button 2
        false  // Button 3
    },
    { // Row 2
        false, // Button 4
        false, // Button 5
        false  // Button 6
    },
    { // Row 3
        false, // Button 7
        false, // Button 8
        false  // Button 9
    },
    { // Row 4
        false, // Button 10
        false, // Button 11
        false  // Button 12
    }
};
byte numKeysPressed = 0;

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
    while (running)
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

        // Update the keypad state and check it against the current sequence
        updateKeypadState();
        if (getNumKeysPressed == 1 && getKeypadKey(sequence[sequenceIndex]))
        {
            // Move to the next item in the sequence
            sequenceIndex++;

            // Check if we have finished the sequence
            if (sequenceIndex == sequenceLength)
            {
                // TODO: Mark as defused
            }

            // TODO: Update the LCD
        }
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
void writeByteMSB(byte b)
{
    // Iterate from MSB to LSB
    for (int i = 7; i >= 0; i--)
    {
        // Mask the relevant bit and write it
        writeBit(b & (1 << i));
    }
}

// Read a random value from randomvals.h, wrap when reaching the end of the table.
byte getRandom()
{
    byte rnd = pgm_read_byte(&(random0[ptrRnd++]));

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

// Probes the keypad and updates the stored state of each key
void updateKeypadState()
{
    // 1, 2, 3
    keypadState[0][0] = readKeypadKey(KEY_ROW1_PORT, KEY_ROW1_PIN, KEY_COL1_PIN);
    keypadState[0][1] = readKeypadKey(KEY_ROW1_PORT, KEY_ROW1_PIN, KEY_COL2_PIN);
    keypadState[0][2] = readKeypadKey(KEY_ROW1_PORT, KEY_ROW1_PIN, KEY_COL3_PIN);

    // 4, 5, 6
    keypadState[1][0] = readKeypadKey(KEY_ROW2_PORT, KEY_ROW2_PIN, KEY_COL1_PIN);
    keypadState[1][1] = readKeypadKey(KEY_ROW2_PORT, KEY_ROW2_PIN, KEY_COL2_PIN);
    keypadState[1][2] = readKeypadKey(KEY_ROW2_PORT, KEY_ROW2_PIN, KEY_COL3_PIN);

    // 7, 8, 9
    keypadState[2][0] = readKeypadKey(KEY_ROW3_PORT, KEY_ROW3_PIN, KEY_COL1_PIN);
    keypadState[2][1] = readKeypadKey(KEY_ROW3_PORT, KEY_ROW3_PIN, KEY_COL2_PIN);
    keypadState[2][2] = readKeypadKey(KEY_ROW3_PORT, KEY_ROW3_PIN, KEY_COL3_PIN);

    // *, 0, #
    keypadState[3][0] = readKeypadKey(KEY_ROW4_PORT, KEY_ROW4_PIN, KEY_COL1_PIN);
    keypadState[3][1] = readKeypadKey(KEY_ROW4_PORT, KEY_ROW4_PIN, KEY_COL2_PIN);
    keypadState[3][2] = readKeypadKey(KEY_ROW4_PORT, KEY_ROW4_PIN, KEY_COL3_PIN);
}

// Probes an individual keypad key on the given port, row, and column
bool readKeypadKey(unsigned char port, unsigned char row_pin, unsigned char column_pin)
{
    // Write the row high
    port |= (1 << row_pin);

    // Get the pin state
    bool state = ((port >> column_pin) & 1);

    // Write the row low
    port &= ~(1 << row_pin);

    // Return the state we got
    return state;
}

// Gets the number of keypad keys currently pressed
byte getNumKeysPressed()
{
    byte num;

    for (byte y = 0; y < 4; y++)
    {
        for (byte x = 0; x < 3; x++)
        {
            num += keypadState[y][x];
        }
    }
}

// Gets the key state for the given keypad character
bool getKeypadKey(char key)
{
    // Sanity check, make sure it's only #, *, or 0-9
    if ((key != 35 || key != 42) && (key < 48 || key > 57)) return false;

    switch (key)
    {
        case '*': // #
            return keypadState[3][0];
        case '0': // 0
            return keypadState[3][1];
        case '#': // *
            return keypadState[3][2];
        default: // 0-9
            // Subtract 43 from the key to compensate for ASCII and zero
            key -= 43;
            return keypadState[key / 3][key % 3];
    }
}
