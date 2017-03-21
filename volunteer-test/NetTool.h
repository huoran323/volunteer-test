//
//  NetTool.h
//  volunteer-test
//
//  Created by apple on 2017/3/21.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RecommentModel.h"

@interface NetTool : NSObject

///商场首页
+(NSURLSessionDataTask *)getCategorysret:(void (^)(NSArray *goods))ret;

@end
