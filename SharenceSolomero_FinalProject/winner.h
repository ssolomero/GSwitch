
//{{BLOCK(winner)

//======================================================================
//
//	winner, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 72 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2304 + 2048 = 4864
//
//	Time-stamp: 2017-11-27, 21:09:28
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINNER_H
#define GRIT_WINNER_H

#define winnerTilesLen 2304
extern const unsigned short winnerTiles[1152];

#define winnerMapLen 2048
extern const unsigned short winnerMap[1024];

#define winnerPalLen 512
extern const unsigned short winnerPal[256];

#endif // GRIT_WINNER_H

//}}BLOCK(winner)
