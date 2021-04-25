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
int get_rgb_r(struct rgb* rgb);
int get_rgb_g(struct rgb* rgb);
int get_rgb_b(struct rgb* rgb);