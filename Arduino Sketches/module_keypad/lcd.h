// Macro and function definitions for a MC11605A6W7-BNMLW LCD
// connected via a 74HC595N shift register

#include <stdbool.h>
#include "portpin.h"

void init_shift(portpin data, portpin shift_clock, portpin reg_clock, portpin clear);
void init_lcd(portpin enable, portpin rw, portpin rs, portpin backlight);
void _cmd_clear();
void _cmd_home();
void _cmd_entry_mode(bool increment, bool shift_display);
void _cmd_display_control(bool display_toggle, bool cursor_toggle, bool blink_toggle);
void _cmd_cursor_shift(bool move_cursor, bool shift_right);
void _cmd_function_set(bool eight_bit, bool two_line, bool high_resolution);
void _cmd_set_cgram(unsigned char address);
void _cmd_set_ddram(unsigned char address);
void _cmd_write_ram(unsigned char data);
void write_shift_register(unsigned char value);
void write_lcd(bool rs, bool rw, unsigned char value);

void lcd_write(char* string);
void lcd_clear();
void lcd_home();
