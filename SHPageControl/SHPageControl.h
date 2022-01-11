//
//  SHPageControl.h
//  Example
//
//  Created by 陈胜辉 on 2022/1/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHPageControl : UIView

#pragma mark - 必传
//所有个数
@property (nonatomic, assign) NSInteger numberOfPages;

#pragma mark - 选传
//当前位置
@property (nonatomic, assign) NSInteger currentPage;
//单个隐藏（默认YES）
@property (nonatomic) BOOL hidesForSinglePage;

#pragma mark 自定义
//选中视图
@property (nonatomic, strong) UIImageView *selectView;
//未选中视图
@property (nonatomic, strong) UIImageView *unSelectView;
//间隔(默认 8)
@property (nonatomic, assign) CGFloat space;
//对齐方式（默认居中 用了系统的省事，左右中）
@property (nonatomic, assign) NSTextAlignment alignnment;

#pragma mark - 方法
//刷新界面
- (void)reloadView;

@end

NS_ASSUME_NONNULL_END
