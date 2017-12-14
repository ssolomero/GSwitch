# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 25 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);

void delay(int);


void waitForVBlank();
void flipPage();
void loadPalette(const unsigned short * palette);





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 160 "myLib.h"
void hideSprites();
# 185 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 195 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile const void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 286 "myLib.h"
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 326 "myLib.h"
typedef struct
{
    int row;
    int col;
    int rdel;
    int cdel;
    int size;
    u16 color;
    int AI_STATE;
} MOVOBJ;
# 26 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 27 "main.c" 2
# 1 "game.h" 1

typedef struct {
 int row;
 int col;
    int rdel;
    int cdel;
 int width;
    int height;
    int aniCounter;
    int aniState;
    int gravityDown;
} ANISPRITE;


typedef struct {
 int row;
 int col;
 int width;
    int height;
    int cdel;
    int position;
} PLATFORM;





extern ANISPRITE player;
extern PLATFORM topPlatform;
extern int level;
extern int winner;
extern int hOff;
extern int vOff;



void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();

void initPlatforms();
void updatePlatforms();
void drawPlatforms();
# 28 "main.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[1024];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[256];
# 29 "main.c" 2
# 1 "sky.h" 1
# 22 "sky.h"
extern const unsigned short skyTiles[5872];


extern const unsigned short skyMap[1024];


extern const unsigned short skyPal[256];
# 30 "main.c" 2
# 1 "city.h" 1
# 22 "city.h"
extern const unsigned short cityTiles[736];


extern const unsigned short cityMap[1024];


extern const unsigned short cityPal[256];
# 31 "main.c" 2
# 1 "splash.h" 1
# 22 "splash.h"
extern const unsigned short splashTiles[1168];


extern const unsigned short splashMap[1024];


extern const unsigned short splashPal[256];
# 32 "main.c" 2
# 1 "instructions.h" 1
# 22 "instructions.h"
extern const unsigned short instructionsTiles[1744];


extern const unsigned short instructionsMap[1024];


extern const unsigned short instructionsPal[256];
# 33 "main.c" 2
# 1 "sound.h" 1

typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
}SOUND;


extern SOUND soundA;
extern SOUND soundB;


void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);
void muteSound();
void unmuteSound();
void stopSound();

void setupInterrupts();
void interruptHandler();
# 34 "main.c" 2
# 1 "GameSong.h" 1
# 20 "GameSong.h"
extern const unsigned char GameSong[378000];
# 35 "main.c" 2
# 1 "score.h" 1
# 22 "score.h"
extern const unsigned short scoreTiles[624];


extern const unsigned short scoreMap[1024];


extern const unsigned short scorePal[256];
# 36 "main.c" 2
# 1 "GameOver.h" 1
# 20 "GameOver.h"
extern const unsigned char GameOver[28930];
# 37 "main.c" 2

void initialize();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToLose();
void lose();
void instr();
void goToInstr();

unsigned short buttons;
unsigned short oldButtons;
int hOff = 0;
int vOff = 0;


enum {START, INSTR, GAME, PAUSE, LOSE};
int state;

OBJ_ATTR shadowOAM[128];

void goToStart();


int main() {

    initialize();

 while(1) {

  oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        switch(state) {

            case START:
                start();
                break;
            case INSTR:
             instr();
             break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case LOSE:
                lose();
                break;
        }

  (*(volatile unsigned short *)0x04000014) = hOff;
        (*(volatile unsigned short *)0x04000016) = vOff;
 }

 return 0;
}


void initialize() {


 loadPalette(skyPal);

 hideSprites();

    (*(volatile unsigned short*)0x4000008) = ((2)<<2) | ((28)<<8) | (0<<14);
    (*(volatile unsigned short*)0x400000C) = ((0)<<2) | ((30)<<8) | (0<<14);
    (*(volatile unsigned short*)0x400000A) = ((1)<<2) | ((29)<<8) | (0<<14);

    (*(unsigned short *)0x4000000) = 0 | (1<<9) | (1<<8)| (1<<10) | (1<<12);

    buttons = (*(volatile unsigned short *)0x04000130);

    setupSounds();
    setupInterrupts();

 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);

 goToStart();

}


