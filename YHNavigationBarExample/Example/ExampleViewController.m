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
    [self.swShowNav setOn:!self.yh_prefersNavigationBarHidden];
    self.segmentedControl.selectedSegmentIndex = self.yh_interactivePopType;
    [self.segmentedControl setHidden:(self.navigationController.viewControllers.count == 1)];
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
