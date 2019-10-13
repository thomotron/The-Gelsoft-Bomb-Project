// Macro and function definitions for a MC11605A6W7-BNMLW LCD
// connected via a 74HC595N shift register

#include <stdbool.h>
#include "portpin.h"

void init_shift(portpin data, portpin shift_clock, portpin reg_clock, portpin clear);
void init_lcd(portpin enable, portpin rw, portpin rs, portpin backlight);
void cmd_clear();
void cmd_home();
void cmd_entry_mode(bool increment, bool shift_display);
void cmd_display_control(bool display_toggle, bool cursor_toggle, bool blink_toggle);
void cmd_cursor_shift(bool move_cursor, bool shift_right);
void cmd_function_set(bool eight_bit, bool two_line, bool high_resolution);
void cmd_set_cgram(unsigned char address);
void cmd_set_ddram(unsigned char address);
void cmd_write_ram(unsigned char data);
void write_shift_register(unsigned char value);
void write_lcd(bool rs, bool rw, unsigned char value);
