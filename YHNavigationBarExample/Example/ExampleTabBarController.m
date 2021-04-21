//
//  ExampleTabBarController.m
//  YHNavigationBarExample
//
//  Created by chenyehong on 2021/4/20.
//

#import "ExampleTabBarController.h"
#import "ExampleViewController.h"
#import "ExampleTranslucentViewController.h"
#import "YHNavigationKit.h"

@interface ExampleTabBarController ()

@end

@implementation ExampleTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupChildVc:[[ExampleViewController alloc] init] title:@"tab1" isHiddenNavgationBar:YES translucent:NO];
    [self setupChildVc:[[ExampleTranslucentViewController alloc] init] title:@"tab2" isHiddenNavgationBar:NO translucent:YES];
}

- (void)setupChildVc:(UIViewController *)vc
               title:(NSString *)title
isHiddenNavgationBar:(BOOL)isHidden
         translucent:(BOOL)translucent{
    vc.title = title;
    vc.yh_prefersNavigationBarHidden = isHidden;
    YHNavigationController *nav = [[YHNavigationController alloc] initWithRootViewController:vc];
    nav.navigationBar.translucent = translucent;
    [self addChildViewController:nav];
}

- (BOOL)shouldAutorotate {
    return self.selectedViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.selectedViewController supportedInterfaceOrientations];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
