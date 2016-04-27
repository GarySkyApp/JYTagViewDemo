//
//  TagBtn.m
//  JYTag
//
//  Created by Gary on 16/4/26.
//  Copyright © 2016年 Gary. All rights reserved.
//

#ifndef JYSIZE
#define JYSIZE

#define JYScreen [UIScreen mainScreen].bounds
#define JYWidth CGRectGetWidth(JYScreen)
#define JYHeight CGRectGetHeight(JYScreen)
#define JYRect(x, y, w, h) CGRectMake(x, y, w, h)
#endif

#ifndef JYCOLOR
#define JYCOLOR
#define JYColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define JYVColor(rgbValue, value) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:value]
#endif

#import "TagBtn.h"

@implementation TagBtn

-(instancetype)init{
    self = [super init];
    if (self) {
        int color = [self getColor];
        self.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = [self getFont];
        [self setTitleColor:JYColor(color) forState: UIControlStateNormal];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = [self titleSize:@"郁"].height*0.6;
        self.layer.borderWidth = 0.5f;
        self.layer.borderColor = JYVColor(color, 0.3).CGColor;
        
    }
    return self;
}

-(int)getColor{
    int rand = arc4random()%7;
    switch (rand) {
        case 0:{
            return 0xec7a7a;
        }
            break;
        case 1:{
             return 0xd67272;
        }
            break;
        case 2:{
             return 0x7ac932;
        }
            break;
        case 3:{
             return 0xf6a423;
        }
            break;
        case 4:{
             return 0xac7ed4;
        }
            break;
        case 5:{
             return 0x86baf3;
        }
            break;
        case 6:{
             return 0x86d6f3;
        }
            break;
            
        default:{
            return 0xffffff;
        }
            break;
    }
}

+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity
{
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}

-(UIFont *) getFont{
    return [UIFont systemFontOfSize:12 weight:UIFontWeightThin];
}

- (CGSize)titleSize:(NSString *)title {
    NSDictionary *attributes = @{NSFontAttributeName : [self getFont]};
    CGSize size = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                       options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    size.width = ceil(size.width);
    size.height = ceil(size.height);
    
    return size;
}

-(void)setTitle:(NSString *)title{
    [self setTitle:title forState: UIControlStateNormal];
    CGSize size = [self titleSize:title];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height);
}

@end
