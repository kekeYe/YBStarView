//
//  ViewController.m
//  YBStarView
//
//  Created by Daniel on 14-11-12.
//  Copyright (c) 2014年 Daniel. All rights reserved.
//

#import "ViewController.h"
#import "StartView.h"
@interface ViewController (){
    
     StartView *ybStarView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     把 view 加上即可
     */
    ybStarView=[[StartView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view addSubview:ybStarView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
