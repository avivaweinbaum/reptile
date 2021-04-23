#include "png.h"
#include "types.h"
#include <string.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#define RGBA(r, g, b, a) ((r) | ((g) << 8) | ((b) << 16) | ((a) << 24))
// libattopng_t *png;

// void create(struct canvas* canvas) {
//     png = libattopng_new(canvas->x, canvas->y, PNG_RGBA);
// }

struct canvas* pixel(struct canvas* can, struct rgb* color, int x, int y) {

    libattopng_set_pixel(can->png, x, y, RGBA(0 & 255, 0 & 255, 0, (255 )));
    return can;
}

void save(struct canvas* can, char *filename) {
    libattopng_save(can->png, filename);
    libattopng_destroy(can->png);
}
