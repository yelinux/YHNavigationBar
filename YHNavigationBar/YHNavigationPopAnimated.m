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
    
    CGFloat fromW = fromViewController.view.bounds.size.width;
    CGFloat fromH = fromViewController.view.bounds.size.height;
    
    CGFloat toW = toViewController.view.bounds.size.width;
    CGFloat toH = toViewController.view.bounds.size.height;
    CGFloat toX = - (0.3 * toW);
    CGFloat toY = toViewController.view.frame.origin.y;
    
//    if (!toViewController.navigationController.navigationBar.translucent) {
//        if (!toViewController.yh_prefersNavigationBarHidden && fromViewController.yh_prefersNavigationBarHidden) {
//            toY += toViewController.navigationController.navigationBar.frame.size.height;
//            toH -= toViewController.navigationController.navigationBar.frame.size.height;
//        }
//    }
    
    __block UIView *toView = toViewController.view;
    toView.frame = CGRectMake(toX, toY, toW, toH);
    
    [UIView animateWithDuration:TransitionDuration animations:^{
        fromViewController.view.frame = CGRectMake(fromW, fromViewController.view.frame.origin.y, fromW, fromH);
        toView.frame = CGRectMake(0, toY, toW, toH);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

@end
