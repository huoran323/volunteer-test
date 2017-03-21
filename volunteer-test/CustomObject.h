//
//  CustomObject.h
//  volunteer-test
//
//  Created by apple on 2017/3/21.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HRCompletionBlock)(void);

@interface CustomObject : UIView

#pragma mark - 特殊提示与遮罩
+(void)failedPrompt:(NSString *)title;
+(void)failedPrompt:(NSString *)title complete:(HRCompletionBlock)completion;
+(void)failedPromptInSuperView:(UIView *)superView title:(NSString *)title complete:(HRCompletionBlock)completion;
+(void)failedPromptInSuperView:(UIView *)superView title:(NSString *)title;

@end
