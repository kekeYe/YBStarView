//
//  StarModel.m
//  tryStarViewDemo
//
//  Created by Daniel on 14-11-12.
//  Copyright (c) 2014年 Daniel. All rights reserved.
//

#import "StarModel.h"
#define RADIANS(x) ((x)*(M_PI)/180)
#define WIDTH [[UIScreen mainScreen] bounds].size.width
#define HIGHT [[UIScreen mainScreen] bounds].size.height
@implementation StarModel


-(id)init{
    if (self=[super init]) {
        
        self.starAry = [[NSMutableArray alloc] init];
        self.linesAry = [[NSMutableArray alloc] init];
        
        for (int i=0; i<60; i++) {
            [self.starAry addObject:[self produceStar]];
        }
        
        return self;
    }
    return nil;
}

-(Star*)produceStar{
    CGFloat x = arc4random() % 320;
    CGFloat y = arc4random() % 480;
    Star *star1 =[[Star alloc] init];
    star1.starCenter =CGPointMake(x, y);
    star1.speed =(arc4random()%2+1.1)*0.8f;
    double dire=arc4random()%360/180.0f*3.1415926;
    star1.angle=dire==0?0.1:dire;
    CGFloat alphtemp =(arc4random()%10)/10.0f;
    star1.starAlph =alphtemp;
    return star1;
}


-(BOOL)ifProduceLines:(Star *)star withStar:(Star *)star2 distance:(int)distance{
    double a=star.starCenter.x-star2.starCenter.x;
    double b=star.starCenter.y-star2.starCenter.y;
    
    if (sqrt(a*a+b*b)<distance) {
        return YES;
    }
    return NO;
}
-(void)upStarData{
    
    for (Star* star in self.starAry) {
        [star changeValue];
    }
    

    [self makeLinesAry];
    

}
-(void)makeLinesAry{
    [self.linesAry removeAllObjects];
    for (Star* star1 in self.starAry) {
        for (Star* star2 in self.starAry) {
            if ([self ifProduceLines:star1 withStar:star2 distance:50]) {
                
                StarLine *line=[[StarLine alloc] init];
                line.starPoint = star1.starCenter;
                line.endPoint =star2.starCenter ;
                [self.linesAry addObject:line];
                
            }
        }
    }
}



@end



@implementation Star


-(void)changeValue{
    self.starCenter=CGPointMake(self.starCenter.x+self.speed*cos(self.angle), self.starCenter.y+self.speed*sin(self.angle));
    
    if(self.starCenter.x <2 ||self.starCenter.x >=WIDTH-2 ||self.starCenter.y <2 ||self.starCenter.y >=HIGHT-2){
        self.angle  =-self.angle;
        
    }
    
    if (self.starCenter.x<0||self.starCenter.y<0||self.starCenter.x>=WIDTH||self.starCenter.y>=HIGHT) {
        self.speed=-self.speed;
    }

    //TODO:  这里想实现 明暗变化来着.. 暂时不弄了
    self.starAlph =1;
    
}

@end


@implementation StarLine



@end