//
//  ExampleTranslucentViewController.m
//  YHNavigationBarExample
//
//  Created by chenyehong on 2021/4/21.
//

#import "ExampleTranslucentViewController.h"
#import "ExampleViewController.h"

@interface ExampleTranslucentViewController ()

@end

@implementation ExampleTranslucentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [btn setTitle:@"push" forState:UIControlStateNormal];
    btn.backgroundColor = UIColor.redColor;
    [btn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickPush) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)clickPush{
    ExampleViewController *vc = [[ExampleViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
