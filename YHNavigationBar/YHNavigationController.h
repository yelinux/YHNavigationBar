//
//  YHNavigationController.h
//  YHNavigationBarExample
//
//  Created by chenyehong on 2021/4/19.
//

#import <UIKit/UIKit.h>
#import "YHNavigationTransitionAnimated.h"
#import "YHNavigationScaleAnimated.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger , YHNavigationInteractivePopType) {
    /// 全屏侧滑
    YHNavigationInteractivePopTypeFullScreen,
    /// 左侧侧滑
    YHNavigationInteractivePopTypeLeftScreen,
    /// 无侧滑
    YHNavigationInteractivePopTypeNone
};

@interface YHNavigationController : UINavigationController

@property (assign, nonatomic) YHNavigationInteractivePopType interactivePopType;
@property (strong, nonatomic) YHNavigationBaseAnimated *pushPopAnimated;

@end

NS_ASSUME_NONNULL_END
