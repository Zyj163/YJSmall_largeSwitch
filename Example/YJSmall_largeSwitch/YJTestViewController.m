//
//  YJTestViewController.m
//  YJSmall_largeSwitch
//
//  Created by ddn on 2017/8/15.
//  Copyright © 2017年 Zyj163. All rights reserved.
//

#import "YJTestViewController.h"
#import "UIImageView+WebCache.h"

@interface YJTestViewController ()

@end

@implementation YJTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	UIBarButtonItem *dele = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStyleDone target:self action:@selector(clickOnDeleItem)];
	self.navigationItem.rightBarButtonItem = dele;
}

- (void)clickOnDeleItem
{
	[self removeModelAtIndex:self.currentIndexPath.item];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	YJSmall_largeCell *cell = [super collectionView:collectionView cellForItemAtIndexPath:indexPath];
	__weak typeof(cell) wc = cell;
	[cell setFillImage:^(UIImageView *imageView, void(^completion)(UIImage *image)){
		__strong typeof(wc) cell = wc;
		[imageView sd_setImageWithURL:[NSURL URLWithString:cell.model.largeImage] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
			completion(image);
		}];
	}];
	cell.backgroundColor = [UIColor redColor];
	return cell;
}

@end
