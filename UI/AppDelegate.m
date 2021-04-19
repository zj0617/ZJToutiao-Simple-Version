//
//  AppDelegate.m
//  UI
//
//  Created by 钟婕 on 2021/4/12.
//  Copyright © 2021年 钟婕. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ThirdViewController.h"
#import <Foundation/Foundation.h>

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //UIWindow
    CGRect winFrame = [[UIScreen mainScreen] bounds];
    UIWindow *theWindow = [[UIWindow alloc] initWithFrame:winFrame];
    self.window = theWindow;
    self.window.backgroundColor=[UIColor redColor];
    
    //init the rootViewController of window
    ViewController *tabBarVC = [[ViewController alloc] init];
    tabBarVC.delegate = self;
    self.window.rootViewController = tabBarVC;
    
    //display
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if([viewController isKindOfClass:[ThirdViewController class]])
    {
        NSLog(@"跳转到一个ViewController");
        [self showAlertView];
    }
}

- (void)showAlertView
{
    UIAlertController *AC = [UIAlertController alertControllerWithTitle:nil message:@"请先登录！" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"OK");
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Cancel");
    }];
    [AC addAction:okAction];
    [AC addAction:cancelAction];
    [self.window.rootViewController presentViewController:AC animated:YES completion:nil];
}

@end
