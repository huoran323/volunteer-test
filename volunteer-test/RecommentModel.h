//
//  RecommentModel.h
//  volunteer-test
//
//  Created by apple on 2017/3/21.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 {
     "bus_json" =     (
         {
             "category_id" = 0009;
             "category_name" = "\U98df\U54c1\U751f\U9c9c";
             "img_path" = "upload/category/spsx/a.png";
             "in_list" =  (
                 {
                     "category_id" = 000908;
                     "category_name" = "\U4f11\U95f2\U98df\U54c1";
                     "img_path" = "upload/category/spsx/xxsp.png";
                 },
                 {
                     "category_id" = 000904;
                     "category_name" = "\U5730\U65b9\U7279\U4ea7";
                     "img_path" = "upload/category/spsx/dftc.png";
                 },
                 {
                     "category_id" = 000901;
                     "category_name" = "\U8fdb\U53e3\U98df\U54c1";
                     "img_path" = "upload/category/spsx/jksp.png";
                 }
             );
         }
     );
     "error_code" = 1;
     "error_msg" = "\U6210\U529f";
 }
 */
@class RecommentListModel;

@interface RecommentModel : NSObject

@property (nonatomic, copy) NSString *category_id;
@property (nonatomic, copy) NSString *category_name;
@property (nonatomic, copy) NSString *img_path;
@property (nonatomic,strong) NSArray <RecommentListModel *>* in_list;

@end

@interface RecommentListModel : NSObject

@property (nonatomic, copy) NSString *category_id;
@property (nonatomic, copy) NSString *category_name;
@property (nonatomic, copy) NSString *img_path;

@end
