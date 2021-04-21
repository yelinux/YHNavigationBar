//
//  UIViewController+YHNavigation.h
//  YHNavigationBarExample
//
//  Created by chenyehong on 2021/4/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger , YHViewControllerInteractivePopType) {
    /// 跟随navigationController
    YHViewControllerInteractivePopTypeFollowNav,
    /// 全屏侧滑
    YHViewControllerInteractivePopTypeFullScreen,
    /// 左侧侧滑
    YHViewControllerInteractivePopTypeLeftScreen,
    /// 无侧滑
    YHViewControllerInteractivePopTypeNone
};

@interface UIViewController (YHNavigation)

@property (nonatomic, assign) BOOL yh_prefersNavigationBarHidden;
@property (nonatomic, assign) YHViewControllerInteractivePopType yh_interactivePopType;

@end

NS_ASSUME_NONNULL_END
