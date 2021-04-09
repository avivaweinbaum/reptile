#include<stdio.h>
#include<math.h>
#include <stdlib.h>
#include "types.h"

struct Canvas {
    int x;
    int y;
};

struct Canvas* Canvas(int x, int y) {
    struct Canvas* can = malloc(sizeof(struct Canvas));    
    can->x = x;
    can->y = y;
    return can;
}