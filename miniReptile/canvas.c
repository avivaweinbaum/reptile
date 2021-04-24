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

struct canvas* Canvas(int x, int y) {
    struct canvas *can = malloc(sizeof(struct canvas));    
    can->x = x;
    can->y = y;
    can->png = libattopng_new(x, y, PNG_RGBA);
    return can;
}

int get_canvas_x(struct canvas* canvas) {
    return canvas->x;
}

int get_canvas_y(struct canvas* canvas) {
    return canvas->y;
}