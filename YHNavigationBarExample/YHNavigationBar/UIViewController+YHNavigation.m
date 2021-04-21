//
//  UIViewController+YHNavigation.m
//  YHNavigationBarExample
//
//  Created by chenyehong on 2021/4/19.
//

#import "UIViewController+YHNavigation.h"
#import <objc/runtime.h>

@implementation UIViewController (YHNavigation)

- (BOOL)yh_prefersNavigationBarHidden{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setYh_prefersNavigationBarHidden:(BOOL)hidden{
    objc_setAssociatedObject(self, @selector(yh_prefersNavigationBarHidden), @(hidden), OBJC_ASSOCIATION_ASSIGN);
    if (self.navigationController.topViewController == self) {
        [self.navigationController setNavigationBarHidden:hidden animated:YES];
    }
}

- (YHViewControllerInteractivePopType)yh_interactivePopType{
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

-(void)setYh_interactivePopType:(YHViewControllerInteractivePopType)type{
    objc_setAssociatedObject(self, @selector(yh_interactivePopType), @(type), OBJC_ASSOCIATION_ASSIGN);
}

@end
