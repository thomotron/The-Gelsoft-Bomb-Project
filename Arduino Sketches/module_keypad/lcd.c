#include "lcd.h"

struct shift_register {
    portpin data;
    portpin shift_clock;
    portpin reg_clock;
    portpin clear;
};
struct shift_register shift_register;

struct lcd {
    portpin enable;
    portpin rw;
    portpin rs;
    portpin backlight;
};
struct lcd lcd;

// Initialises the shift register pin data struct
void init_shift(portpin data, portpin shift_clock, portpin reg_clock, portpin clear)
{
    // Initialise the shift register struct
    shift_register = (struct shift_register)
    {
        data,
        shift_clock,
        reg_clock,
        clear
    };
}

// Initialises the LCD pin data struct
void init_lcd(portpin enable, portpin rw, portpin rs, portpin backlight)
{
    // Initialise the LCD struct
    lcd = (struct lcd) {
        enable,
        rw,
        rs,
        backlight
    };
}

// Clears the LCD
void cmd_clear()
{
    write_lcd(false, false, 0b00000001);
}

// Resets the cursor position to the first character space
void cmd_home()
{
    write_lcd(false, false, 0b00000010);
}

// Sets the direction the cursor and display will move
void cmd_entry_mode(bool increment, bool shift_display)
{
    write_lcd(false, false, 0b00000100 | (increment << 1) | shift_display);
}

// Toggles the display, cursor, and cursor blink
void cmd_display_control(bool display_toggle, bool cursor_toggle, bool blink_toggle)
{
    write_lcd(false, false, 0b00001000 | (display_toggle << 2) | (cursor_toggle << 1) | blink_toggle);
}

// Shift the cursor or the display left or right
void cmd_cursor_shift(bool move_cursor, bool shift_right)
{
    write_lcd(false, false, 0b00010000 | (move_cursor << 3) | (shift_right << 2));
}

// Configures the LCD operating mode, including number of register lines to use,
// whether to use two lines or just one, and whether to use 5x11 or 5x9 pixel
// characters
void cmd_function_set(bool eight_bit, bool two_line, bool high_resolution)
{
    write_lcd(false, false, 0b00100000 | (eight_bit << 4) | (two_line << 3) | (high_resolution << 2));
}

// Set the CGRAM address
void cmd_set_cgram(unsigned char address)
{
    write_lcd(false, false, 0b01000000 | (address & 0b00111111));
}

// Set the DDRAM address
void cmd_set_ddram(unsigned char address)
{
    write_lcd(false, false, 0b10000000 | (address & 0b01111111));
}

// Write the given data to the pre-defined CG/DDRAM address
// Set the XXRAM address prior to executing this command
void cmd_write_ram(unsigned char data)
{
    write_lcd(true, false, data);
}

// Writes a value to the shift register MSB-first
void write_shift_register(unsigned char value)
{
    // Shift in the value MSB-first
    for (unsigned char mask = 0b10000000; mask > 0; mask >>= 1)
    {
        // Write the bit to the data line
        if (value & mask)
            // Set
            shift_register.data.port |= (1 << shift_register.data.pin);
        else
            // Clear
            shift_register.data.port &= ~(1 << shift_register.data.pin);

        // Pulse the shift clock
        shift_register.shift_clock.port |= (1 << shift_register.shift_clock.pin);
        shift_register.shift_clock.port &= ~(1 << shift_register.shift_clock.pin);
    }

    // Pulse the register clock
    shift_register.reg_clock.port |= (1 << shift_register.reg_clock.pin);
    shift_register.reg_clock.port &= ~(1 << shift_register.reg_clock.pin);
}

// Writes the given RS, RW, and register values to the LCD
void write_lcd(bool rs, bool rw, unsigned char value)
{
    // Apply RS
    if (rs)
        // Set
        lcd.rs.port |= (1 << lcd.rs.pin);
    else
        // Reset
        lcd.rs.port &= ~(1 << lcd.rs.pin);

    // Apply RW
    if (rw)
        // Set
        lcd.rw.port |= (1 << lcd.rw.pin);
    else
        // Reset
        lcd.rw.port &= ~(1 << lcd.rw.pin);

    // Write out the register value
    write_shift_register(value);

    // Pulse the clock
    lcd.enable.port |= (1 << lcd.enable.pin);
    lcd.enable.port &= (1 << lcd.enable.pin);
}