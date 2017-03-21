//
//  CustomObject.m
//  volunteer-test
//
//  Created by apple on 2017/3/21.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "CustomObject.h"

@interface CustomObject()

@property (copy, nonatomic)HRCompletionBlock completion;
@property (nonatomic, strong) UILabel *labelTi;

@end

@implementation CustomObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self creatLabelTi];
    }
    return self;
}

+(void)failedPrompt:(NSString *)title{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *root = [UIApplication sharedApplication].keyWindow.rootViewController;
        [self failedPromptInSuperView:root.view title:title];
    });
}
+(void)failedPrompt:(NSString *)title complete:(HRCompletionBlock)completion{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self sharedView].completion = completion;
        [self failedPrompt:title];
    });
}
+(void)failedPromptInSuperView:(UIView *)superView title:(NSString *)title complete:(HRCompletionBlock)completion{
    [self sharedView].completion = completion;
    [self failedPromptInSuperView:superView title:title];
}

+(void)failedPromptInSuperView:(UIView *)superView title:(NSString *)title{
    if (!title||[title isEqualToString:@""]) {
        return;
    }
    NSString *fatStr = [NSString stringWithFormat:@" %@  ",title];
    [self sharedView].labelTi.text = fatStr;
    [self sharedView].frame = superView.bounds;
    [self sharedView].userInteractionEnabled = false;
    [superView addSubview:[self sharedView]];
    [[self sharedView]showMessage];
}
+(CustomObject *)sharedView
{
    static CustomObject *sharedView = nil;
    if(sharedView==nil){
        [[self sharedView]creatLabelTi];
    }
    return sharedView;
}

-(void)creatLabelTi {
    
    self.labelTi = [[UILabel alloc]init];
    self.labelTi.frame = CGRectMake(0, ScreenH - 60, ScreenW, 30);
    self.labelTi.layer.cornerRadius = self.labelTi.bounds.size.height * 0.5;
    [self.labelTi.layer setMasksToBounds:YES];
    self.labelTi.backgroundColor = UIColorFromRGB(0x555555);
    self.labelTi.textAlignment = NSTextAlignmentCenter;
    self.labelTi.textColor = [UIColor whiteColor];
    self.labelTi.font = [UIFont systemFontOfSize:17];
    self.labelTi.hidden = YES;
}
-(void)hideKeyboard{
    UIViewController *root = [UIApplication sharedApplication].keyWindow.rootViewController;
    [root.view endEditing:YES];
}
-(void)showMessage{
    [self hideKeyboard];
    self.labelTi.hidden = NO;
    self.labelTi.alpha = 1;
    [self hideMessage];
}
-(void)hideMessage{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1.0 animations:^{
            self.labelTi.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            if (self.completion) {
                self.completion();
            }
        }];
    });
}
@end
