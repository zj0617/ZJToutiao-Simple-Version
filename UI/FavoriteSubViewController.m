//
//  SubViewController.m
//  UI
//
//  Created by 钟婕 on 2021/4/15.
//  Copyright © 2021年 钟婕. All rights reserved.
//

#import "FavoriteSubViewController.h"

@interface FavoriteSubViewController ()

@property (nonatomic) NSMutableArray *items;
@property (nonatomic) UITableView *table;

@end

@implementation FavoriteSubViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _items = [NSMutableArray arrayWithObjects:
                  @"2020年我国新发癌症占全球23.7%",
                  @"陈伟霆问刘维杨迪是在取笑我吗",
                  @"迪丽热巴：我一定要演渣男",
                  @"太原一化工厂爆炸2人遇难",
                  @"江苏事业单位",
                  @"每年5000多吨外星尘埃落到地球",nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect winFrame = [[UIScreen mainScreen] bounds];
    CGRect tableFrame = CGRectMake(0, 100, winFrame.size.width, winFrame.size.height-200);
    self.table = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.view.backgroundColor = [UIColor whiteColor];
    self.table.dataSource = self;
    self.table.delegate = self;
    [self.view addSubview:self.table];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0) {
        UIImage *image = [UIImage imageNamed:@"生肖牛"];
        UITableViewCell *c = [self.table dequeueReusableCellWithIdentifier:@"Cell"];
        //调整图片尺寸
        UIImage *newImage;
        UIGraphicsBeginImageContext(CGSizeMake(380, 300));
        [image drawInRect:CGRectMake(0,0, 380, 300)];
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        c.imageView.image = newImage;
        return c;
        
    } else {
        UITableViewCell *c = [self.table dequeueReusableCellWithIdentifier:@"Cell"];
        NSString *item = [self.items objectAtIndex:indexPath.row-1];
        c.textLabel.text = item;
        //c.textLabel.backgroundColor = [UIColor redColor];
        return c;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count] + 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0) {
        return 400;
    }
    else {
        return 30;
    }
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
