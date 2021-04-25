#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>

#define PI 3.14159265


double sine(double angle) {
    double val = PI / 180.0;
    double sinval = sin(angle*val);
    return sinval;
}

double cosine(double angle) {
    double val = PI / 180.0;
    double cosval = cos(angle*val);
    return cosval;
}

double tangeant(double angle) {
    double val = PI / 180.0;
    double tanval = tanh(angle*val);
    return tanval;
} 

int mod(int val1, int val2) {
    return val1 % val2;
}

int floors(float val1) {
    int my_int;
    my_int = (int)val1;
    return my_int;
}

int getRise(int distance, double angle) {
    return (int) (distance * sin(angle));
}

int getRun(int distance, double angle) {
    return (int) (distance * cos(angle));
}