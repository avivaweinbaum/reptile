#include<stdio.h>
#include <stdlib.h>
#include<math.h>
#include "types.h"

struct Rgb {
   int r;
   int g;
   int b;
};

struct rgb* Rgb(int r, int g, int b) {
    struct rgb *color = malloc(sizeof(struct rgb));
    color->r = r;
    color->g = g;
    color->b = b;
    return color;
}

int get_rgb_r(struct rgb* rgb) {
    return rgb->r;
}
int get_rgb_g(struct rgb* rgb) {
    return rgb->g;
}
int get_rgb_b(struct rgb* rgb) {
    return rgb->b;
}
