//
//  BoardCVC.h
//  Sliding Puzzle
//
//  Created by Alex Smith on 22/08/2015.
//  Copyright (c) 2015 Alex Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridOfObjects.h"

@protocol ObjectGridVCDelegate <NSObject>

-(void)tileTappedAtPosition:(Position)position;

@end

@interface ObjectGridVC : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) id<ObjectGridVCDelegate> delegate;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) GridOfObjects *objectGrid;

#warning SHOULD FAIL IF COUNT OF ARRAY DOESN'T EQUAL TO NUMBER OF CELLS IN GRID

// ADD THE WHITE BORDER COLOUR ONTO THIS CLASS
-(instancetype)initWithObjects:(NSArray *)cellObjects
                      gridSize:(GridSize)size
                collectionView:(UICollectionView *)collectionView
         andCellConfigureBlock:(void (^)(UICollectionViewCell *cell, Position position, id obj, int objIndex))cellConfigureBlock;

@end
