//
//  ScrollViewTestViewController.m
//  YHNavigationBarExample
//
//  Created by chenyehong on 2021/4/19.
//

#import "ScrollViewTestViewController.h"
#import "YHNavigationKit.h"
#import "AppDelegate.h"

@interface MyScrollView : UIScrollView<UIGestureRecognizerDelegate>

@end

@interface ScrollViewTestViewController ()

@end

@implementation ScrollViewTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"ScrollViewTestViewController";
    self.yh_prefersNavigationBarHidden = YES;
    self.yh_interactivePopType = YHViewControllerInteractivePopTypeFullScreen;
    
    UIScrollView *scrollView = [[MyScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = UIColor.lightGrayColor;
    scrollView.bounces = NO;
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:scrollView];

    [scrollView setContentSize:CGSizeMake(1000, 1000)];

    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    lb.backgroundColor = UIColor.redColor;
    lb.text = @"label";
    [scrollView addSubview:lb];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientChange:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
}

- (void)orientChange:(NSNotification *)notification{
    UIInterfaceOrientation interfaceOritation = [[UIApplication sharedApplication] statusBarOrientation];
    if (interfaceOritation == UIInterfaceOrientationPortrait) {
        self.yh_interactivePopType = YHViewControllerInteractivePopTypeFullScreen;
    } else {
        self.yh_interactivePopType = YHViewControllerInteractivePopTypeNone;
    }
}

//兼容横屏
- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

-(void)dealloc{
    NSLog(@"%s", __func__);
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

@implementation MyScrollView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    if ([otherGestureRecognizer isKindOfClass:[YHNavigationFullScreenPopGesture class]]
        || [@"_UIParallaxTransitionPanGestureRecognizer" isEqualToString:NSStringFromClass([otherGestureRecognizer class])]) {
        return self.contentOffset.x <= 0;
    }

    return NO;
}

@end
