#include <stdbool.h>
#include "lcd.h"
#include "portpin.h"

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

void cmd_clear()
{
    // !RS, !RW
    // 0b00000001
}

void cmd_home()
{
    // !RS, !RW
    // 0b00000010
}

void cmd_entry_mode(bool increment, bool shift_display)
{
    // !RS, !RW
    // 0b000001 + increment + shift_display
}

void cmd_display_control(bool display_toggle, bool cursor_toggle, bool blink_toggle)
{
    // !RS, !RW
    // 0b00001 + display_toggle + cursor_toggle + blink_toggle
}

void cmd_cursor_shift(bool move_cursor, bool shift_right)
{
    // !RS, !RW
    // 0b0001 + move_cursor + shift_right
}

// Configures the LCD operating mode, including number of register lines to use,
// whether to use two lines or just one, and whether to use 5x11 or 5x9 pixel
// characters
void cmd_function_set(bool eight_bit, bool two_line, bool high_resolution)
{
    // !RS, !RW
    // 0b001 + eight_bit + two_line + high_resolution
}

void cmd_set_cgram(unsigned char address)
{
    // !RS, !RW
    // 0b01 + address (6b)
}

void cmd_set_ddram(unsigned char address)
{
    // !RS, !RW
    // 0b1 + address (7b)
}

unsigned char cmd_read_busy_and_address()
{
    // !RS, RW
    // Read-only
}

void cmd_write_ram(unsigned char data)
{
    // RS, !RW
    // 0b + data
}

void cmd_read_ram()
{
    // RS, RW
    // Read-only
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