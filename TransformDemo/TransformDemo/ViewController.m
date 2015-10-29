//
//  ViewController.m
//  TransformDemo
//
//  Created by guojun on 10/29/15.
//  Copyright © 2015 guojunxu. All rights reserved.
//

#import "ViewController.h"

#define degreesToRadians(x) (M_PI * x / 180.0f)

@interface ViewController ()

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blackView;

@property (nonatomic, assign) BOOL isPortrait;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.redView addSubview:self.blackView];
    [self.view addSubview:self.redView];
}

- (IBAction)rotate{
    
    self.isPortrait = !self.isPortrait;
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    CGFloat width = MIN(screenSize.height, screenSize.width);
    CGFloat height = MAX(screenSize.height, screenSize.width);
    
    int degree = self.isPortrait ? 90 : 0;
    
    [UIView animateWithDuration:4.0 animations:^{
        self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(degree));
        self.view.frame = CGRectMake(0, 0, width, height);
        
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - Getters & Setters
- (UIView *)redView{
    if (!_redView) {
        _redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 32 * 3, 48 * 3)];
        _redView.backgroundColor = [UIColor redColor];
    }
    
    return _redView;
}

- (UIView *)blackView{
    if (!_blackView) {
        _blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        _blackView.backgroundColor = [UIColor blackColor];
    }
    
    return _blackView;
}

@end
