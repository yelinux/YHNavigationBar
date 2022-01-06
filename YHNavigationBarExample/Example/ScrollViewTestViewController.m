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
    lb.userInteractionEnabled = YES;
    [lb addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickClose)]];
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

-(void)clickClose{
    UIInterfaceOrientation interfaceOritation = [[UIApplication sharedApplication] statusBarOrientation];
    if (interfaceOritation == UIInterfaceOrientationPortrait) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self setInterfaceOrientation:UIInterfaceOrientationPortrait];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
        });
    }
}

//强制转屏（这个方法最好放在BaseVController中）
- (void)setInterfaceOrientation:(UIInterfaceOrientation)orientation{
//    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
//        SEL selector  = NSSelectorFromString(@"setOrientation:");
//        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
//        [invocation setSelector:selector];
//        [invocation setTarget:[UIDevice currentDevice]];
//        // 从2开始是因为前两个参数已经被selector和target占用
//        [invocation setArgument:&orientation atIndex:2];
//        [invocation invoke];
//    }
    [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationUnknown) forKey:@"orientation"];
    [[UIDevice currentDevice] setValue:@(orientation) forKey:@"orientation"];
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
