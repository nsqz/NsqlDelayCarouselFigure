//
//  NsqzCarouselView.h
//  nsqlDelayCarouseIFigure
//
//  Created by lanou on 16/5/7.
//  Copyright © 2016年 hl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NsqzCarouselView : UIView


- (id)initWithFrame:(CGRect)frame animationDuration:(NSTimeInterval)animationDuration;

/**
 *  页面图片的总个数
 */
@property (nonatomic, assign) NSInteger totalPagesCount;

/**
 *  刷新视图
 */
@property (nonatomic, copy) UIView *(^fetchContentViewAtIndex)(NSInteger pageIndex);
/**
 *  点击页面
 */
@property (nonatomic, copy) void (^TapActionBlock)(NSInteger pageIndex);

@end
