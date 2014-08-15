//
//  AppDelegate.h
//  POC_AdaptiveDesign
//
//  Created by Wang, Jinlian on 6/24/14.
//  Copyright (c) 2014 capitalone. All rights reserved.
//

#import <UIKit/UIKit.h>

#define getAppDelegate() (AppDelegate *)[[UIApplication sharedApplication] delegate]

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UISplitViewController *mainSplitController;

@end

