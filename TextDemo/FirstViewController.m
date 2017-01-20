//
//  FirstViewController.m
//  TextDemo
//
//  Created by admin on 17/1/20.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "FirstViewController.h"
#import "FetchDataTools.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    self.view.backgroundColor = [UIColor greenColor];
    [self loadData];
}
#pragma mark  数据请求
- (void)loadData{
    //GET
//    [FetchDataTools requestDataWithUrlString:@"http://baobab.wandoujia.com/api/v3/discovery" WithHttpMethod:GET WithParmarters:nil WithView:self.view WithSuccessBolck:^(NSData *data) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
//        NSLog(@"%@",dic);
//    } WithFailedBolck:^(NSError *error) {
//        NSLog(@"error:%@",error);
//    }];
    //POST _parameter = [NSMutableDictionary dictionaryWithDictionary:@{@"platform":@"iOS",@"installversion":@"5.7.1.1",@"channelno":@"CZKJA2480800100",@"ot":@0}];
    [FetchDataTools requestDataWithUrlString:@"http://interfacev5.vivame.cn/x1-interface-v5/json/selfmedia.json?platform=iOS&installversion=5.7.1.1&channelno=CZKJA2480800100&uid=12624371&mid=77652eeaa8cd60389f73fdc1f56358a9&ot=0&nt=0&t=0" WithHttpMethod:POST WithParmarters:@{@"platform":@"iOS",@"installversion":@"5.7.1.1",@"channelno":@"CZKJA2480800100",@"ot":@0} WithView:self.view WithSuccessBolck:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        NSLog(@"%@",dic);
    } WithFailedBolck:^(NSError *error) {
        NSLog(@"error:%@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
