#include "HAP_farf.h"
#undef FARF_LOW
#define FARF_LOW 1
#undef FARF_HIGH
#define FARF_HIGH 1


void halide_print(void *user_context, const char *str) {
    FARF(LOW, "%s", str);
}

void halide_error(void *user_context, const char *msg) {
    FARF(LOW, "In halide_error\n");
    halide_print(user_context, msg);
}
