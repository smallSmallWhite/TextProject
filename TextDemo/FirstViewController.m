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
    
    FetchDataTools *tools = [FetchDataTools sharedManager];
    [tools requestDataWithUrlString:@"http://baobab.wandoujia.com/api/v1/feed?date=%1&num=1" WithHttpMethod:GET WithParmarters:@{} WithView:self.view WithSuccessBolck:^(NSData *data) {
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
