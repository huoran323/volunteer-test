//
//  BaseViewController.m
//  volunteer-test
//
//  Created by apple on 2017/3/21.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setLeftBtn];
}

#pragma mark - 导航栏按钮
-(void)setLeftBtn{
    [self setLeftBtnWithTitle:@"" normalImg:nil highlightImg:nil target:self action:@selector(backAction)];
}
#pragma mark - 抽象方法
-(void)setLeftBtnWithTitle:(NSString *)title normalImg:(NSString *)normalImg highlightImg:(NSString *)highlightImg target:(id)target action:(SEL)action{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = BACKFRAME;
    [leftButton setTitle:title forState:UIControlStateNormal];
    if (normalImg) {
        [leftButton setBackgroundImage:[UIImage imageNamed:normalImg] forState:UIControlStateNormal];
    }
    if (highlightImg) {
        [leftButton setBackgroundImage:[UIImage imageNamed:highlightImg] forState:UIControlStateHighlighted];
    }
    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    leftButton.titleLabel.font = [UIFont systemFontOfSize:16.f];
    [leftButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBar = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = backBar;
}
-(void)setRightBtnWithTitle:(NSString *)title normalImg:(NSString *)normalImg highlightImg:(NSString *)highlightImg target:(id)target action:(SEL)action{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 33, 33);
    [rightButton setTitle:title forState:UIControlStateNormal];
    if (normalImg) {
        [rightButton setBackgroundImage:[UIImage imageNamed:normalImg] forState:UIControlStateNormal];
    }
    if (highlightImg) {
        [rightButton setBackgroundImage:[UIImage imageNamed:highlightImg] forState:UIControlStateHighlighted];
    }
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:16.f];
    [rightButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    NSArray *oldRight = self.navigationItem.rightBarButtonItems;
    NSMutableArray *newRight = nil;
    if (oldRight) {
        newRight = [oldRight mutableCopy];
    }else{
        newRight = [NSMutableArray array];
    }
    [newRight addObject:rightBar];
    self.navigationItem.rightBarButtonItems = newRight;
}
#pragma mark - 返回动作
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
