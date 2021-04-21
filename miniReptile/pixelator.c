#include "png.h"
#include "types.h"
#include <string.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#define RGBA(r, g, b, a) ((r) | ((g) << 8) | ((b) << 16) | ((a) << 24))
libattopng_t *png;

void create(struct canvas canvas) {
    png = libattopng_new(canvas.x, canvas.y, PNG_RGBA);
}

struct pointer pixel(struct pointer pointer, int x, int y) {

    libattopng_set_pixel(png, x, y, RGBA(x & 255, y & 255, 128, (255 - ((x / 2) & 255))));
    libattopng_set_pixel(png, x+1, y+1, RGBA(x & 255, y & 255, 128, (255 - ((x / 2) & 255))));
    libattopng_set_pixel(png, x+2, y+2, RGBA(x & 255, y & 255, 128, (255 - ((x / 2) & 255))));
    pointer.x = x;
    pointer.y = y;
    return pointer;
}

void save(char *filename) {
    libattopng_save(png, filename);
    libattopng_destroy(png);
}
