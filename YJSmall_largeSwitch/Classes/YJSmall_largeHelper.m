//
//  YJSmall_largeHelper.m
//  yyox
//
//  Created by ddn on 2017/3/15.
//  Copyright © 2017年 Panjiang. All rights reserved.
//

#import "YJSmall_largeHelper.h"

@implementation YJSmall_largeHelper

+ (CGPoint)calculateMaskCenterWithView:(UIView *)view inView:(UIView *)container
{
	CGRect absFrame = [view convertRect:view.bounds toView:container];
	return CGPointMake(CGRectGetMidX(absFrame), CGRectGetMidY(absFrame));
}

+ (CGSize)calculateMaskSizeWithView:(UIImageView *)view inView:(UIView *)container
{
	CGSize seeImageSize = CGSizeZero;
	UIImage *image = view.image;
	CGFloat imageScale = image.size.height/image.size.width;
	if (imageScale > view.bounds.size.height/view.bounds.size.width) {
		seeImageSize = CGSizeMake(view.bounds.size.height/imageScale, view.bounds.size.height);
	} else {
		seeImageSize = CGSizeMake(view.bounds.size.width, view.bounds.size.width*imageScale);
	}
	
	
	CGSize seeLargeImageSize = CGSizeZero;
	if (imageScale > (container.bounds.size.height-20)/(container.bounds.size.width-20)) {
		seeLargeImageSize = CGSizeMake((container.bounds.size.height-20)/imageScale, container.bounds.size.height-20);
	} else {
		seeLargeImageSize = CGSizeMake(container.bounds.size.width-20, (container.bounds.size.width-20)*imageScale);
	}

	return CGSizeMake(container.bounds.size.width*(seeImageSize.width/seeLargeImageSize.width), container.bounds.size.height*(seeImageSize.height/seeLargeImageSize.height));
}

@end
