#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "sound.h"
#include "jump.h"

// Variables
ANISPRITE player;
PLATFORM platform1;
PLATFORM platform2;
PLATFORM platform3;

int level;
enum {PLEFT, PRIGHT, PUPLEFT, PUPRIGHT, GUP, GDOWN, IDLE};
int cheat;
int winner;


// Initialize the game
void initGame() {

	initPlayer();
	initPlatforms();
	level = 0;
	cheat = 0;
	winner = 0;
}
// Updates the game each frame
void updateGame() {

	updatePlayer();
	updatePlatforms();

	//Cheat
	if (BUTTON_PRESSED(BUTTON_B)) {
		if (cheat) {
			cheat = 0;
		} else {
			cheat = 1;
			platform1.cdel = 1;
			platform2.cdel = 1;
			platform3.cdel = 1;
		}
	} 
}

// Draws the game each frame
void drawGame() {

	drawPlayer();
	drawPlatforms();
}

//Player Section//

// Initialize the player
void initPlayer() {

	player.height = 32;
	player.width = 32;
    player.rdel = 2;
    player.cdel = 2;
	player.row = 90;
	player.col = SCREENWIDTH/2 - player.width;
	player.aniCounter = 0;
	player.aniState = PLEFT; 
	player.gravityDown = 1;
}

// Handle every-frame actions of the player
void updatePlayer() {

    // Collisions
    if (player.gravityDown && 
    	(collision(player.row+player.rdel, player.col, player.height, player.width, 
		platform1.row, platform1.col, platform1.height, platform1.width) ||
		collision(player.row+player.rdel, player.col, player.height, player.width, 
		platform2.row, platform2.col, platform2.height, platform2.width) ||
		collision(player.row+player.rdel, player.col, player.height, player.width, 
		platform3.row, platform3.col, platform3.height, platform3.width))) {

    	//So player doesn't pass the platform
    	if (collision(player.row+player.rdel, player.col, player.height, player.width, 
		platform1.row, platform1.col, platform1.height, platform1.width)) {
    		player.row = platform1.row-player.height+2;
		}
		if (collision(player.row+player.rdel, player.col, player.height, player.width, 
		platform2.row, platform2.col, platform2.height, platform2.width)) {
			player.row = platform2.row-player.height+2;
		}
		if (collision(player.row+player.rdel, player.col, player.height, player.width, 
		platform3.row, platform3.col, platform3.height, platform3.width)) {
			player.row = platform3.row-player.height+2;
		}


    	//Switch Gravity
    	if (BUTTON_PRESSED(BUTTON_A)) {
			player.gravityDown = 0;
			player.aniState = GUP;
			playSoundB(jump, JUMPLEN, JUMPFREQ, 0);
			player.row -= player.rdel;
			level++;
		}

		if (player.aniCounter % 8 == 0) {
			
			if (player.aniState == PLEFT) {
				player.aniState = PRIGHT;
			} else {
				player.aniState = PLEFT;
			}
		} 
		player.aniCounter++;
    
    } else if (!player.gravityDown && 	
    	(collision(player.row-player.rdel, player.col, player.height, player.width, 
		platform1.row, platform1.col, platform1.height, platform1.width*2) ||
		collision(player.row-player.rdel, player.col, player.height, player.width, 
		platform2.row, platform2.col, platform2.height, platform2.width) ||
		collision(player.row-player.rdel, player.col, player.height, player.width, 
		platform3.row, platform3.col, platform3.height, platform3.width))) {

    	if (collision(player.row-player.rdel, player.col, player.height, player.width, 
		platform1.row, platform1.col, platform1.height, platform1.width)) {
    		player.row = platform1.row+platform1.height-2;
		}
		if (collision(player.row-player.rdel, player.col, player.height, player.width, 
		platform2.row, platform2.col, platform2.height, platform2.width)) {
			player.row = platform2.row+platform2.height-2;
		}
		if (collision(player.row-player.rdel, player.col, player.height, player.width, 
		platform3.row, platform3.col, platform3.height, platform3.width)) {
			player.row = platform3.row+platform3.height-2;
		}

    	//Switch Gravity
    	if (BUTTON_PRESSED(BUTTON_A)) {
			player.gravityDown = 1;
			player.aniState = GDOWN;
			playSoundB(jump, JUMPLEN, JUMPFREQ, 0);
			player.row += player.rdel;
			level++;
		}

		if (player.aniCounter % 8 == 0) {
			
			if (player.aniState == PUPLEFT) {
				player.aniState = PUPRIGHT;
			} else {
				player.aniState = PUPLEFT;
			}

		} 
		player.aniCounter++;
    
    } else {
    	
    	if (player.gravityDown) {
    		player.aniState = GDOWN;
			player.row += player.rdel;
		} else {
			player.aniState = GUP;
			player.row -= player.rdel;
		}
    }
	
}

