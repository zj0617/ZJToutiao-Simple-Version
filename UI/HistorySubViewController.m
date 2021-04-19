//
//  HistorySubViewController.m
//  UI
//
//  Created by 钟婕 on 2021/4/17.
//  Copyright © 2021年 钟婕. All rights reserved.
//

#import "HistorySubViewController.h"
#import "HistoryRecorder.h"

@interface HistorySubViewController ()

@property (nonatomic) UITableView *historyTable;

@end

@implementation HistorySubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect winFrame = [[UIScreen mainScreen] bounds];
    CGRect tableFrame = CGRectMake(0, 100, winFrame.size.width, winFrame.size.height-200);
    self.historyTable = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    self.historyTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.historyTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.view.backgroundColor = [UIColor whiteColor];
    self.historyTable.dataSource = self;
    self.historyTable.delegate = self;
    [self.view addSubview:self.historyTable];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *c = [self.historyTable dequeueReusableCellWithIdentifier:@"Cell"];
    NSString *item = [[HistoryRecorder shareInstance].records objectAtIndex:indexPath.row];
    c.textLabel.text = item;
    return c;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[HistoryRecorder shareInstance].records count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:@"YYYY-MM-dd"];
    //现在时间
    NSDate *datenow = [NSDate date];
    //将NSDate按formatter格式转成NSString
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    NSLog(@"currentTimeString =  %@",currentTimeString);
    return currentTimeString;
    
}

@end
