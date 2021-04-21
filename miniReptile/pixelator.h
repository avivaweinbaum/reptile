#include <stdio.h>
#include <stdint.h>
#include "types.h"

#ifndef _PIXELATOR_H_
#define _PIXELATOR_H_
#endif

void create(struct canvas canvas);

struct pointer pixel(struct pointer pointer, int x, int y);

void save(char *filename);
