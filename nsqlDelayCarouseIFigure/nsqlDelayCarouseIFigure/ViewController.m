//
//  ViewController.m
//  nsqlDelayCarouseIFigure
//
//  Created by lanou on 16/5/7.
//  Copyright © 2016年 hl. All rights reserved.
//

#import "ViewController.h"

#import "NsqzCarouselView.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *carouselArray; // 轮播图的数据源

@end

@implementation ViewController

-(NSMutableArray *)carouselArray {
    if (!_carouselArray) {
        self.carouselArray = [NSMutableArray array];
    }
    return _carouselArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0; i < 10; i ++) {
     NSString *imgStr  = [NSString stringWithFormat: @"Sample%d",i];
        [self.carouselArray addObject:imgStr];
    }
    [self creatCycleScrollView];
    
    // Do any additional setup after loading the view, typically from a nib.
}
// 创建滚动视图
- (void)creatCycleScrollView {
    NsqzCarouselView *cycleScrollView = [[NsqzCarouselView alloc] initWithFrame:CGRectMake(0, 44 + 20, ScreenWidth, 250) animationDuration:2];
    cycleScrollView.backgroundColor = [UIColor purpleColor];
    
    // 创建图片视图数组
    NSMutableArray *viewsArray = [@[] mutableCopy];
    for (int i = 0; i < self.carouselArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:cycleScrollView.bounds];
//        imageView.backgroundColor = [UIColor colorWithRed:arc4random()%256 / 255.f green:arc4random()%256 / 255.f blue:arc4random()%256 / 255.f alpha:1];
        imageView.image  = [UIImage imageNamed:self.carouselArray[i]];
        [viewsArray addObject:imageView];
    }
    [self.view addSubview:cycleScrollView];
    
    // 获取显示的图片视图
    cycleScrollView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
        return viewsArray[pageIndex];
    };
    // 滚动视图总个数
    cycleScrollView.totalPagesCount = viewsArray.count;
    
//    __weak NSArray *cycelArray = _carouselArray;
//    __weak ViewController *vc = self;
    cycleScrollView.TapActionBlock = ^(NSInteger pageIndex){
        NSLog(@"点击了第%ld个",(long)pageIndex);
        
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
