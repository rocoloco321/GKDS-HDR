#include "devkitpro.h"

#ifndef _RTC_H
#define _RTC_H

typedef struct
{
	u32 hour;
	u32 minute;
	u32 second;
}
RTCTime;

typedef struct
{
	u32 year;
	u32 month;
	u32 day;
	int week;
}
RTCDate;

typedef void (*RTCCallback) (int result, void *arg);

#ifdef __cplusplus
extern "C"
{
#endif

	s64 RTC_ConvertDateTimeToSecond(const RTCDate *date, const RTCTime *time);
	s32 RTC_ConvertDateToDay(const RTCDate *date);
	int RTC_GetDate(RTCDate *date);
	int RTC_GetDateAsync(RTCDate *date, RTCCallback callback, void *arg);
	int RTC_GetTime(RTCTime *time);
	int RTC_GetTimeAsync(RTCTime *time, RTCCallback callback, void *arg);
	void RTC_Init(void);

#ifdef __cplusplus
}
#endif

#endif