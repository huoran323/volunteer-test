//
//  Parser.h
//  volunteer-test
//
//  Created by apple on 2017/3/21.
//  Copyright © 2017年 apple. All rights reserved.
//

//解析层 或 业务层

#import <Foundation/Foundation.h>

@interface Parser : NSObject

+(BOOL)parseBool:(NSDictionary *)dict;//需要有特殊返回值就可以断定成功的情况
+(NSArray *)parseArray:(NSDictionary *)dict model:(NSString *)className;//解析成模型数组
+(id)parseDictionary:(NSDictionary *)dict model:(NSString *)className;//解析最外层是字典的情况

@end
