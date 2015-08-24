//
//  PuzzleBoardTest.h
//  Sliding Puzzle
//
//  Created by Alex Smith on 23/08/2015.
//  Copyright (c) 2015 Alex Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enums+Structs.h"
#import "GridPosition.h"

@interface GridOfValues : NSObject

@property (nonatomic, readonly) GridSize gridSize;

-(instancetype)initWithSize:(GridSize)gridSize;

// value information retrieval
-(int)valueAtPosition:(Position)position;
-(Position)positionWithValue:(int)value;

// alter value positions
-(void)setValueAtPosition:(Position)position toValue:(int)value;
-(void)swapValueAtPosition:(Position)position1 withValueAtPosition:(Position)position2;

// other
-(NSString *)boardSizeStringFromNumTiles;
@end