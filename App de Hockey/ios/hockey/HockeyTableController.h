//
//  HockeyTableController.h
//  deportes
//
//  Created by Compean on 22/08/13.
//  Copyright (c) 2013 juvs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsPanelController.h"
#import "Torneo.h"
#import "Juego.h"

@protocol HockeyTableControllerDelegate <NSObject>

@optional
- (void)movePanelUp;
- (void)movePanelDown;

@required
- (void)movePanelToOriginalPosition;

@end

@interface HockeyTableController : UIViewController <UITableViewDataSource, UITableViewDelegate, TorneoDelegate, JuegoDelegado>

@property (nonatomic, assign) id<HockeyTableControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIView *slidingBar;

@property (weak, nonatomic) IBOutlet UITableView *tablaJuegos;

- (void)getGamesForSelectedTournament;

@end
