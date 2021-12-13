/* ==================================================================================== */
/*     Copyright (c) 2016-2021 QUALCOMM Technologies, Inc. and/or its subsidiaries.     */
/*                           All Rights Reserved.                                       */
/*                  QUALCOMM Confidential and Proprietary                               */
/* ==================================================================================== */

#ifndef ION_ALLOCATION_H
#define ION_ALLOCATION_H

#include <android/log.h>
#include <dlfcn.h>
#include <fcntl.h>
#include <pthread.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <unistd.h>

void alloc_init();
void alloc_finalize();
void *alloc_ion(size_t size);
void alloc_ion_free(void *ptr);
#endif
