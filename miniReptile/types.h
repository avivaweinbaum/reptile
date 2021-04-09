#include<stdio.h>
#include<math.h>


/* struct Rgb {
    int r;
    int g;
    int b;
};

struct Pointer {
    int x;
    int y;
    Rgb color;
    float angle;
};

struct Canvas {
    int x;
    int y;
};

struct File {
    char filename;
    Canvas canvas;
}; */

struct Rgb* Rgb(int r, int g, int b);
struct Canvas* Canvas(int x, int y);
struct Pointer* Pointer(int x, int y, struct Rgb* color, float angle);
struct File* File(char filename, struct Canvas* canvas);

// typedef struct Rgb Rgb;
// typedef struct Canvas Canvas;
// typedef struct Pointer Pointer;
// typedef struct File File; 