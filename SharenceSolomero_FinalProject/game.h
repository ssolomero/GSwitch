//Player Struct
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

//Plaform 1
typedef struct {
	int row;
	int col;
	int width;
    int height;
    int cdel;
    int position;
} PLATFORM;

// Constants


// Variables
extern ANISPRITE player;
extern PLATFORM topPlatform;
extern int level;
extern int winner;
extern int hOff;
extern int vOff;


// Prototypes
void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();

void initPlatforms();
void updatePlatforms();
void drawPlatforms();