void goToStart() {

 DMANow(3, skyTiles, &((charblock *)0x6000000)[0], 11744/2);
    DMANow(3, skyMap, &((screenblock *)0x6000000)[30], 2048/2);

    DMANow(3, cityTiles, &((charblock *)0x6000000)[1], 1472/2);
    DMANow(3, cityMap, &((screenblock *)0x6000000)[29], 2048/2);


    DMANow(3, splashTiles, &((charblock *)0x6000000)[2], 2336/2);
    DMANow(3, splashMap, &((screenblock *)0x6000000)[28], 2048/2);

    playSoundA(GameSong, 378000, 11025, 1);



    state = START;
}


void start() {

 hOff++;
    waitForVBlank();



    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {

        goToGame();
        initGame();
    }
    if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {

     goToInstr();
    }
}


void goToGame() {

 (*(unsigned short *)0x4000000) = 0 | (1<<10) | (1<<9) | (1<<12);

 DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768/2);
 DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 256);

    state = GAME;
}


void game() {

    hOff++;
    updateGame();
    drawGame();
    hOff++;


    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToPause();
    }
    if (player.row - player.height >= 160 || player.row <= 0) {
        goToLose();
    }
}


void goToPause() {

 DMANow(3, pauseTiles, &((charblock *)0x6000000)[3], 2048/2);
    DMANow(3, pauseMap, &((screenblock *)0x6000000)[27], 2048/2);


    (*(volatile unsigned short*)0x4000008) = ((3)<<2) | ((27)<<8) | (0<<14);
    (*(unsigned short *)0x4000000) = 0 | (1<<9) | (1<<8) | (1<<10) | (1<<12);

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);
    hideSprites();

    state = PAUSE;
}


void pause() {


    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);

    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        goToGame();
    } else if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
        initialize();
    }
}


void goToLose() {

 DMANow(3, scoreTiles, &((charblock *)0x6000000)[3], 1248/2);
    DMANow(3, scoreMap, &((screenblock *)0x6000000)[27], 2048/2);

    (*(volatile unsigned short*)0x4000008) = ((3)<<2) | ((27)<<8) | (0<<14);
    (*(unsigned short *)0x4000000) = 0 | (1<<9) | (1<<8) | (1<<10) | (1<<12);

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);
    hideSprites();

    stopSound();
    playSoundA(GameSong, 378000, 11025, 1);
    playSoundB(GameOver, 28930, 11025, 0);

    state = LOSE;
}

void lose() {


 drawScore((level/10)%10, level%10);

 waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        initialize();
    }
}


void goToInstr() {

    DMANow(3, instructionsTiles, &((charblock *)0x6000000)[2], 3488/2);
    DMANow(3, instructionsMap, &((screenblock *)0x6000000)[28], 2048/2);


    waitForVBlank();
    state = INSTR;
}


void instr() {




    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {

        goToGame();
        initGame();
    }
    if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {

     goToStart();
    }
}


void drawScore(int a, int b) {
 int ten;
 int one;

 if (a == 0) {
  ten = 0;
 } else if (a == 1) {
  ten = 1;
 } else if (a == 2) {
  ten = 2;
 } else if (a == 3) {
  ten = 3;
 } else if (a == 4) {
  ten = 4;
 } else if (a == 5) {
  ten = 5;
 } else if (a == 6) {
  ten = 6;
 } else if (a == 7) {
  ten = 7;
 } else if (a == 8) {
  ten = 8;
 } else if (a == 9) {
  ten = 9;
 }

 if (b == 0) {
  one= 0;
 } else if (b == 1) {
  one= 1;
 } else if (b == 2) {
  one= 2;
 } else if (b == 3) {
  one= 3;
 } else if (b == 4) {
  one= 4;
 } else if (b == 5) {
     one = 5;
 } else if (b == 6) {
  one= 6;
 } else if (b == 7) {
  one= 7;
 } else if (b == 8) {
  one= 8;
 } else if (b == 9) {
  one = 9;
 }

 shadowOAM[7].attr0 = 70 | (0<<13) | (0<<14);
 shadowOAM[7].attr1 = 100 | (1<<14);
 shadowOAM[7].attr2 = ((0)<<12) | ((16)*32+(ten*2));

 shadowOAM[8].attr0 = 70 | (0<<13) | (0<<14);
 shadowOAM[8].attr1 = 115 | (1<<14);
 shadowOAM[8].attr2 = ((0)<<12) | ((16)*32+(one*2));

}
