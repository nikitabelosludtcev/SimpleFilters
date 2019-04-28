//
//  AppDelegate.m
//  AIFactoryPhotoFiltersApp
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//

#import "AppDelegate.h"
#import "AppCoordinator.h"

@interface AppDelegate ()

@property (strong, nonatomic) AppCoordinator *appCoordinator;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] init];
    [self.window makeKeyAndVisible];
    
    self.appCoordinator = [[AppCoordinator alloc] initWithKeyWindow:self.window];
    [self.appCoordinator strat];
    
    return YES;
}

@end
