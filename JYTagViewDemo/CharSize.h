//
//  CharSize.h
//  JYTagViewDemo
//
//  Created by Gary on 16/4/27.
//  Copyright © 2016年 Gary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CharSize : NSObject

@property (nonatomic, strong) NSString *charTitle;
@property (nonatomic, assign) CGPoint selfPoint;
@property (nonatomic, assign) CGSize selfSize;
@property (nonatomic, assign) CGPoint location;
@property (nonatomic, assign) CGRect viewRect;


@property (nonatomic, assign) CGFloat podding;

-(instancetype)initWithTitle:(NSString *)title andLastOne:(CharSize *)lastOne andViewRect:(CGRect)rect andPodding:(CGFloat)pod;

@end
