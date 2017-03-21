//
//  AppDelegate.m
//  volunteer-test
//
//  Created by apple on 2017/3/21.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "AppDelegate.h"
#import "StartPageViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    StartPageViewController *viewc = [[StartPageViewController alloc]init];
    self.window.rootViewController = viewc;
    [self.window makeKeyAndVisible];
    
    [self performSelector:@selector(inputMainView) withObject:nil afterDelay:2.5f];
    
    return YES;
}
- (void)inputMainView {
    
    self.window.rootViewController = [self setupViewControllers];
}
- (UITabBarController *)setupViewControllers {
    NSArray *vcTitles = @[@"辽宁志愿购",@"分类",@"购物车",@"我的"];
    NSArray *vcNames = @[@"FirstViewController",@"SecondViewController",@"ThirdViewController",@"FourthViewController"];
    NSArray *images = @[@"home",@"classify",@"car",@"my"];
    NSArray *selectImages = @[@"home",@"classify",@"car",@"my"];
    NSMutableArray *vcArray = [NSMutableArray array];
    UIViewController *rvc = nil;
    
    for (int i = 0; i<4; i++) {
        NSString *vcName = vcNames[i];
        
        rvc = [[(NSClassFromString(vcName))alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:rvc];
        nav.navigationBar.backgroundColor = UIColorFromRGB(0x2196f3);
        nav.title = vcTitles[i];
        [vcArray addObject:nav];
        [self setTabBarItem:nav andImageName:images[i] andSelectedImageName:selectImages[i]];
    }
    UITabBarController *tbc = [[UITabBarController alloc]init];
    tbc.viewControllers = vcArray;
    
    return tbc;
}

-(void)setTabBarItem:(UINavigationController *)navi andImageName:(NSString *)imageName andSelectedImageName:(NSString *)selectedImageName
{
    CGFloat scaleTime = 1.7;
    
    [navi.navigationBar setBackgroundColor:[UIColor whiteColor]];
    NSString *path1 = [[NSBundle mainBundle]pathForResource:imageName ofType:@"png"];
    NSData *data1 = [NSData dataWithContentsOfFile:path1];
    UIImage *image1 = [[UIImage alloc]initWithData:data1 scale:scaleTime];
    image1 = [image1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navi.tabBarItem.image = image1;
    
    
    NSString *path2 = [[NSBundle mainBundle]pathForResource:selectedImageName ofType:@"png"];
    NSData *data2 = [NSData dataWithContentsOfFile:path2];
    UIImage *image2 = [[UIImage alloc]initWithData:data2 scale:scaleTime];
    image2 = [image2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navi.tabBarItem.selectedImage = image2;
    
    navi.tabBarController.tabBar.tintColor = kNaviColor;
    
    [navi.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:UIColorFromRGB(0x666666)} forState:UIControlStateNormal];
    [navi.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:UIColorFromRGB(0xff5000)} forState:UIControlStateSelected];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
