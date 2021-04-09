#include<stdio.h>
#include<math.h>

struct Rgb {
    int r;
    int g;
    int b;
};

struct Rgb Rgb(int r, int g, int b) {
    struct Rgb color;
    color.r = r;
    color.g = g;
    color.b = b;
    return color;
}

 