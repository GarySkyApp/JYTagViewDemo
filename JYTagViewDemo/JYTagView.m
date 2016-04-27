//
//  JYTagView.m
//  JYTagViewDemo
//
//  Created by Gary on 16/4/27.
//  Copyright © 2016年 Gary. All rights reserved.
//

#define hpodding 14

#import "JYTagView.h"
#import "CharSize.h"
#import "TagBtn.h"

@interface JYTagView ()

@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *charsArr;

@end

@implementation JYTagView

-(void)setTitleArr:(NSArray *)titleArr{
    [self.titles removeAllObjects];
    self.titles = titleArr.mutableCopy;
    
    self.charsArr = [self centerComp];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, [self getHeight]);
    [self layoutBtns];
}


-(NSMutableArray *)titles{
    if (_titles) {
        _titles = @[].mutableCopy;
    }
    return _titles;
}

-(NSMutableArray *)charsArr{
    if (_charsArr) {
        _charsArr = @[].mutableCopy;
    }
    return _charsArr;
}

-(CGFloat)getHeight{
    NSArray *lastRow = _charsArr.lastObject;
    CharSize *size = lastRow.lastObject;
    return size.selfPoint.y + size.selfSize.height+12;
}

-(NSMutableArray *)enumTitles{
    NSMutableArray *rows = @[].mutableCopy;
    NSMutableArray *oneRow = @[].mutableCopy;

    [_titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CharSize *charSize = [[CharSize alloc] initWithTitle:obj andLastOne:oneRow.lastObject andViewRect:self.frame andPodding:hpodding];
        CharSize *lastOne = oneRow.lastObject;
        
        if (!lastOne) {
            //第一个
            [oneRow addObject:charSize];
        }else if(charSize.location.y == lastOne.location.y ){
            //一行
            [oneRow addObject:charSize];
        }else{
            //下一行
            [rows addObject:oneRow.copy];
            [oneRow removeAllObjects];
            [oneRow addObject:charSize];
        }
    }];
    
    if (oneRow.count != 0) {
        [rows addObject:oneRow.copy];
        [oneRow removeAllObjects];
    }
    
    return rows;
}

-(NSMutableArray *)centerComp{
    NSMutableArray *cmp = @[].mutableCopy;
    NSMutableArray *rows = @[].mutableCopy;
    rows = [self enumTitles];
    [rows enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray *oneRow = obj;
        CharSize *charSize = oneRow.lastObject;
        CGFloat podding = charSize.selfPoint.x + charSize.selfSize.width +12;
        CGFloat pod = self.frame.size.width - podding;
        if (pod >=0) {
            NSMutableArray *oneRowTmp = @[].mutableCopy;
            [oneRow enumerateObjectsUsingBlock:^(id  _Nonnull obj2, NSUInteger idx2, BOOL * _Nonnull stop2) {
                CharSize *size = obj2;
                size.self.selfPoint = CGPointMake(size.self.selfPoint.x+pod*0.5, size.self.selfPoint.y);
                [oneRowTmp addObject:obj2];
            }];
            [cmp addObject:oneRowTmp.copy];
            [oneRowTmp removeAllObjects];
        }else{
            [cmp addObject:oneRow.copy];
        }
    }];
    return cmp;
}

-(void) layoutBtns{
    //
    [_charsArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray *oneRow = obj;
        [oneRow enumerateObjectsUsingBlock:^(id  _Nonnull obj2, NSUInteger idx2, BOOL * _Nonnull stop2) {
            CharSize *size = obj2;
            TagBtn *btn = [self createBtn:size.charTitle];
            btn.frame = CGRectMake(size.selfPoint.x, size.selfPoint.y, size.selfSize.width, size.selfSize.height);
            [self addSubview:btn];
        }];
    }];
}

-(TagBtn *)createBtn:(NSString *)title{
    TagBtn *btn = [[TagBtn alloc] init];
    [btn setTitle:title];
    return btn;
}

@end
