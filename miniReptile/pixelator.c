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


void save(struct file file) {
    int x = libattopng_save(png, strcat(file.filename, ".png"));
    printf(x);
    //libattopng_save(png, strcat("hello", ".png"));
    libattopng_destroy(png);
}