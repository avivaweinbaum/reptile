#include<stdio.h>
#include<math.h>
#include <stdlib.h>
#include <string.h>
#include "types.h"


// struct File {
//     char *filename;
//     struct Canvas canvas;
// };

// struct File* File(char filename, struct Canvas* canvas) {
//     struct File* f = malloc(sizeof(struct File));
//     f->filename = filename;
//     f->canvas = canvas;
//     return f;
// }

struct file File(char *filename, struct canvas canvas) {
    struct file f;
    char str1[20];
    f.filename = strcpy(str1, filename);
    f.canvas = canvas;
    return f;
}