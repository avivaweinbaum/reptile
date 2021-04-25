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

struct pointer* set_pointer_color(struct pointer* pointer, struct rgb* rgb) {
    return Pointer(pointer->x, pointer->y, rgb, pointer->angle);
}