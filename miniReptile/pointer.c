#include<stdio.h>
#include<math.h>
#include <stdlib.h>
#include "types.h"


struct Pointer {
    int x;
    int y;
    struct rgb* color;
    float angle;
};

struct pointer* Pointer(int x, int y, struct rgb* color, float angle) {
    struct pointer *point = malloc(sizeof(struct pointer));
    point->x = x;
    point->y = y;
    point->color = *color;
    point->angle = angle;
    return point;
}

int get_pointer_x(struct pointer* pointer) {
    return pointer->x;
}

int get_pointer_y(struct pointer* pointer) {
    return pointer->y;
}

struct pointer* set_pointer_xy(struct pointer* pointer, int x_new, int y_new) {
    pointer->x = x_new;
    pointer->y = y_new;
    return pointer;
    // struct rgb *color = pointer->color;
    // return Pointer(x_new, y_new, color, pointer->angle);
}

struct pointer* set_pointer_color(struct pointer* pointer, struct rgb* rgb) {
    pointer->color = *rgb;
    return pointer;
}


// struct rgb* setR_rgb(struct rgb* rgb, int r_new) {
//     rgb->r = r_new;
 
//     return rgb;
// }