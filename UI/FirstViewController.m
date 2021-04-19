//
//  FirstVC.m
//  UI
//
//  Created by 钟婕 on 2021/4/14.
//  Copyright © 2021年 钟婕. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FirstViewController.h"
#import "HistoryRecorder.h"

@interface FirstViewController ()

@property (nonatomic, strong) UITableView *cellsTable;
@property (nonatomic, strong) UITextField *insertField;
@property (nonatomic, strong) UIButton *insertButton;
@property (nonatomic, strong) NSMutableArray *cells;

@end

@implementation FirstViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _cells = [NSMutableArray arrayWithObjects:
                  @"习近平对深化东西部协作作出重要指示",
                  @"这是一份值得珍藏的战“疫”感悟",
                  @"百炼成钢 | 第九集 命悬一线",
                  [UIImage imageNamed:@"photo"],
                  @"中国超2亿人单身",
                  @"中美发表应对气候危机联合声明",
                  @"我国家庭呈单身化趋势",
                  @"你能接受结婚没房没车",
                  @"你有为身材感到过自卑吗",nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set views frame
    CGRect winFrame = [[UIScreen mainScreen] bounds];
    CGRect tableFrame = CGRectMake(0, 80, winFrame.size.width, winFrame.size.height-100);
    CGRect fieldFrame = CGRectMake(20, 40, 300, 31);
    CGRect buttonFrame = CGRectMake(330, 40, 72, 31);
    
    // init cells table
    self.cellsTable = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    self.cellsTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.cellsTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.cellsTable setDataSource:self];
    [self.cellsTable setDelegate:self];
    [self.view addSubview:self.cellsTable];
    
    // init insert field
    self.insertField = [[UITextField alloc] initWithFrame:fieldFrame];
    self.insertField.borderStyle = UITextBorderStyleRoundedRect;
    self.insertField.placeholder = @"何炅父亲被强制执行 | 演员陈赫道歉";
    self.insertField.backgroundColor = [UIColor whiteColor];
    self.insertField.userInteractionEnabled = YES;
    [self.view addSubview:self.insertField];
    
    // init insert button
    self.insertButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.insertButton.frame = buttonFrame;
    self.insertButton.backgroundColor = [UIColor whiteColor];
    [self.insertButton setTitle:@"发布" forState:UIControlStateNormal];
    [self.insertButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //Target-Action callback
    [self.insertButton addTarget:self action:@selector(post:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.insertButton];
}

#pragma mark -Actions
- (void)post:(id)sender {
    NSString * str = [self.insertField text];
    
    if (str.length == 0) {
        return;
    }
    [self.cells addObject:str];
    [self.cellsTable reloadData];
    
    [self.insertField setText:@""];
    [self.insertField resignFirstResponder];
    
}

#pragma mark-TableViewDS
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.cells count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *c = [self.cellsTable dequeueReusableCellWithIdentifier:@"Cell"];
    
    id item = [self.cells objectAtIndex:indexPath.row];
    
    // 图片特殊处理
    if([item isKindOfClass:UIImage.class]) {
        CGRect winFrame = [[UIScreen mainScreen] bounds];
        UIImage *image = item;
        //调整图片尺寸
        UIImage *newImage;
        UIGraphicsBeginImageContext(CGSizeMake(winFrame.size.width, 400));
        [image drawInRect:CGRectMake(0,0, winFrame.size.width, 400)];
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        c.imageView.image = newImage;
    } else {
        c.textLabel.text = item;
    }
    
    return c;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id item = [self.cells objectAtIndex:indexPath.row];
    if([item isKindOfClass:UIImage.class]) {
        return 400;
    } else {
        return 40;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id item = [self.cells objectAtIndex:indexPath.row];
    if (![item isKindOfClass:UIImage.class]) {
        [[HistoryRecorder shareInstance] addRecord:[self.cells objectAtIndex:[indexPath row]]];
        NSString *msg = [[NSString alloc] initWithFormat:@"你选择的是: %@",[self.cells objectAtIndex:[indexPath row]]];
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"提示" message:msg preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"OK");
        }];
        [ac addAction:okAction];
        [self presentViewController:ac animated:YES completion:nil];
    }
}

@end
