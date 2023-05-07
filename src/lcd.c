// zcc +cpm +cpm -O3 -olcd.com lcd.c

#include <stdio.h>
#include <stdlib.h>

#define lcd_comm_port 0x20  // Port addresses. Change as needed.
#define lcd_data_port 0x21

#define lcd_set_8bit 0x3F   // 8-bit port, 2-line display
#define lcd_cursor_on 0x0F  // Turn cursors on
#define lcd_cls 0x01        // Clear the display

#define lcd_line1 128       // CMD to move the cursor to the first char of line 1
#define lcd_line2 192
#define lcd_line3 148
#define lcd_line4 212

#define busy_flag 0x80

void lcd_busy_wait()
{
    while(inp(lcd_comm_port) & busy_flag);
}

// Send a command byte to the LCD
void lcd_send_command(uint8_t command)
{
    lcd_busy_wait();
    outp(lcd_comm_port, command);
}

void lcd_init()
{
    // Initialize the LCD and set cursor to line 1
    lcd_send_command(lcd_set_8bit);
    lcd_send_command(lcd_cursor_on);
    lcd_send_command(lcd_cls);
    lcd_send_command(lcd_line1);
}


// Send a data byte to the LCD
void lcd_send_data(uint8_t data)
{
    lcd_busy_wait();
    outp(lcd_data_port, data);
}

// Send an asciiz string to the LCD
void lcd_send_string(char* str)
{
    for (int i=0; str[i]; i++)
    {
        lcd_send_data(str[i]);
    }
}

int main(void)
{
    lcd_init();
    lcd_send_string("RC2014 Z80 Computer");
    lcd_send_command(lcd_line2);
    lcd_send_string("29752 Bytes free");
    lcd_send_command(lcd_line3);
    lcd_send_string("READY");
    lcd_send_command(lcd_line4);
    lcd_send_string(">");
}