//
//  YHNavigationController.m
//  YHNavigationBarExample
//
//  Created by chenyehong on 2021/4/19.
//

#import "YHNavigationController.h"
#import "YHNavigationDelegateObject.h"

@interface YHNavigationController ()

@property (strong, nonatomic) YHNavigationDelegateObject *delegateObject;

@end

@implementation YHNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegateObject = [[YHNavigationDelegateObject alloc] initWithNavigationController:self];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (BOOL)shouldAutorotate {
    return self.topViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
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
