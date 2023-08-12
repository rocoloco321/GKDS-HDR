#include "devkitpro.h"
#include "mkds/os.h"

#ifndef _FS_H
#define _FS_H

typedef struct
{
	struct FSFile *prev;
	struct FSFile *next;
} FSFileLink;

typedef struct
{
	struct FSArchive *arc;
	u16 own_id;
	u16 index;
	u32 pos;
} FSDirPos;

//typedef u8 FSFile[72];
typedef struct FSFile
{
	FSFileLink link;		//+0x00
	struct FSArchive *arc;		//+0x08
	u32 stat;			//+0x0C
	u32 command;			//+0x10
	u32 error;			//+0x14
	OSThreadQueue queue[1]; //?	//+0x18
	
	union {
		struct {
			u32 own_id;	//+0x20
			u32 top;	//+0x24
			u32 bottom;	//+0x28
			u32 pos;	//+0x2C
		} file;
		struct {
			FSDirPos pos;	//+0x20
			u32 parent;	//+0x2C
		} dir;
	} prop;
	void *arg;			//+0x30
	u8 pad[72-0x34];
} FSFile;

typedef enum
{
    FS_SEEK_SET,                       /* seek from begin */
    FS_SEEK_CUR,                       /* seek from current */
    FS_SEEK_END                        /* seek from end */
}
FSSeekFileMode;

#ifdef __cplusplus
extern "C"
{
#endif
	
	bool FS_CloseFile(void *p_file);
	static inline u32 FS_GetPosition(const FSFile *p_file);
	static inline BOOL FS_SeekFileToBegin(FSFile *p_file);
	void FS_InitFile(void *p_file);
	bool FS_OpenFile(void *p_file, const char *path);
	bool FS_OpenFileFast(FSFile* p_file, void* archivePtr, int file_id);
	s32  FS_ReadFile(void *p_file, void *dst, s32 len);
	s32  FS_ReadFileAsync(void *p_file, void *dst, s32 len);
	bool FS_SeekFile(void *p_file, s32 offset, FSSeekFileMode origin);
	bool FS_WaitAsync(void *p_file);
	
	bool FS_LoadOverlay(int target, int id);
	bool FS_UnloadOverlay(int target, int id);

	static inline u32 FS_GetPosition(const FSFile *p_file)
	{
		return ((u32*)p_file)[0xB] - ((u32*)p_file)[9];
	}
	static inline BOOL FS_SeekFileToBegin(FSFile *p_file)
	{
		return FS_SeekFile(p_file, 0, FS_SEEK_SET);
	}
	
#ifdef __cplusplus
}
#endif

#endif