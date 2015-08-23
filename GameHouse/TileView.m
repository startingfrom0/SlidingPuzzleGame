//
//  TileView.h
//  GameHouse
//
//  Created by Alex Smith on 24/05/2015.
//  Copyright (c) 2015 Alex Smith. All rights reserved.
//

#import "TileView.h"

@implementation TileView

#define FONT_SIZE self.bounds.size.width / 6.0
#define LABEL_X_AND_Y self.bounds.size.width / 15.0
#define LABEL_W_AND_H self.bounds.size.width / 5.0
-(void)setTileValue:(int)tileValue
{
    _tileValue = tileValue;
    
    if (tileValue != 0) {
        CGRect labelFrame = CGRectMake(LABEL_X_AND_Y, LABEL_X_AND_Y, LABEL_W_AND_H, LABEL_W_AND_H);
        
        UILabel *valueLabel = [[UILabel alloc] initWithFrame:labelFrame];
        valueLabel.textAlignment = NSTextAlignmentLeft;
        valueLabel.textColor = [UIColor blackColor];
        valueLabel.text = [NSString stringWithFormat:@"%d", tileValue];
        valueLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
        [self addSubview:valueLabel];
        
        [self setNeedsDisplay];
    }
}

-(void)setTileImage:(UIImage *)tileImage
{
    UIImageView *tileForeground = [[UIImageView alloc] initWithFrame:self.bounds];
    tileForeground.image = tileImage;
    tileForeground.layer.cornerRadius = 8.0;
    tileForeground.layer.masksToBounds = YES;
    [self addSubview:tileForeground];
    [self setNeedsDisplay];
}

#pragma mark - Initialisers

-(instancetype)initWithFrame:(CGRect)frame andImage:(UIImage *)image
{
    return [self initWithFrame:frame andImage:image andValue:0];
}

-(instancetype)initWithFrame:(CGRect)frame
            andImage:(UIImage *)image
            andValue:(int)value
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 0.5;
        
        UIImageView *tileBackground = [[UIImageView alloc] initWithFrame:self.bounds];
        tileBackground.image = [UIImage imageNamed:@"Wooden Tile"];
        [self addSubview:tileBackground];
        
        self.tileImage = image;
        self.tileValue = value;
        
        [self setNeedsDisplay];
    }
    
    return self;
}

-(void)animateToFrame:(CGRect)frame
{
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.frame = frame;
                     }
                     completion:NULL];
}

@end
