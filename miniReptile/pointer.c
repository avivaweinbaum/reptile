#include<stdio.h>
#include<math.h>
#include <stdlib.h>
#include "types.h"


// struct Pointer {
//      int x;
//      int y;
//      struct Rgb color;
//      float angle;
// };

// struct Pointer* Pointer(int x, int y, struct Rgb* color, float angle) {
//     struct Pointer* point = malloc(sizeof(struct Pointer));
//     point->x = x;
//     point->y = y;
//     point->color = color;
//     point->angle = angle;
//     return point;
// }

struct pointer Pointer(int x, int y, struct rgb color, float angle) {
    struct pointer point;
    point.x = x;
    point.y = y;
    point.color = color;
    point.angle = angle;
    return point;
}