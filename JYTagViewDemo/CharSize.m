//
//  CharSize.m
//  JYTagViewDemo
//
//  Created by Gary on 16/4/27.
//  Copyright © 2016年 Gary. All rights reserved.
//

#import "CharSize.h"
#import "JYCharsSize.h"

@implementation CharSize
@synthesize podding;

-(instancetype)initWithTitle:(NSString *)title andLastOne:(CharSize *)lastOne andViewRect:(CGRect)rect  andPodding:(CGFloat)pod{
    self = [super init];
    if (self) {
        _viewRect = rect;
        podding = pod;
        [self setCharTitle:title];
        [self getRectByLastOne:lastOne];
    }
    return self;
}

-(void)setCharTitle:(NSString *)charTitle{
    _charTitle = charTitle;
    _selfSize = [JYCharsSize titleSize:_charTitle andFont:[UIFont systemFontOfSize:12]];
    _selfSize.height += 12;
    _selfSize.width += 12;
}

-(void)getRectByLastOne:(CharSize *)lastOne{
    CGPoint lastPoint = lastOne.selfPoint;
    CGSize lastSize = lastOne.selfSize;
    CGFloat maxWidth = _viewRect.size.width;
    CGFloat selfWidth = lastPoint.x +lastSize.width +podding+_selfSize.width+podding;
    
    if (selfWidth <= maxWidth) {
        self.selfPoint =CGPointMake(lastPoint.x +lastSize.width +podding, lastPoint.y?lastPoint.y:podding);
        self.location = CGPointMake(lastOne.location.x+1, lastOne.location.y?lastOne.location.y:1);
    }else{
        self.selfPoint =CGPointMake(0, lastPoint.y+lastSize.height+podding);
        self.location = CGPointMake(1, lastOne.location.y+1);
    }
}



@end
