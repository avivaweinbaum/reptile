#include "types.h"
#include "png.h"
#include <string.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

libattopng_t *png;

void create(struct canvas canvas) {
    png = libattopng_new(canvas.x, canvas.y, PNG_RGBA);
}

struct pointer pixel(struct pointer pointer, int x, int y) {

    libattopng_set_pixel(png, x, y, 0x77073096);

    pointer.x = x;
    pointer.y = y;
    return pointer;
}


void save(char *filename) {
    libattopng_save(png, filename);
    libattopng_destroy(png);
}
