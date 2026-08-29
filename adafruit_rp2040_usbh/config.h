#pragma once

#pragma weak backing_store_lock
#pragma weak backing_store_unlock

#define NO_DEBUG
#define NO_PRINT
#define FORCE_NKRO
#define TAPPING_TERM 300

#ifdef CRT0_EXTRA_CORES_NUMBER
#undef CRT0_EXTRA_CORES_NUMBER
#endif
#define CRT0_EXTRA_CORES_NUMBER 1
