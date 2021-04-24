#include<stdio.h>
#include<math.h>
#include "png.h"


typedef struct rgb {
    int r;
    int g;
    int b;
} rgb;

typedef struct pointer {
    int x;
    int y;
    struct rgb color;
    float angle;
} pointer;

struct canvas {
    int x;
    int y;
    libattopng_t* png;
};

struct rgb* Rgb(int r, int g, int b);
struct canvas* Canvas(int x, int y);
struct pointer* Pointer(int x, int y, struct rgb* color, float angle);
int getR_rgb(struct rgb* rgb);
struct rgb* setR_rgb(struct rgb* rgb, int r_new);