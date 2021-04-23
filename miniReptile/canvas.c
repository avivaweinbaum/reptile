#include<stdio.h>
#include<math.h>
#include <stdlib.h>
#include "types.h"
#include "png.h"

struct Canvas {
    int x;
    int y;
    libattopng_t *png;
};

// struct Canvas* Canvas(int x, int y) {
//     struct Canvas* can = malloc(sizeof(struct Canvas));    
//     can->x = x;
//     can->y = y;
//     return can;
// }

struct canvas* Canvas(int x, int y) {
    struct canvas *can = malloc(sizeof(struct canvas));    
    can->x = x;
    can->y = y;
    can->png = libattopng_new(x, y, PNG_RGBA);
    return can;
}

// void destroy_canvas (struct canvas* this) {
//     libattopng_destroy(this->png);
// }