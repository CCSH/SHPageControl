//
//  SHPageControl.m
//  Example
//
//  Created by 陈胜辉 on 2022/1/10.
//

#import "SHPageControl.h"
#import "UIView+SHExtension.h"

@interface SHPageControl ()

@property (nonatomic, strong) NSMutableArray <UIView *>*viewArr;

@end

@implementation SHPageControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.selectView = [self getPageView];
        self.unSelectView = [self getPageView];
        self.unSelectView.backgroundColor = [UIColor lightGrayColor];
        
        self.space = 8;
        self.alignnment = NSTextAlignmentCenter;
        self.viewArr = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)setCurrentPage:(NSInteger)currentPage{
    if (_currentPage == currentPage) {
        return;
    }
    
    if (currentPage >= self.numberOfPages) {
        currentPage = 0;
    }
    if (currentPage < 0) {
        currentPage = 0;
    }
    
    if (self.viewArr.count) {
        //交换位置
        [self.viewArr exchangeObjectAtIndex:_currentPage withObjectAtIndex:currentPage];
        //动画可以自己定义
        [UIView animateWithDuration:0.1 animations:^{
            __block CGFloat view_x = 0;
            [self.viewArr enumerateObjectsUsingBlock:^(UIView *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.x = view_x;
                view_x = obj.maxX + self.space;
            }];
        }];
    }
    
    _currentPage = currentPage;
}

#pragma mark - 私有方法
- (UIImageView *)getPageView{
    UIImageView *view = [[UIImageView alloc]init];
    view.size = CGSizeMake(8, 8);
    view.backgroundColor = [UIColor whiteColor];
    view.layer.borderColor = [UIColor whiteColor].CGColor;
    view.layer.cornerRadius = view.height/2;
    view.layer.masksToBounds = YES;
    return view;
}

#pragma mark 复制
- (id)copy_obj:(id)obj
{
    NSData *temp = [NSKeyedArchiver archivedDataWithRootObject:obj];
    return [NSKeyedUnarchiver unarchiveObjectWithData:temp];
}

#pragma mark - 公共方法
- (void)reloadView{
    //移除所有
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.viewArr removeAllObjects];
    
    if (self.numberOfPages <= 0) {
        return;
    }
    
    if (self.hidesForSinglePage) {
        if (self.numberOfPages == 1) {
            return;
        }
    }
    
    //初始化
    self.unSelectView.origin = CGPointZero;
    self.selectView.origin = CGPointZero;

    CGFloat view_x = 0;
    UIView *bgView = [[UIView alloc]init];
    [self addSubview:bgView];
    
    bgView.height = self.height;
    for (int i = 0; i < self.numberOfPages ; i++) {
        UIView *view = [self copy_obj:self.unSelectView];
        [view setValue:[self copy_obj:self.unSelectView.layer] forKey:@"layer"];
        if (i == self.currentPage) {
            view = self.selectView;
        }
        
        view.x = view_x;
        view.centerY = self.height/2;
        
        [bgView addSubview:view];
        [self.viewArr addObject:view];
        
        view_x = view.maxX + self.space;
    }
    
    bgView.width = view_x - self.space;
    
    //对齐方式
    switch (self.alignnment) {
        case NSTextAlignmentLeft:
        {
            bgView.x = 0;
        }
            break;
        case NSTextAlignmentRight:
        {
            bgView.x = self.width - bgView.width;
        }
            break;
        default:
        {
            bgView.centerX = self.width/2;
        }
            break;
    }
}

@end
