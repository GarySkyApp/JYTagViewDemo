//
//  JYCharsSize.m
//  JYTagViewDemo
//
//  Created by Gary on 16/4/27.
//  Copyright © 2016年 Gary. All rights reserved.
//

#import "JYCharsSize.h"

@implementation JYCharsSize

+(CGSize)titleSize:(NSString *)title andFont:(UIFont *)font{
    NSDictionary *attributes = @{NSFontAttributeName : font};
    CGSize size = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                      options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    size.width = ceil(size.width);
    size.height = ceil(size.height);
    return size;
}

@end
