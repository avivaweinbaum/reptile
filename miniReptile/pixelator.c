#include "png.h"
#include "types.h"
#include <string.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#define RGBA(r, g, b, a) ((r) | ((g) << 8) | ((b) << 16) | ((a) << 24))

struct canvas* pixel(struct canvas* can, struct rgb* color, int x, int y) {

    libattopng_set_pixel(can->png, x, y, RGBA(get_rgb_r(color) & 255, get_rgb_g(color) & 255, get_rgb_b(color) & 255, (255 )));
    return can;
}

void save(struct canvas* can, char *filename) {
    libattopng_save(can->png, filename);
    libattopng_destroy(can->png);
}
