//
//  ServiceSubViewController.m
//  UI
//
//  Created by 钟婕 on 2021/4/18.
//  Copyright © 2021年 钟婕. All rights reserved.
//

#import "ServiceSubViewController.h"

@interface ServiceSubViewController ()

@end

@implementation ServiceSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIAlertController *AC = [UIAlertController alertControllerWithTitle:nil message:@"请先登录！" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"OK");
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Cancel");
    }];
    [AC addAction:okAction];
    [AC addAction:cancelAction];
    [self presentViewController:AC animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
