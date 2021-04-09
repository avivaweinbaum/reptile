#include<stdio.h>
#include<math.h>
#include <stdlib.h>
#include "types.h"


struct Pointer {
     int x;
     int y;
     struct Rgb* color;
     float angle;
};

struct Pointer* Pointer(int x, int y, struct Rgb* color, float angle) {
    struct Pointer* point = malloc(sizeof(struct Pointer));
    point->x = x;
    point->y = y;
    point->color = color;
    point->angle = angle;
    return point;
}