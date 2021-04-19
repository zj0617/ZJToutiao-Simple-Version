//
//  FourthViewController.m
//  UI
//
//  Created by 钟婕 on 2021/4/14.
//  Copyright © 2021年 钟婕. All rights reserved.
//

#import "FourthViewController.h"
#import <UIKit/UIKit.h>

@interface FourthViewController ()

@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UITextField *usrnameField;
@property (nonatomic, strong) UIButton *submitButton;

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //CGRect winFrame = [[UIScreen mainScreen] bounds];
    CGRect usrFieldFrame = CGRectMake(100, 300, 200, 50);
    CGRect passFieldFrame = CGRectMake(100, 400, 200, 50);
    CGRect buttonFrame = CGRectMake(100, 500, 200, 50);
    
    // init username field
    self.usrnameField = [[UITextField alloc] initWithFrame:usrFieldFrame];
    self.usrnameField.borderStyle = UITextBorderStyleRoundedRect;
    self.usrnameField.placeholder = @"Username";
    self.usrnameField.backgroundColor = [UIColor whiteColor];
    self.usrnameField.userInteractionEnabled = YES;
    [self.view addSubview:self.usrnameField];
    
    // init password field
    self.passwordField = [[UITextField alloc] initWithFrame:passFieldFrame];
    self.passwordField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordField.placeholder = @"Password";
    self.passwordField.backgroundColor = [UIColor whiteColor];
    self.passwordField.userInteractionEnabled = YES;
    [self.view addSubview:self.passwordField];
    
    // init submit button
    self.submitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.submitButton.frame = buttonFrame;
    self.submitButton.backgroundColor = [UIColor whiteColor];
    [self.submitButton setTitleColor:[UIColor blackColor] forState:0];
    [self.submitButton setTitle:@"提交" forState:UIControlStateNormal];
    [self.view addSubview:self.submitButton];
    
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
