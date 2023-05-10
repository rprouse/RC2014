// zcc +cpm +cpm -O3 -olcd.com lcd.c

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>

#define lcd_comm_port 0x20  // Port addresses. Change as needed.
#define lcd_data_port 0x21

// Commands
#define lcd_set_8bit 0x3F   // 8-bit port, 2-line display
#define lcd_cursor_on 0x0F  // Turn cursors on
#define lcd_cls 0x01        // Clear the display
#define lcd_home 0x02       // Return cursor home

#define lcd_line1 128       // CMD to move the cursor to the first char of line 1
#define lcd_line2 192
#define lcd_line3 148
#define lcd_line4 212

#define busy_flag 0x80

uint8_t current_line = 0;

// Wait for the BUSY FLAG to clear
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

// Sets the line number 1 to 4 on the LCD
void lcd_set_line(uint8_t line)
{
    lcd_busy_wait();
    current_line = line;
    switch (line)
    {
    case 1:
      lcd_send_command(lcd_line1);
      break;
    case 2:
      lcd_send_command(lcd_line2);
      break;
    case 3:
      lcd_send_command(lcd_line3);
      break;
    case 4:
      lcd_send_command(lcd_line4);
      break;
    default:
      lcd_set_line(1);
      break;
    }
}

// Initialize the LCD
void lcd_init()
{
    // Initialize the LCD and set cursor to line 1
    lcd_send_command(lcd_set_8bit);
    lcd_send_command(lcd_cursor_on);
    lcd_send_command(lcd_cls);
    lcd_set_line(1);
}


// Send a data byte to the LCD
void lcd_send_data(uint8_t data)
{
    lcd_busy_wait();
    outp(lcd_data_port, data);
}

// Send an asciiz string to the LCD
void lcd_send_string(const char* str)
{
    for (uint8_t i=0; str[i]; i++)
    {
        lcd_send_data(str[i]);
    }
}

int main(void)
{
    lcd_init();
    FILE *fp = fopen("LCD.TXT","r");
    if (fp == NULL)
    {
        printf("Failed to open LCD.TXT\n");
        lcd_send_string("Failed to open");
        lcd_set_line(2);
        lcd_send_string("file LCD.TXT.");
        return -1;
    }

    register char c;
    uint8_t line = 1;
    while ((c = getc(fp)) != EOF)
    {
        if (c == '\r')
          continue;

        if (c == '\n')
        {
            lcd_set_line(++line);
            printf("\n");
            continue;
        }
        lcd_send_data(c);
        printf("%c", c);
    }
    return 0;
}