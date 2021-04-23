#include<stdio.h>
#include <stdlib.h>
#include<math.h>
#include "types.h"

struct Rgb {
   int r;
   int g;
   int b;
};

// struct Rgb* Rgb(int r, int g, int b) {
//     struct Rgb* color = malloc(sizeof(struct Rgb));
//     color->r = r;
//     color->g = g;
//     color->b = b;
//     return color;
// }

struct rgb* Rgb(int r, int g, int b) {
    struct rgb *color = malloc(sizeof(struct rgb));
    color->r = r;
    color->g = g;
    color->b = b;
    return color;
}

int getR_rgb(struct rgb* rgb) {
    return rgb->r;
}

struct rgb* setR_rgb(struct rgb* rgb, int r_new) {
    rgb->r = r_new;
 
    return rgb;
}

