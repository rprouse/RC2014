// zcc +cpm -O3 -olcd.com lcd.c

#include <stdio.h>
#include <stdlib.h>
#include <cpm.h>

int main(void)
{
    printf("\e[31MHello World\e[39;49m\n");
}