// Draw the player
void drawPlayer() {



	shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[0].attr1 = player.col | ATTR1_MEDIUM;

	if (player.aniState == PRIGHT) {
		shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0,0);
	}
	if (player.aniState == PLEFT) {
		shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0,4);
	}
	if (player.aniState == GUP) {
		shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4,0);
	}
	if (player.aniState == GDOWN) {
		shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4,4);
	}
	if (player.aniState == PUPLEFT) {
		shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0,8);
	}
	if (player.aniState == PUPRIGHT) {
		shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0,12);
	}
}

//Initialize Platforms
void initPlatforms() {

	platform1.width = 64*2;
    platform1.height = 16;
    platform1.row = 160 - platform1.height;
	platform1.col = 120;
	platform1.cdel = 1;
	platform1.position = 1;

	platform2.width = 64*2;
    platform2.height = 16;
    platform2.row = 0;
	platform2.col = 250;
	platform2.cdel = 1;
	platform2.position = 3;

	platform3.width = 64*2;
    platform3.height = 16;
    platform3.row = SCREENHEIGHT/2 - 8;
	platform3.col = 375;
	platform3.cdel = 1;
	platform3.position = 2;
}

//Update Platforms 
void updatePlatforms() {

	//Move platforms
	platform1.col -= platform1.cdel;
	platform2.col -= platform2.cdel;
	platform3.col -= platform3.cdel;

	//Change position
	if (platform1.col + platform1.width <= 0) {
		int randPlat = rand() % 2;
		platform1.col = 250+player.rdel+1;
		if (platform3.position == 1) {
			if (randPlat == 0) {
				platform1.position = 2;
				platform1.row = SCREENHEIGHT/2 - 8;
			} else {
				platform1.position = 3;
				platform1.row = 0;
			}
		} else if (platform3.position == 2) {
			if (randPlat == 0) {
				platform1.position = 1;
				platform1.row = 160 - platform1.height;
			} else {
				platform1.position = 3;
				platform1.row = 0;
			}
		} else {
			if (randPlat == 0) {
				platform1.position = 2;
				platform1.row = 160 - platform1.height;
			} else {
				platform1.position = 2;
				platform1.row = SCREENHEIGHT/2 - 8;
			}
		}
	}

	if (platform2.col + platform2.width <= 0) {
		int randPlat = rand() % 1;
		platform2.col = 250+player.rdel+1;
		if (platform1.position == 1) {
			if (randPlat == 0) {
				platform2.position = 2;
				platform2.row = SCREENHEIGHT/2 - 8;
			} else {
				platform2.position = 3;
				platform2.row = 0;
			}
		} else if (platform1.position == 2) {
			if (randPlat == 0) {
				platform2.position = 1;
				platform2.row = 160 - platform2.height;
			} else {
				platform2.position = 3;
				platform2.row = 0;
			}
		} else {
			if (randPlat == 0) {
				platform2.position = 1;
				platform2.row = 160 - platform2.height;
			} else {
				platform2.position = 2;
				platform2.row = SCREENHEIGHT/2 - 8;
			}
		}
	}


	if (platform3.col + platform3.width <= 0) {
		int randPlat = rand() % 1;
		platform3.col = 250+player.rdel+1;
		if (platform2.position == 1) {
			if (randPlat == 0) {
				platform3.position = 2;
				platform3.row = SCREENHEIGHT/2 - 8;
			} else {
				platform3.position = 3;
				platform3.row = 0;
			}
		} else if (platform2.position == 2) {
			if (randPlat == 0) {
				platform3.position = 1;
				platform3.row = 160 - platform2.height;
			} else {
				platform3.position = 3;
				platform3.row = 0;
			}
		} else {
			if (randPlat == 0) {
				platform3.position = 1;
				platform3.row = 160 - platform2.height;
			} else {
				platform3.position = 2;
				platform3.row = SCREENHEIGHT/2 - 8;
			}
		}
	}

	//Increase speed every 5 platforms
	if (level%5 == 0 && level > 0 && !cheat) {
		platform1.cdel++;
		platform2.cdel++;
		platform3.cdel++;
		player.rdel++;
		level++;
	}



}

void drawPlatforms() {

	//Platform 1
	shadowOAM[1].attr0 = platform1.row | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[1].attr1 = (COLMASK & platform1.col) | ATTR1_LARGE;
	shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8,0);
	shadowOAM[2].attr0 = platform1.row | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[2].attr1 = ((COLMASK & platform1.col) + platform1.width/2) | ATTR1_LARGE;
	shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8,0);

	//Platform 2
	shadowOAM[3].attr0 = platform2.row | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[3].attr1 = (COLMASK & platform2.col) | ATTR1_LARGE;
	shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8,0);
	shadowOAM[4].attr0 = platform2.row | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[4].attr1 = ((COLMASK & platform2.col) + platform2.width/2) | ATTR1_LARGE;
	shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8,0);

	//Platform 3
	shadowOAM[5].attr0 = platform3.row | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[5].attr1 = (COLMASK & platform3.col) | ATTR1_LARGE;
	shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8,0);
	shadowOAM[6].attr0 = platform3.row | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[6].attr1 = ((COLMASK & platform3.col) + platform3.width/2) | ATTR1_LARGE;
	shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8,0);
}

