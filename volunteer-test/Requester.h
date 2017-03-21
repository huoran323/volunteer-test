//
//  Requester.h
//  volunteer-test
//
//  Created by apple on 2017/3/21.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Requester : NSObject

+(AFHTTPSessionManager *)manager;

///需要登录的POST请求(**注意提前检查登录**)
//+(NSURLSessionDataTask *)loginPostWithLastURL:(NSString *)lastURL par:(NSDictionary *)par description:(NSString *)description success:(void(^)(NSDictionary *dict))success;
///不需要登录的POST请求(**不会发送user_id和guid**)
+(NSURLSessionDataTask *)postWithLastURL:(NSString *)lastURL par:(NSDictionary *)par description:(NSString *)description success:(void(^)(NSDictionary *dict))success;

@end
