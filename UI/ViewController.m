//
//  ViewController.m
//  UI
//
//  Created by 钟婕 on 2021/4/12.
//  Copyright © 2021年 钟婕. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    FirstViewController *vc1 = [[FirstViewController alloc] init];
    vc1.tabBarItem.title = @"头条";
    vc1.tabBarItem.badgeValue = @"10";
    UIImage *image = [UIImage imageNamed:@"头条"];
    //调整图片尺寸
    UIImage *newImage;
    UIGraphicsBeginImageContext(CGSizeMake(35, 35));
    [image drawInRect:CGRectMake(0, 0, 35, 35)];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    vc1.tabBarItem.image = newImage;
    
    
    //UINavigationController相当于一个栈容器存放view，便于返回！
    SecondViewController *vc2 = [[SecondViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc2];
    navigationController.tabBarItem.title = @"西瓜视频";
    image = [UIImage imageNamed:@"西瓜"];
    UIGraphicsBeginImageContext(CGSizeMake(35, 35));
    [image drawInRect:CGRectMake(0, 0, 35, 35)];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    navigationController.tabBarItem.image = newImage;
    
    
    ThirdViewController *vc3 = [[ThirdViewController alloc] init];
    vc3.tabBarItem.title = @"放映厅";
    image = [UIImage imageNamed:@"放映机"];
    UIGraphicsBeginImageContext(CGSizeMake(35, 35));
    [image drawInRect:CGRectMake(0, 0, 35, 35)];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    vc3.tabBarItem.image = newImage;
    
    FourthViewController *vc4 = [[FourthViewController alloc] init];
    vc4.tabBarItem.title = @"我的";
    image = [UIImage imageNamed:@"我的"];
    UIGraphicsBeginImageContext(CGSizeMake(35, 35));
    [image drawInRect:CGRectMake(0, 0, 35, 35)];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    vc4.tabBarItem.image = newImage;
    
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    
    self.viewControllers = @[vc1,navigationController,vc3,vc4];
    
}

@end
