//
//  YHNavigationPopAnimated.m
//  YHNavigationBarExample
//
//  Created by chenyehong on 2021/4/19.
//

#import "YHNavigationPopAnimated.h"
#import "UIViewController+YHNavigation.h"

#define TransitionDuration UINavigationControllerHideShowBarDuration

@implementation YHNavigationPopAnimated

#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return TransitionDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    // 获取容器
    UIView *containerView = [transitionContext containerView];
    
    // 获取转场前后的控制器
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
    
    CGFloat screenW = containerView.bounds.size.width;
    CGFloat screenH = containerView.bounds.size.height;
    
    CGFloat y = 0;
    if (!toViewController.navigationController.navigationBar.translucent) {
        if (!toViewController.yh_prefersNavigationBarHidden) {
            y += toViewController.navigationController.navigationBar.frame.size.height;
        }
        if (!fromViewController.yh_prefersNavigationBarHidden) {
            if (@available(iOS 11.0, *)) {
                y += [[UIApplication sharedApplication] delegate].window.safeAreaInsets.top;
            }
        }
    }
    
    __block UIView *toView = toViewController.view;
    toView.frame = CGRectMake(- (0.3 * screenW), y, screenW, screenH);
    
    [UIView animateWithDuration:TransitionDuration animations:^{
        fromViewController.view.frame = CGRectMake(screenW, fromViewController.view.frame.origin.y, screenW, screenH);
        toView.frame = CGRectMake(0, y, screenW, screenH);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

@end
