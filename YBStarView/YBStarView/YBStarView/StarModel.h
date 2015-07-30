//
//  StarModel.h
//  tryStarViewDemo
//
//  Created by Daniel on 14-11-12.
//  Copyright (c) 2014年 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 *  处理逻辑的model
 */
@interface StarModel : NSObject

-(void)upStarData;
@property(nonatomic,strong) NSMutableArray *starAry;
@property(nonatomic,strong) NSMutableArray *linesAry;

@end


@interface Star : NSObject

@property (nonatomic) CGPoint starCenter;
@property(nonatomic,assign)  float  speed;
@property(nonatomic,assign)  float  angle;
@property(nonatomic) float starAlph;
-(void)changeValue;

@end



@interface StarLine : NSObject

@property(nonatomic) CGPoint starPoint;
@property(nonatomic) CGPoint endPoint;

@end