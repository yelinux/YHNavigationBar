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
    nav.navigationBar.translucent = translucent;//是否透明
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *appearnace = [[UINavigationBarAppearance alloc] init];
        [appearnace configureWithOpaqueBackground];
        appearnace.backgroundColor = UIColor.blueColor;//背景色
//        appearnace.backgroundImage
        appearnace.titleTextAttributes = @{NSForegroundColorAttributeName:UIColor.redColor};//标题文本样式
        appearnace.shadowColor = UIColor.redColor;//分割线颜色
        nav.navigationBar.standardAppearance = appearnace;
        nav.navigationBar.scrollEdgeAppearance = appearnace;
    } else {
        // Fallback on earlier versions
        [nav.navigationBar setBarTintColor:UIColor.blueColor];//背景色
//        [nav.navigationBar setTintColor:UIColor.blueColor];//默认返回按钮颜色
        [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColor.redColor}];//标题文本样式
        [nav.navigationBar setShadowImage:[self imageWithColor:UIColor.redColor]];//分割线颜色
    }
    
    [self addChildViewController:nav];
}

- (BOOL)shouldAutorotate {
    return self.selectedViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.selectedViewController supportedInterfaceOrientations];
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
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
