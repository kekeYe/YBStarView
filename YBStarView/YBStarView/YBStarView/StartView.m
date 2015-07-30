//
//  StartView.m
//  tryStarViewDemo
//
//  Created by Daniel on 14-11-11.
//  Copyright (c) 2014年 Daniel. All rights reserved.
//

#import "StartView.h"
#import "StarModel.h"



#define WIDTH [[UIScreen mainScreen] bounds].size.width
#define HIGHT [[UIScreen mainScreen] bounds].size.height
#define changeChengdu 80

@implementation StartView{
    CGPoint firstPt;
    CGPoint pt;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.backgroundColor =[UIColor colorWithRed:33.0/255.0f green:145/255.0f blue:147/255.0f alpha:1];
        starModel =[[StarModel alloc]init];
//           NSTimer *timer =[NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(newFresh) userInfo:nil repeats:YES];
        CADisplayLink *timer =[CADisplayLink displayLinkWithTarget:self selector:@selector(newFresh)];
        [timer addToRunLoop:[NSRunLoop currentRunLoop]
                        forMode:NSDefaultRunLoopMode];
    }
    return self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    firstPt = [[touches anyObject] locationInView:self];
    NSLog(@"%f********%f",pt.x,pt.y);
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    pt = [[touches anyObject] locationInView:self];
    pt =CGPointMake(pt.x-firstPt.x, pt.y -firstPt.y);
    

    
    NSLog(@"%f-%f",pt.x,pt.y);
    

    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    

    firstPt =CGPointMake(pt.x, pt.y);
 

}
-(void)newFresh{
    
    [self setNeedsDisplay];
    
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    [starModel upStarData];
    [[UIColor colorWithRed:255/255.0f green:233/255.0f blue:255/255.0f alpha:0.8]set];
    /* Get the current graphics context */
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    // Drawing lines with a white stroke color
    CGContextSetRGBStrokeColor(currentContext, 78.0, 178.0, 154.0, 0.2);
    CGContextSetLineWidth(currentContext, 1.0);
    for (int i=0; i<starModel.starAry.count; i++) {
        Star *tempStar = [starModel.starAry objectAtIndex:i];

       

        CGContextAddEllipseInRect(currentContext, CGRectMake(tempStar.starCenter.x+pt.x/WIDTH*changeChengdu,tempStar.starCenter.y+pt.y/HIGHT*changeChengdu, 4, 4));
    
        // 设置当前视图填充色
        CGContextSetRGBFillColor(currentContext,255,233,255,tempStar.starAlph);
//        CGContextSetStrokeColorWithColor(currentContext, [UIColor redColor].CGColor);
        CGContextFillPath(currentContext);

    }
 
    for (int j=0; j<starModel.linesAry.count; j++) {
        
        StarLine *temp = [starModel.linesAry objectAtIndex:j];
        CGContextMoveToPoint(currentContext, temp.starPoint.x+2 +pt.x/320.0f*changeChengdu, temp.starPoint.y+2+pt.y/HIGHT*changeChengdu);
        CGContextAddLineToPoint(currentContext, temp.endPoint.x+2+pt.x/320.0f*changeChengdu, temp.endPoint.y+2+pt.y/HIGHT*changeChengdu);

        
    }

    CGContextStrokePath(currentContext);

}


@end
