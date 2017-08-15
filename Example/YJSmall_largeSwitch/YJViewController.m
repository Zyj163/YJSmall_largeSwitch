//
//  YJViewController.m
//  YJSmall_largeSwitch
//
//  Created by Zyj163 on 08/15/2017.
//  Copyright (c) 2017 Zyj163. All rights reserved.
//

#import "YJViewController.h"
#import "YJTestViewController.h"
#import "YJSwitchModel.h"

#import "YJTransition.h"

@interface YJViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) NSMutableArray *largeModels;

@end

@implementation YJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
	layout.itemSize = CGSizeMake(50, 50);
	layout.minimumLineSpacing = 10;
	layout.minimumInteritemSpacing = 10;
	UICollectionView *c = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
	c.dataSource = self;
	c.delegate = self;
	[c registerClass:[YJSmall_largeCell class] forCellWithReuseIdentifier:@"cell"];
	[self.view addSubview:c];
	
	self.largeModels = @[].mutableCopy;
	
	for (NSInteger idx = 0; idx < 10; idx ++) {
		YJSwitchModel *switchModel = [YJSwitchModel new];
		switchModel.w = 100;
		switchModel.h = 100;
		[self.largeModels addObject:switchModel];
	}
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return self.largeModels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
	cell.backgroundColor = [UIColor redColor];
	return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	YJSmall_largeCell *cell = (YJSmall_largeCell *)[collectionView cellForItemAtIndexPath:indexPath];
	YJTestViewController *largeVc = [YJTestViewController small_largeViewControllerWithModels:self.largeModels cellClass:nil];
	[largeVc yj_customModalWithAnimationType:YJTransAnimationTypeSizeToSize andDuration:0.25 animationIfNeed:nil];
	largeVc.view.yj_maskCenter = [YJSmall_largeHelper calculateMaskCenterWithView:cell inView:nil];
	largeVc.view.yj_maskSize = CGSizeMake(50, 50);
	largeVc.currentIndexPath = indexPath;
//	largeVc.delegate = self;
	[self presentViewController:largeVc animated:YES completion:nil];

}

@end
