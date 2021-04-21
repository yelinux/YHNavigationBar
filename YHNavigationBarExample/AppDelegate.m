//
//  AppDelegate.m
//  YHNavigationBarExample
//
//  Created by chenyehong on 2021/4/19.
//

#import "AppDelegate.h"
#import "ExampleViewController.h"
#import "ExampleTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ExampleTabBarController *vc = [[ExampleTabBarController alloc] init];
    self.window.rootViewController = vc;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

@end
