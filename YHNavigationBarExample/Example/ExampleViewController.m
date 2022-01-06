//
//  ExampleViewController.m
//  YHNavigationBarExample
//
//  Created by chenyehong on 2021/4/19.
//

#import "ExampleViewController.h"
#import "ScrollViewTestViewController.h"
#import "YHNavigationKit.h"

@interface ExampleViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *swShowNav;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@end

@implementation ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = UIColor.whiteColor;
    
    if (self.navigationController.viewControllers.count > 1) {
        //左边按钮
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        backButton.frame = CGRectMake(0, 0, 40, 40);
        backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [backButton addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
        [backButton setImage:[UIImage imageNamed:@"nav_icon_back"] forState:UIControlStateNormal];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        
//        //两个左按钮
//        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
////        closeBtn.frame = CGRectMake(0, 0, 40, 40);
//        closeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        [closeBtn addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
//        [closeBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
//        [closeBtn setTitle:@"close" forState:UIControlStateNormal];
//        self.navigationItem.leftBarButtonItems = @[[[UIBarButtonItem alloc] initWithCustomView:backButton], [[UIBarButtonItem alloc] initWithCustomView:closeBtn]];
        
        //右边按钮
        UIButton *doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [doneBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [doneBtn setTitle:@"Done" forState:UIControlStateNormal];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:doneBtn];
        
//        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [cancelBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
//        [cancelBtn setTitle:@"cancel" forState:UIControlStateNormal];
//        self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithCustomView:doneBtn], [[UIBarButtonItem alloc] initWithCustomView:cancelBtn]];
    }
    
    
    [self.swShowNav setOn:!self.yh_prefersNavigationBarHidden];
    self.segmentedControl.selectedSegmentIndex = self.yh_interactivePopType;
    [self.segmentedControl setHidden:(self.navigationController.viewControllers.count == 1)];
}

-(void)clickBack{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)switchShowNav:(id)sender {
    self.yh_prefersNavigationBarHidden = !self.swShowNav.on;
}

- (IBAction)segmentChange:(id)sender {
    self.yh_interactivePopType = self.segmentedControl.selectedSegmentIndex;
}

- (IBAction)clickPushNavVC:(id)sender {
    ExampleViewController *vc = [[ExampleViewController alloc] init];
    vc.title = [@"示例" stringByAppendingFormat:@"%lu", (unsigned long)self.navigationController.viewControllers.count];
    vc.yh_prefersNavigationBarHidden = NO;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)clickPushNoNavVC:(id)sender {
    ExampleViewController *vc = [[ExampleViewController alloc] init];
    vc.title = [@"示例" stringByAppendingFormat:@"%lu", (unsigned long)self.navigationController.viewControllers.count];
    vc.yh_prefersNavigationBarHidden = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)clickPresentNavVC:(id)sender {
    ExampleViewController *vc = [[ExampleViewController alloc] init];
    vc.title = [@"示例" stringByAppendingFormat:@"%lu", (unsigned long)self.navigationController.viewControllers.count];
    vc.yh_prefersNavigationBarHidden = NO;
    YHNavigationController *nav = [[YHNavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

- (IBAction)clickScrollView:(id)sender {
    ScrollViewTestViewController *vc = [[ScrollViewTestViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
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
