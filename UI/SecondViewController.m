//
//  SecondViewController.m
//  UI
//
//  Created by 钟婕 on 2021/4/14.
//  Copyright © 2021年 钟婕. All rights reserved.
//

#import "SecondViewController.h"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface SecondViewController ()

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) NSArray *btnNameArray;
@property (nonatomic, strong) NSArray *VCArray;

@end

@implementation SecondViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _btnNameArray = @[@"收藏", @"历史", @"服务", @"设置"];
        _VCArray = @[[FavoriteSubViewController new], [HistorySubViewController new], [ServiceSubViewController new], [SettingSubViewController new]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    // init imageview
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"watermelon"]];
    self.imageView.frame = CGRectMake(0, 100, SCREENWIDTH, 300);
    [self.view addSubview:self.imageView];
    
    // init collectionView
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(SCREENWIDTH / 2, 200);
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 400, SCREENWIDTH, SCREENHEIGHT - 400) collectionViewLayout:layout];
    self.collectionView.backgroundColor = UIColor.whiteColor;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:self.collectionView];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

// 返回cell之间行间隙
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
// 返回cell之间列间隙
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = UIColor.whiteColor;
    
    UIImage *image = [UIImage imageNamed:[self.btnNameArray objectAtIndex:indexPath.row]];
    UIImage *newImage;
    UIGraphicsBeginImageContext(CGSizeMake(55, 55));
    [image drawInRect:CGRectMake(0, 0, 55, 55)];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIButton *btn = [[UIButton alloc] initWithFrame:(CGRect)CGRectMake(0, 0, SCREENWIDTH / 2, 200)];
    [btn setImage:newImage forState:UIControlStateNormal];
    [btn setTitle:[self.btnNameArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    [btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(50, -55, 0, 0)];//top, left, bottom, right
    [btn setImageEdgeInsets:UIEdgeInsetsMake(5, 35, 45, 0)];
    btn.tag = indexPath.row;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:btn];
    return cell;
}

- (void)btnClick:(UIButton *)btn {
    UIViewController *VC = [self.VCArray objectAtIndex:btn.tag];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
