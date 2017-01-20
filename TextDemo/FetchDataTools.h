//
//  FetchDataTools.h
//  TextDemo
//
//  Created by admin on 17/1/20.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

//请求方式
typedef enum : NSUInteger {
    GET,
    POST,
} HttpMethod;
//block 块
typedef void(^requestSuccessBlock)(NSData *data);
typedef void(^requestFailedBlock)(NSError *error);
@interface FetchDataTools : AFHTTPSessionManager
+ (void)requestDataWithUrlString:(NSString *)urlString
                  WithHttpMethod:(HttpMethod)method
                  WithParmarters:(NSDictionary *)parmarter
                        WithView:(UIView *)view
                WithSuccessBolck:(requestSuccessBlock)success WithFailedBolck:(requestFailedBlock)failed;
@end
