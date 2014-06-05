//
//  AppDelegate.h
//  hockey
//
//  Created by Compean on 22/08/13.
//  Copyright (c) 2013 Bithound. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserConfiguration.h"

// Ref.: http://paulpeelen.com/2011/11/30/ios-4-ios-5-tutorial-uialertview-with-link-to-wifi-or-settings-app-using-reachability-and-xcode-4-2/
// Files downloaded from: https://developer.apple.com/library/ios/samplecode/Reachability/Introduction/Intro.html
#import "Reachability.h"

@class NavigationController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *viewController;

@property UserConfiguration *userConfiguration;

-(BOOL)reachable;

@end
