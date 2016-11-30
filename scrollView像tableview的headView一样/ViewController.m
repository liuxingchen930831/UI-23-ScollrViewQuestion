//
//  ViewController.m
//  scrollView像tableview的headView一样
//
//  Created by liuxingchen on 16/11/30.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.blueView.frame));

}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat imageH = self.imageView.frame.size.height;
    CGFloat offsetY = scrollView.contentOffset.y;
    if ( offsetY >= imageH) {
        // 将红色控件添加到控制器的view中，设置Y值为0
        CGRect redF = self.redView.frame;
        redF.origin.y = 0;
        self.redView.frame = redF;
        [self.view addSubview:self.redView];
    }else{
        // 将红色控件添加到控制器的view中，设置Y值为0
        CGRect redF = self.redView.frame;
        redF.origin.y = 140;
        self.redView.frame = redF;
        [self.scrollView addSubview:self.redView];
    }
    if (offsetY < 0) {
        CGFloat scale = 1 - (offsetY / 70);
        self.imageView.transform = CGAffineTransformMakeScale(scale, scale);
    }
}
@end
