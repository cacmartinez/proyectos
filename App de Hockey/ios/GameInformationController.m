//
//  GameInformationController.m
//  hockey
//
//  Created by Compean on 25/08/13.
//  Copyright (c) 2013 Bithound. All rights reserved.
//

#import "GameInformationController.h"

@interface GameInformationController ()

@end

@implementation GameInformationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Game Info";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
