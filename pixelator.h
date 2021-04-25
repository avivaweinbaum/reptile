#include <stdio.h>
#include <stdint.h>
#include "types.h"
#include "png.h"

#ifndef _PIXELATOR_H_
#define _PIXELATOR_H_
#endif


struct canvas* pixel(struct canvas* can, struct rgb* color, int x, int y);

void save(struct canvas* can, char *filename);
