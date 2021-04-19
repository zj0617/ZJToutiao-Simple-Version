//
//  SettingSubViewController.m
//  UI
//
//  Created by 钟婕 on 2021/4/18.
//  Copyright © 2021年 钟婕. All rights reserved.
//

#import "SettingSubViewController.h"

@interface SettingSubViewController ()

@property (nonatomic, strong) NSArray *taskList;
@property (nonatomic, strong) UITableView *taskTable;

@end

@implementation SettingSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *arr1 = @[@"账号与安全", @"青少年模式"];
    NSArray *arr2 = @[@"新消息提醒", @"勿扰模式", @"聊天", @"隐私", @"通用"];
    NSArray *arr3 = @[@"关于头条", @"帮助与反馈"];
    NSArray *arr4 = @[@"插件", @"切换账号"];
    self.taskList = @[arr1, arr2, arr3, arr4];
    
    CGRect winFrame = [[UIScreen mainScreen] bounds];
    CGRect tableFrame = CGRectMake(0, 100, winFrame.size.width, winFrame.size.height-200);
    self.taskTable = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    self.taskTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.taskTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.view.backgroundColor = [UIColor whiteColor];
    self.taskTable.dataSource = self;
    self.taskTable.delegate = self;
    [self.view addSubview:self.taskTable];
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *c = [self.taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    NSString *item = [[self.taskList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    c.textLabel.text = item;
    return c;
}

 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.taskList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.taskList objectAtIndex:section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
        return nil;
    else
        return @" ";
}

@end
