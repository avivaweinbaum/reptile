#include<stdio.h>
#include<math.h>
#include "png.h"


typedef struct rgb {
    int r;
    int g;
    int b;
} rgb;

struct pointer {
    int x;
    int y;
    struct rgb color;
    float angle;
};

struct canvas {
    int x;
    int y;
    libattopng_t* png;
};

struct file {
    char *filename;
    struct canvas canvas;
};

struct rgb* Rgb(int r, int g, int b);
struct canvas* Canvas(int x, int y);
struct pointer* Pointer(int x, int y, struct rgb* color, float angle);
struct file* File(char *filename, struct canvas* canvas);