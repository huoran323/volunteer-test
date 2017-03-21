//
//  FirstViewController.m
//  volunteer-test
//
//  Created by apple on 2017/3/21.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "FirstViewController.h"
#import "RecommentModel.h"


@interface FirstViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"首页";
    [self netRequest];
}

-(void)netRequest {
    
    [NetTool getCategorysret:^(NSArray *goods) {
        
        self.dataArray = goods;
        
    }];
}

@end
