//
//  Requester.m
//  volunteer-test
//
//  Created by apple on 2017/3/21.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "Requester.h"

@implementation Requester

+(AFHTTPSessionManager *)manager{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    AFHTTPResponseSerializer *serializer = manager.responseSerializer;
    serializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/html",@"text/plain",@"text/xml",@"text/json",@"application/json"]];
    return manager;
}

+(AFHTTPSessionManager *)managerWithHeader{
    AFHTTPSessionManager *manager = [self manager];
    return manager;
}

//+(NSURLSessionDataTask *)loginPostWithLastURL:(NSString *)lastURL par:(NSDictionary *)par description:(NSString *)description success:(void(^)(NSDictionary *dict))success{
//    if ([Requester hasLogin] == NO) {
//        return nil;
//    }
//    NSString *urlStr = [NSString stringWithFormat:@"%@%@",FIRST_URL,lastURL];
//    NSMutableDictionary *par1 = [NSMutableDictionary dictionaryWithDictionary:@{@"userId":[Requester userId],@"guid":[Requester guid]}];
//    if (par) {
//        [par1 addEntriesFromDictionary:par];
//    }
//    NSURLSessionDataTask *task = [[Requester managerWithHeader]POST:urlStr parameters:par1 progress:^(NSProgress * _Nonnull uploadProgress) {
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [MyObject end];
//        NSLog(@"\nURL: %@ \n参数: %@ \n%@: \n%@",urlStr, par1, description, responseObject);
//        NSDictionary *dict = responseObject;
//        success(dict);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [self handleErr:error task:task];
//    }];
//    return task;
//}

+(NSURLSessionDataTask *)postWithLastURL:(NSString *)lastURL par:(NSDictionary *)par description:(NSString *)description success:(void(^)(NSDictionary *dict))success{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",FIRST_URL,lastURL];
    NSURLSessionDataTask *task = [[Requester managerWithHeader]POST:urlStr parameters:par progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSLog(@"\nURL: %@ \n参数: %@ \n%@: \n%@",urlStr, par, description, responseObject);
        NSDictionary *dict = responseObject;
        success(dict);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self handleErr:error task:task];
    }];
    return task;
}

+(void)handleErr:(NSError *)err task:(NSURLSessionDataTask *)task {
    NSString *errStr = [err localizedDescription];
    NSLog(@"\n请求错误:%@",errStr);

    if ([errStr isEqualToString:@"cancelled"]) {
        //请求被人为取消
        
    }
    
    else if ([errStr isEqualToString:@"The data couldn’t be read because it isn’t in the correct format."]){

        [CustomObject failedPrompt:@"服务器故障"];
    }
    
    else {
        [CustomObject failedPrompt:@"网络正在开小差"];
//        [[NSNotificationCenter defaultCenter]postNotificationName:kRequestFailedNotification object:nil userInfo:@{@"task":task}];
    }
}

@end
