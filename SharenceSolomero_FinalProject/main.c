/*
// G-Switch  //

Gameplay: 
Player runs a course with platforms and tries to stay on the platforms by switching the direction of the gravity.
The longer you survive, the speed of gameplay will increase. 

Objective:
Try to hit as many platforms as possible

Controls: 
'a' to switch gravity
'start' pause/return to main screen
'b' to slow down the speed

Lose State:
When a player is off a platform and touches the bottom and top edges of the screen the player loses. Score will be
shown at the end.

Possible bugs:
If the speed gets high enough, the timing of player landing on a platform may be difficult.
*/


#include "myLib.h"
#include "spritesheet.h"
#include "game.h"
#include "pause.h"
#include "sky.h"
#include "city.h"
#include "splash.h"
#include "instructions.h"
#include "sound.h"
#include "GameSong.h"
#include "score.h"
#include "GameOver.h"

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

// States
enum {START, INSTR, GAME, PAUSE, LOSE};
int state;

OBJ_ATTR shadowOAM[128];

void goToStart();


int main() {

    initialize(); 

	while(1) {

		oldButtons = buttons;
        buttons = BUTTONS;

		 // State Machine
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
		
		REG_BG1HOFF = hOff;
        REG_BG1VOFF = vOff;
	}

	return 0;
}


void initialize() {

 
	loadPalette(skyPal);
  
	hideSprites();
    
    REG_BG0CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(28) | BG_SIZE_SMALL;
    REG_BG2CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(30) | BG_SIZE_SMALL;
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(29) | BG_SIZE_SMALL;
  
    REG_DISPCTL = MODE0 | BG1_ENABLE | BG0_ENABLE| BG2_ENABLE | SPRITE_ENABLE;

    buttons = BUTTONS;

    setupSounds();
    setupInterrupts();

	DMANow(3, shadowOAM, OAM, 128*4);

	goToStart();

}

// Sets up the start state
void goToStart() {

	DMANow(3, skyTiles, &CHARBLOCK[0], skyTilesLen/2);
    DMANow(3, skyMap, &SCREENBLOCK[30], skyMapLen/2);

    DMANow(3, cityTiles, &CHARBLOCK[1], cityTilesLen/2);
    DMANow(3, cityMap, &SCREENBLOCK[29], cityMapLen/2);


    DMANow(3, splashTiles, &CHARBLOCK[2], splashTilesLen/2);
    DMANow(3, splashMap, &SCREENBLOCK[28], splashMapLen/2);

    playSoundA(GameSong, GAMESONGLEN, GAMESONGFREQ, 1);


    //waitForVBlank();
    state = START;
}

// Runs every frame of the start state
void start() {

	hOff++;
    waitForVBlank();
    //DMANow(3, shadowOAM, OAM, 128*4);
  
    // State transitions
    if (BUTTON_PRESSED(BUTTON_A)) {

        goToGame();
        initGame();
    }
    if (BUTTON_PRESSED(BUTTON_B)) {

    	goToInstr();
    }
}

// Sets up the game state
void goToGame() {
	
	REG_DISPCTL = MODE0 | BG2_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
	
	DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
	DMANow(3, spritesheetPal, SPRITEPALETTE, 256);

    state = GAME;
}

// Runs every frame of the game state
void game() {

    hOff++;
    updateGame();
    drawGame();
    hOff++;

    //hOff++;
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (player.row - player.height >= 160 || player.row <= 0) {
        goToLose();
    } 
}

// Sets up the pause state
void goToPause() {
	
	DMANow(3, pauseTiles, &CHARBLOCK[3], pauseTilesLen/2);
    DMANow(3, pauseMap, &SCREENBLOCK[27], pauseMapLen/2);


    REG_BG0CNT = BG_CHARBLOCK(3) | BG_SCREENBLOCK(27) | BG_SIZE_SMALL;
    REG_DISPCTL = MODE0 | BG1_ENABLE | BG0_ENABLE | BG2_ENABLE | SPRITE_ENABLE;

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);
    hideSprites();
    
    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    
    // Lock the framerate to 60 fps
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);
    // State transitions
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_B)) {
        initialize();
    }
}

// Sets up the lose state
void goToLose() {
	
	DMANow(3, scoreTiles, &CHARBLOCK[3], scoreTilesLen/2);
    DMANow(3, scoreMap, &SCREENBLOCK[27], scoreMapLen/2);

    REG_BG0CNT = BG_CHARBLOCK(3) | BG_SCREENBLOCK(27) | BG_SIZE_SMALL;
    REG_DISPCTL = MODE0 | BG1_ENABLE | BG0_ENABLE | BG2_ENABLE | SPRITE_ENABLE;

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);
    hideSprites();
    
    stopSound();
    playSoundA(GameSong, GAMESONGLEN, GAMESONGFREQ, 1);
    playSoundB(GameOver, GAMEOVERLEN, GAMEOVERFREQ, 0);

    state = LOSE;
}

void lose() {


	drawScore((level/10)%10, level%10);

	waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize();
    }
}

// Sets up the instruction state
void goToInstr() {

    DMANow(3, instructionsTiles, &CHARBLOCK[2], instructionsTilesLen/2);
    DMANow(3, instructionsMap, &SCREENBLOCK[28], instructionsMapLen/2);


    waitForVBlank();
    state = INSTR;
}

// Runs every frame of the start state
void instr() {

    //waitForVBlank();
  
    // State transitions
    if (BUTTON_PRESSED(BUTTON_A)) {

        goToGame();
        initGame();
    }
    if (BUTTON_PRESSED(BUTTON_B)) {

    	goToStart();
    }
}

//  Draw Score
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

	shadowOAM[7].attr0 = 70 | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[7].attr1 = 100 | ATTR1_SMALL;
	shadowOAM[7].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16,ten*2);

	shadowOAM[8].attr0 = 70 | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[8].attr1 = 115 | ATTR1_SMALL;
	shadowOAM[8].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16,one*2);

}