//
//  RecommentModel.m
//  volunteer-test
//
//  Created by apple on 2017/3/21.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "RecommentModel.h"

@implementation RecommentModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value should be Class or Class name.
    return @{@"in_list" : [RecommentListModel class]};
}

@end

@implementation RecommentListModel

@end
