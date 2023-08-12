#include "../../mkds.h"
typedef char   undefined;
typedef int    dword;
typedef long long    qword;
typedef char    uchar;
typedef int    uint;
typedef char    undefined1;
typedef short    undefined2;
typedef int    undefined4;
typedef short    ushort;
typedef short    word;
typedef int*  pointer;
typedef struct charkart_t charkart_t, *Pcharkart_t;

typedef struct model_t model_t, *Pmodel_t;

typedef struct charkart_field24_t charkart_field24_t, *Pcharkart_field24_t;

typedef struct light_t light_t, *Plight_t;

typedef struct charkart_colors_t charkart_colors_t, *Pcharkart_colors_t;

typedef struct anim_animator_t anim_animator_t, *Panim_animator_t;

typedef struct NNSG3dRenderObj NNSG3dRenderObj, *PNNSG3dRenderObj;

typedef struct model_res_t model_res_t, *Pmodel_res_t;

typedef struct NNSFndLink NNSFndLink, *PNNSFndLink;

struct charkart_colors_t {
    word diffuse;
    word emission;
    word ambient;
    word diffR;
    word diffG;
    word diffB;
    word diffRDelta;
    word diffGDelta;
    word diffBDelta;
    word emiR;
    word emiG;
    word emiB;
    word emiRDelta;
    word emiGDelta;
    word emiBDelta;
    word ambiR;
    word ambiG;
    word ambiB;
    word ambiRDelta;
    word ambiGDelta;
    word ambiBDelta;
    word progress;
};

struct anim_animator_t {
    word loopMode;
    word hasEnded;
    dword animLength;
    dword speed;
    dword progress;
    word loopIteration;
    word loopCount;
};

struct light_t {
    word color;
    word r;
    word g;
    word b;
    word rDelta;
    word gDelta;
    word bDelta;
    word lightMask;
    word progress;
};

struct NNSFndLink {
    pointer prevObject;
    pointer nextObject;
};

struct model_res_t {
    struct NNSFndLink link;
    void * nsbmd;
    dword texRes;
};

struct charkart_field24_t {
    dword field_0;
    dword field_4;
    dword field_8;
    dword field_C;
    word field_10;
    undefined field_0x12;
    undefined field_0x13;
    dword field_14;
    word field_18;
    word field_1A;
};

struct NNSG3dRenderObj {
    dword flag;
    pointer resMdl;
    dword anmMat;
    pointer funcBlendMat;
    dword anmJnt;
    pointer funcBlendJnt;
    dword anmVis;
    pointer funcBlendVis;
    dword cbFunc;
    byte cbCmd;
    byte cbTiming;
    word dummy_;
    dword cbInitFunc;
    dword ptrUser;
    dword ptrUserSbc;
    dword recJntAnm;
    dword recMatAnm;
    dword hintMatAnmExist;
    undefined field_0x40;
    undefined field_0x41;
    undefined field_0x42;
    undefined field_0x43;
    dword hintJntAnmExist;
    undefined field_0x48;
    undefined field_0x49;
    undefined field_0x4a;
    undefined field_0x4b;
    dword hintVisAnmExist;
    undefined field_0x50;
    undefined field_0x51;
    undefined field_0x52;
    undefined field_0x53;
};

struct charkart_t {
    dword characterId;
    dword kartId;
    pointer characterNsbcaAnim;
    pointer characterNsbtpAnim;
    pointer characterModel;
    struct model_t * kartModel;
    pointer kartTireModel;
    struct model_t * kartShadowModel;
    pointer kartOffsetData;
    struct charkart_field24_t field_24;
    struct light_t light;
    undefined field_0x52;
    undefined field_0x53;
    dword field_54;
    dword isKartInvisible;
    dword isCharacterInvisible;
    dword useSeparateTires;
    dword inStarToonMode;
    word kartABC;
    struct charkart_colors_t colors;
    undefined field_0x96;
    undefined field_0x97;
    struct anim_animator_t field_98;
    dword nsbtpAnimDisabled;
    dword field_B0;
};

struct model_t {
    struct NNSG3dRenderObj renderObj;
    dword cullReversed;
    dword render1Mat1Shp;
    struct model_res_t res;
    undefined2 field_0x6c;
    undefined2 field_0x6e;
    ushort field_0x70;
};

