//
//  ViewController.m
//  加载图片的进度条
//
//  Created by 郑小龙 on 16/8/3.
//  Copyright © 2016年 alon. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()

@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.imageView];
    
    
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.indicatorView.frame = CGRectMake(0, 0, 50, 50);
    self.indicatorView.center = self.view.center;
    [self.view addSubview:self.indicatorView];
    self.indicatorView.backgroundColor = [UIColor blackColor];
    
    [self.indicatorView startAnimating];
    NSLog(@"456");
    
    // http://img.bimg.126.net/photo/e1jRCwjvLS8Y0kmMWjk_ig==/5789095846008609614.jpg
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://img.bimg.126.net/photo/e1jRCwjvLS8Y0kmMWjk_ig==/5789095846008609614.jpg"] placeholderImage:nil options:SDWebImageCacheMemoryOnly progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        NSLog(@"123");
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSLog(@"4789");
        [self.indicatorView stopAnimating];
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
