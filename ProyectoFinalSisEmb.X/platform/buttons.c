/* ************************** */
/* ************************** */
/* Section: Included Files                                                    */
/* ************************** */
/* ************************** */
#include <stdbool.h>


/* ************************** */
/* ************************** */
/* Section: File Scope or Global Data                                         */
/* ************************** */
/* ************************** */

static bool BTN2 = false;

/* ************************** */
/* ************************** */
// Section: Interface Functions                                               *
/* ************************** */

void BTN2_Set(void) {
    BTN2 = true;
}

void BTN2_Reset(void) {
    BTN2 = false;
}

bool BTN2_Get(void) {
    return BTN2;
}
/* ***************************
 End of File
 */