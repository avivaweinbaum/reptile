#include<stdio.h>
#include<math.h>
#include <stdlib.h>
#include "types.h"
#include "png.h"

struct Canvas {
    int x;
    int y;
};

// struct Canvas* Canvas(int x, int y) {
//     struct Canvas* can = malloc(sizeof(struct Canvas));    
//     can->x = x;
//     can->y = y;
//     return can;
// }

struct canvas Canvas(int x, int y) {
    struct canvas can;    
    can.x = x;
    can.y = y;

    return can;
}