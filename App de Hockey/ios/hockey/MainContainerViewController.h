//
//  ViewController.h
//  hockey
//
//  Created by Compean on 22/08/13.
//  Copyright (c) 2013 Bithound. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainContainerViewController.h"
#import "HockeyTableController.h"
#import "Torneo.h"
#import "KxMenu.h"

@interface MainContainerViewController : UIViewController <TorneoDelegate, PopupMenuDelegate>

@property (nonatomic, strong) HockeyTableController *hockeyTableViewController;
@property (nonatomic, strong) NewsPanelController *newsPanelViewController;

@end
