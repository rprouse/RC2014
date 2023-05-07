// Advent of Code 2015 Day 1
//
// zcc +cpm -O3 -o1501a.com 1501a.c

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>

#define TRUE  1
#define FALSE 0
typedef char  BOOL;

int main(void)
{
    FILE *fp = fopen("1501.DAT","r");
    if (fp == NULL)
    {
        printf("Failed to open 1501.DAT\n");
        return -1;
    }

    register int c;
    int floor = 0;
    int count = 0;
    BOOL found = FALSE;
    while ((c = getc(fp)) != EOF)
    {
        if (c == '(') ++floor;
        else if (c == ')') --floor;
        if (!found)
        {
            ++count;
            if (floor == -1)
                found = TRUE;
        }
    }
    printf("Part A: %d\n", floor);
    printf("Part B: %d\n", count);

    fclose(fp);
    return 0;
}

