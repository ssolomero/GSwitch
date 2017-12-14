
//{{BLOCK(score)

//======================================================================
//
//	score, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 39 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1248 + 2048 = 3808
//
//	Time-stamp: 2017-12-03, 23:17:01
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SCORE_H
#define GRIT_SCORE_H

#define scoreTilesLen 1248
extern const unsigned short scoreTiles[624];

#define scoreMapLen 2048
extern const unsigned short scoreMap[1024];

#define scorePalLen 512
extern const unsigned short scorePal[256];

#endif // GRIT_SCORE_H

//}}BLOCK(score)
