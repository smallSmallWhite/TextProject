//
//  FetchDataTools.m
//  TextDemo
//
//  Created by admin on 17/1/20.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "FetchDataTools.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"



@implementation FetchDataTools

//数据请求
+ (void)requestDataWithUrlString:(NSString *)urlString
                  WithHttpMethod:(HttpMethod)method
                  WithParmarters:(NSDictionary *)parmarter
                        WithView:(UIView *)view
                WithSuccessBolck:(requestSuccessBlock)success WithFailedBolck:(requestFailedBlock)failed {
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        MBProgressHUD *hud = nil;
        if (view) {
            
            hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        }
        if (status == AFNetworkReachabilityStatusUnknown || status == AFNetworkReachabilityStatusNotReachable) {
            
            //没有网络
            hud.label.text = @"没有网络，请检查网络是否连接";
            hud.label.textColor = [UIColor whiteColor];
            [hud hideAnimated:YES afterDelay:2];
            
        }else{
            //有网络
            hud.mode = MBProgressHUDModeIndeterminate;
            hud.label.text = @"加载中...";
            
            if (method == GET) {
                
                AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
                manager.responseSerializer = [AFHTTPResponseSerializer serializer];
                [manager GET:urlString parameters:parmarter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    success(responseObject);
                    [hud hideAnimated:YES afterDelay:2];
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    failed(error);
                    [hud hideAnimated:YES afterDelay:2];
                }];
                
                
            }else {
                
                AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
                manager.responseSerializer = [AFHTTPResponseSerializer serializer];
                [manager POST:urlString parameters:parmarter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    success(responseObject);
                    [hud hideAnimated:YES afterDelay:2];
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    failed(error);
                    [hud hideAnimated:YES afterDelay:2];
                }];
                
            }
            
        }
    }];
}

@end
