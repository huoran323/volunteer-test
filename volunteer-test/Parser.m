//
//  Parser.m
//  volunteer-test
//
//  Created by apple on 2017/3/21.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "Parser.h"

@implementation Parser

+(NSArray *)parseArray:(NSDictionary *)dict model:(NSString *)className{
    
    int currentPage = [dict[@"currentPage"] intValue];
    int maxPage = [dict[@"maxPage"] intValue];
    if (currentPage >= maxPage) {
        //没有更多数据
        [[NSNotificationCenter defaultCenter] postNotificationName:@"noMoreData" object:nil userInfo:@{@"modelName":className,@"noMore":@"yes"}];
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"noMoreData" object:nil userInfo:@{@"modelName":className,@"noMore":@"no"}];
    }
    
//    NSString *status = dict[@"status"];
//    if (![status isEqualToString:successString]){
//        NSString *ch = [self toChinese:status];
//        [MyObject failedPrompt:ch];
//        if ([status isEqualToString:loginOther]) {
//            [self loginAgain];
//        }
//        return @[];
//    }
    
    Class cla = NSClassFromString(className);
    NSArray *arr = dict[@"bus_json"];
    NSArray *result = [NSArray yy_modelArrayWithClass:cla json:arr];
    
    return result;
}

@end
