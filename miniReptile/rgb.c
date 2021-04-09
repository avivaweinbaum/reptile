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
//     struct Rgb* color;
//     color->r = r;
//     color->g = g;
//     color->b = b;
//     return color;
// }
struct Rgb* Rgb(int r, int g, int b) {
    struct Rgb* color = malloc(sizeof(struct Rgb));
    color->r = r;
    color->g = g;
    color->b = b;
    return color;
}

 