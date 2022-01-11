//
//  ViewController.m
//  Example
//
//  Created by 陈胜辉 on 2022/1/10.
//

#import "ViewController.h"
#import "SHPageControl.h"
#import <UIView+SHExtension.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SHPageControl *page = [[SHPageControl alloc]init];
    page.backgroundColor = [UIColor orangeColor];
    page.frame = CGRectMake(50, 100, self.view.width - 2*50, 30);
    page.numberOfPages = 5;
    [page reloadView];
    
    [self.view addSubview:page];
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
        ++page.currentPage;
    }];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}


@end
