//
//  TopBeersViewController.h
//  BeerMeUp
//
//  Created by Lay Gonzalez Romero on 05/10/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopBeersViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>


@property (strong, nonatomic)NSArray *beers;

@end
