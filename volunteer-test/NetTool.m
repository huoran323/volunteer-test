//
//  NetTool.m
//  volunteer-test
//
//  Created by apple on 2017/3/21.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "NetTool.h"

@implementation NetTool

+(NSURLSessionDataTask *)getCategorysret:(void (^)(NSArray *goods))ret {

    NSURLSessionDataTask *task = [Requester postWithLastURL:SHOP_HOME1_URL par:@{@"is_index":@"1"} description:@"商场首页" success:^(NSDictionary *dict) {
        
        if ([[dict objectForKey:@"error_code"] isEqualToString:@"1"]) {
            Class cla = NSClassFromString(@"RecommentModel");
            NSArray *arr = dict[@"bus_json"];
            NSArray *result = [NSArray yy_modelArrayWithClass:cla json:arr];
            ret(result);
        }
        else {
            [CustomObject failedPrompt:@"请求失败"];
        }
        
    }];
    
    return task;
}

@end
