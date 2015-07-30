//
//  StartView.h
//  tryStarViewDemo
//
//  Created by Daniel on 14-11-11.
//  Copyright (c) 2014年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  根据逻辑描绘的view
 */
@class StarModel;
@interface StartView : UIView{
    
    StarModel* starModel;
}

- (id)initWithFrame:(CGRect)frame;



@end


