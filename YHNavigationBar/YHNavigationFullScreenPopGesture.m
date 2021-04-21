//
//  YHNavigationFullScreenPopGesture.m
//  YHNavigationBarExample
//
//  Created by chenyehong on 2021/4/20.
//

#import "YHNavigationFullScreenPopGesture.h"
#import "UIViewController+YHNavigation.h"

@interface YHNavigationFullScreenPopGesture()<UIGestureRecognizerDelegate>
/// 当前处理的导航控制器
@property (nonatomic, weak) YHNavigationController *navigationController;
@end

@implementation YHNavigationFullScreenPopGesture

-(instancetype)initWithTarget:(id)target action:(SEL)action navigationController:(YHNavigationController *)navigationController{
    if (self = [super initWithTarget:target action:action]) {
        self.delegate = self;
        self.navigationController = navigationController;
    }
    return self;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.navigationController.viewControllers.count > 1) {
        UIViewController *visibleVC = self.navigationController.visibleViewController;
        if (visibleVC.yh_interactivePopType == YHViewControllerInteractivePopTypeFullScreen) {
            return YES;
        }
        if(visibleVC.yh_interactivePopType == YHViewControllerInteractivePopTypeFollowNav
                  && self.navigationController.interactivePopType == YHNavigationInteractivePopTypeFullScreen){
            return YES;
        }
    }
    return NO;
}

@end
