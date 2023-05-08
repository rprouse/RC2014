// zcc +cpm -O3 -osound.com sound.c

#include <stdio.h>
#include <stdlib.h>
#include <arch/z80.h>

#define reg 216
#define dat 208

int main(void)
{
    // Select the mixer register and enable channel A
    outp(reg, 7);
    outp(dat, 62);

    // Set channel A volume to max
    outp(reg, 8);
    outp(dat, 15);

    // Select channel A pitch
    outp(reg, 0);
    for (uint8_t i=0; i <= 254; i++)
    {
        outp(dat, i);
        z80_delay_ms(50);
    }

    // TODO: Turn sound off
    return 0;
}