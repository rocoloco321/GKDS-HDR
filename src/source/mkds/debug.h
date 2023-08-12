#include "devkitpro.h"

#ifndef _DEBUG_H
#define _DEBUG_H

#define __debugbreak() asm("bkpt")

#ifdef __cplusplus
extern "C"
{
#endif

	static inline void Break()
	{
		asm volatile("mov r11, r11");
	}
	
#ifdef __cplusplus
}
#endif

#endif