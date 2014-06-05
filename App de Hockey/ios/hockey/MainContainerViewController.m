//
//  ViewController.m
//  hockey
//
//  Created by Compean on 22/08/13.
//  Copyright (c) 2013 Bithound. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "MainContainerViewController.h"
#import "NewsPanelController.h"
#import "SBJson.h"
#

#define HOCKEY_TABLE_TAG 1
#define NEWS_PANEL_TAG 2

#define CORNER_RADIUS 4

#define SLIDE_TIMING .25
#define PANEL_HEIGHT 146

@interface MainContainerViewController () <HockeyTableControllerDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, assign) BOOL showingNewsPanel;
@property (nonatomic, assign) BOOL showPanel;
@property (nonatomic, assign) CGPoint preVelocity;
@property (nonatomic, assign) int * selectedRow;
@property NSMutableArray *itemsMenuTorneos;
@property NSArray *torneos;
@property BOOL showingMenu;
@property NSMutableDictionary *selectedItems;

@end

@implementation MainContainerViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //[self setupView];
        self.newsPanelViewController = [[NewsPanelController alloc] initWithNibName:@"NewsPanelController" bundle:nil];
        self.hockeyTableViewController = [[HockeyTableController alloc] initWithNibName:@"HockeyTableController" bundle:nil];
    }
    return self;
}

/**
 * Unmark all selected tournaments from the pop up menu
 */
- (void)unmarkAllPreviousSelectedItems{
    for (NSString *itemTitle in self.selectedItems) {
        KxMenuItem *item = self.selectedItems[itemTitle];
        [self unmarkItem:item];
    }
}

/**
 * Update the user interface of the pop up menu to show that it is selected with a checkmark icon
 */
- (void)markItem:(KxMenuItem *)item{
    item.image = [UIImage imageNamed:@"CheckIcon"];
}

/**
 * Unmark the specified item of the pop up menu
 */
- (void)unmarkItem:(KxMenuItem *)item{
    item.image = nil;
}

/**
 * Method that decides wich action to take when an item of the pop up menu from tournaments is selected
 */
- (void)menuItemSelected:(KxMenuItem *)sender{
    //if the selected item is the first object of the menu which is always the all tournaments item
    if ([sender.title isEqualToString:[(KxMenuItem *)self.itemsMenuTorneos[0] title]]) {
        //check if it was previously selected, if not then we need to uncheck every other option that was previously selected, and select this option
        if (![self.selectedItems objectForKey:sender.title]) {
            [self unmarkAllPreviousSelectedItems];
            self.selectedItems = [NSMutableDictionary dictionary];
            [self markItem:sender];
            [self.selectedItems setObject:sender forKey:sender.title];
        }
    } else { // else an option other than all tournaments was selected
        // check if the all tournaments option was previously selected, if it was then remove it from the selected items array
        if ([self.selectedItems objectForKey:[(KxMenuItem *)self.itemsMenuTorneos[0] title]]) {
            [self unmarkItem:self.itemsMenuTorneos[0]];
            [self.selectedItems removeObjectForKey:[(KxMenuItem *)self.itemsMenuTorneos[0] title]];
        }
        
        //if the selected option was selected then you must unselect it, and remove it from the array of selected items
        if ([self.selectedItems objectForKey:sender.title]) {
            [self unmarkItem:sender];
            [self.selectedItems removeObjectForKey:sender.title];
            
            //if by unselecting that option, your selected items count is now empty then it must select all tournaments by default
            if (self.selectedItems.count == 0) {
                [self markItem:self.itemsMenuTorneos[0]];
                [self.selectedItems setObject:self.itemsMenuTorneos[0] forKey:[(KxMenuItem *)self.itemsMenuTorneos[0] title]];
            }
            
        } else { // if the selected option was unselected then it must select it
            [self markItem:sender];
            [self.selectedItems setObject:sender forKey:sender.title];
        }
    }
    [KxMenu reloadView];
}

/**
 * Initial configuration and server calls
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupView];
    Torneo *torneo = [[Torneo alloc] init];
    torneo.delegate = self;
    [torneo requestCurrentTournamentsFromServer];
    KxMenuItem *menuItem = [KxMenuItem menuItem:@"Todos" image:[UIImage imageNamed:@"CheckIcon"] target:self action:@selector(menuItemSelected:)];
    self.itemsMenuTorneos = [NSMutableArray arrayWithObject:menuItem];
    self.torneos = [NSArray array];
    self.showingMenu = NO;
    self.selectedItems = [NSMutableDictionary dictionaryWithObject:menuItem forKey:menuItem.title];
    //self.menuTorneos = [[KxMenu alloc] init];
	// Do any additional setup after loading the view, typically from a nib.
}

/**
 * Delegate method call from TorneoDelegate in Torneo.h
 *
 * This method is called in response from the server of the method call to requestCurrentTournamentsFromServer
 */
-(void)torneosActuales:(NSArray *)torneos respuestaServidorConError:(NSError *)error{
    if (!error) {
        self.torneos = torneos;
        // fill the pop up menu with the tournaments information
        for (Torneo *torneo in torneos) {
            KxMenuItem *item = [KxMenuItem menuItem:torneo.nombre image:nil target:self action:@selector(menuItemSelected:)];
            [self.itemsMenuTorneos addObject:item];
        }
    } else {
        NSLog(@"error: %@",error.description);
    }
}

-(void)willDismissMenu{
    self.showingMenu = NO;
}

/**
 * This method is called when the right navigation item is pressed
 */
- (void)openTournamentsMenu{
    // if the menu was already showing then it should close it
    if (self.showingMenu) {
        [KxMenu dismissMenu];
        self.showingMenu = NO;
    } else { // otherwise open the menu
        CGRect frame = CGRectMake(self.view.frame.size.width - 90, self.navigationController.navigationBar.frame.size.height-self.view.frame.size.height/2, 100, 300);
        [KxMenu showMenuInView:self.view fromRect:frame menuItems:self.itemsMenuTorneos delegate:self];
        self.showingMenu = YES;
    }
}

/*
 *this method is invoked if there were any connection errors contacting the server when making a request of the tournaments web service
 */
-(void)torneoServerConnectionError:(NSError *)error{
    NSLog(@"%@",error.description);
}

- (void)viewWillAppear:(BOOL)animated{
    if (_showingNewsPanel) {
        _hockeyTableViewController.view.frame = CGRectMake(0, _newsPanelViewController.view.frame.size.height - PANEL_HEIGHT, self.view.frame.size.width, self.view.frame.size.height);    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refreshAll{
    // not implemented yet
}

/*
 * Setup the container views, touch gestures for each view, and navigation items
 */
-(void)setupView {
    //UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    //self.hockeyTableViewController = (HockeyTableController *)[storyboard instantiateViewControllerWithIdentifier:@"hockeyTableController"];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    //[self.navigationController setTitle:];
    self.navigationController.navigationBar.topItem.title  = @"Hockey Mty";
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshAll)];
    UIBarButtonItem *tournamentsButton = [[UIBarButtonItem alloc] initWithTitle:@"All Tourn." style:UIBarButtonItemStylePlain target:self action:@selector(openTournamentsMenu)];
    self.navigationItem.leftBarButtonItem = refreshButton;
    self.navigationItem.rightBarButtonItem = tournamentsButton;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    //self.newsPanelViewController = [[NewsPanelController alloc] initWithNibName:@"NewsPanelController" bundle:nil];
    self.newsPanelViewController.view.tag = NEWS_PANEL_TAG;
    
    [self.view addSubview:self.newsPanelViewController.view];
    
    [self addChildViewController:_newsPanelViewController];
    [_newsPanelViewController didMoveToParentViewController:self];
    
    
    //self.hockeyTableViewController = [[HockeyTableController alloc] initWithNibName:@"HockeyTableController" bundle:nil];
    UITableView * hockeyTableView = [self.hockeyTableViewController.view.subviews objectAtIndex:1];
    hockeyTableView.delegate = self.hockeyTableViewController;
    hockeyTableView.dataSource = self.hockeyTableViewController;
    hockeyTableView.scrollEnabled = NO;
	self.hockeyTableViewController.view.tag = HOCKEY_TABLE_TAG;
	self.hockeyTableViewController.delegate = self;
    
    [self showHockeyTableViewWithShadow:YES withOffset:-2];
	[self.view addSubview:self.hockeyTableViewController.view];
    
    
	[self addChildViewController:_hockeyTableViewController];
	[_hockeyTableViewController didMoveToParentViewController:self];
    
    
    
    _showingNewsPanel = YES;
    self.selectedRow = nil;
    
    //_hockeyTableViewController.view.frame = CGRectMake(0, 450, self.view.frame.size.width, self.view.frame.size.height);
    //_hockeyTableViewController.view.frame = CGRectMake(0, _newsPanelViewController.view.frame.size.height - PANEL_HEIGHT, self.view.frame.size.width, self.view.frame.size.height);
    //_hockeyTableViewController.view.frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - PANEL_HEIGHT, self.view.frame.size.width, self.view.frame.size.height);
    
    
    [self.view sendSubviewToBack:(UIView *)self.newsPanelViewController];
    //self.newsPanelViewController = (NewsPanelController *)[storyboard instantiateViewControllerWithIdentifier:@"newsPanelController"];
	
    
	[self setupGestures];
}

-(void)showHockeyTableViewWithShadow:(BOOL)value withOffset:(double)offset {
	if (value) {
		[_hockeyTableViewController.view.layer setCornerRadius:CORNER_RADIUS];
        //_hockeyTableViewController.view.layer.masksToBounds = YES;
		[_hockeyTableViewController.view.layer setShadowColor:[UIColor blackColor].CGColor];
		[_hockeyTableViewController.view.layer setShadowOpacity:0.8];
		[_hockeyTableViewController.view.layer setShadowOffset:CGSizeMake(offset, offset)];
        
        UIView *firstSubview =(UIView *)[self.hockeyTableViewController.view.subviews objectAtIndex:0];
        ((UIView *)[firstSubview.subviews objectAtIndex:0]).layer.cornerRadius = 60;
        firstSubview.layer.cornerRadius = CORNER_RADIUS;
        
        //CAShapeLayer * maskLayer = [CAShapeLayer layer];
        //maskLayer.path = [UIBezierPath bezierPathWithRoundedRect: firstSubview.bounds byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: (CGSize){CORNER_RADIUS, CORNER_RADIUS}].CGPath;
        
        //firstSubview.layer.mask = maskLayer;
        
        //((UIView *)[self.hockeyTableViewController.view.subviews objectAtIndex:0]).layer.masksToBounds = YES;
        //CAShapeLayer * maskLayer = [CAShapeLayer layer];
        //maskLayer.path = [UIBezierPath bezierPathWithRoundedRect: firstSubview.bounds byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: (CGSize){CORNER_RADIUS, CORNER_RADIUS}].CGPath;
        
        //firstSubview.layer.mask = maskLayer;
        
        
        
	} else {
		[_hockeyTableViewController.view.layer setCornerRadius:0.0f];
		[_hockeyTableViewController.view.layer setShadowOffset:CGSizeMake(offset, offset)];
	}
}

-(void)setupGestures {
	UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(movePanel:)];
	[panRecognizer setMinimumNumberOfTouches:1];
	[panRecognizer setMaximumNumberOfTouches:1];
	[panRecognizer setDelegate:self];
    
	[_hockeyTableViewController.view addGestureRecognizer:panRecognizer];
    
    //UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    //tapGesture.numberOfTapsRequired = 1;
    //[_hockeyTableViewController.view.subviews[1] addGestureRecognizer:tapGesture];
}


/**
 * This method has all the logic for the movement of the view in realtime when the user tries to slide the table with each of the games either to move it up to fill the screen or down to see the news feed images.
 */
-(void)movePanel:(id)sender {
    UITableView * hockeyTableView = [self.hockeyTableViewController.view.subviews objectAtIndex:1];
    [[hockeyTableView cellForRowAtIndexPath:hockeyTableView.indexPathForSelectedRow] setSelected:NO];
	[[[(UITapGestureRecognizer*)sender view] layer] removeAllAnimations];
    
	CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:self.view];
	CGPoint velocity = [(UIPanGestureRecognizer*)sender velocityInView:[sender view]];
    
	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        UIView *childView = nil;
        
        if(velocity.y > 0) {
            if (!_showingNewsPanel) {
                childView = [self getNewsPanelView];
            }
        }
        // make sure the view we're working with is front and center
        [self.view sendSubviewToBack:childView];
        [[sender view] bringSubviewToFront:[(UIPanGestureRecognizer*)sender view]];
	}
    
	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
        
        if(velocity.x > 0) {
            // NSLog(@"gesture went right");
        } else {
            // NSLog(@"gesture went left");
        }
        
        if (!_showPanel) {
            [self movePanelToOriginalPosition];
        } else {
            [self movePanelUp];
        }
	}
    
	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateChanged) {
        if(velocity.y > 0) {
             //NSLog(@"gesture went down");
        } else {
             //NSLog(@"gesture went up");
        }
        // are we more than halfway, if so, show the panel when done dragging by setting this value to YES (1)
        _showPanel = abs([sender view].center.y - _hockeyTableViewController.view.frame.size.height/2) < _hockeyTableViewController.view.frame.size.height/2;
        
        // allow dragging only in y coordinates by only updating the y coordinate with translation position
        //if ([sender view].center.y + translatedPoint.y >= _newsPanelViewController.view.center.y) {
        if (([sender view].center.y > [sender view].bounds.size.height/2) ||
            (velocity.y > 0 && [sender view].center.y == [sender view].bounds.size.height/2)) {
            [sender view].center = CGPointMake([sender view].center.x, [sender view].center.y + translatedPoint.y);
            [(UIPanGestureRecognizer*)sender setTranslation:CGPointMake(0,0) inView:self.view];
        } else {
            [sender view].center = CGPointMake([sender view].center.x, [sender view].bounds.size.height/2);
            [(UIPanGestureRecognizer*)sender setTranslation:CGPointMake(0,0) inView:self.view];
        }
        
        
        // if you needed to check for a change in direction, you could use this code to do so
        if(velocity.x*_preVelocity.x + velocity.y*_preVelocity.y > 0) {
            // NSLog(@"same direction");
        } else {
            // NSLog(@"opposite direction");
        }
        
        _preVelocity = velocity;
        
        //_hockeyTableViewController.view.frame = CGRectMake(_hockeyTableViewController.view.frame.origin.x, _hockeyTableViewController.view.frame.origin.y, _hockeyTableViewController.view.frame.size.width, self.view.frame.size.height - _hockeyTableViewController.view.frame.origin.y);
	}
    
}

-(void)movePanelToOriginalPosition {
    [self movePanelDown];
}

-(void)movePanelDown{
    UIView *childView = [self getNewsPanelView];
	[self.view sendSubviewToBack:childView];
    
	
    [UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            _hockeyTableViewController.view.frame = CGRectMake(0, self.view.frame.size.height - PANEL_HEIGHT, self.view.frame.size.width, self.view.frame.size.height);
    }
                     completion:^(BOOL finished) {
                         /*if (finished) {
                             
                             _centerViewController.rightButton.tag = 0;
                         }*/
                         UITableView * hockeyTableView = [self.hockeyTableViewController.view.subviews objectAtIndex:1];
                         hockeyTableView.scrollEnabled = NO;
                     }];
}

- (CGRect)statusBarFrameViewRect:(UIView*)view
{
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    
    CGRect statusBarWindowRect = [view.window convertRect:statusBarFrame fromWindow: nil];
    
    CGRect statusBarViewRect = [view convertRect:statusBarWindowRect fromView: nil];
    
    return statusBarViewRect;
}

-(void)movePanelUp{
    UIView *childView = [self getNewsPanelView];
	[self.view sendSubviewToBack:childView];
    
	
    [UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        _hockeyTableViewController.view.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height + [self statusBarFrameViewRect:self.view].size.height, self.view.frame.size.width, self.view.frame.size.height);
    }
                     completion:^(BOOL finished) {
                         /*if (finished) {
                          
                          _centerViewController.rightButton.tag = 0;
                          }*/
                         
                         if (_newsPanelViewController != nil) {
                             //[self.newsPanelViewController.view removeFromSuperview];
                             //self.newsPanelViewController = nil;
                             self.showingNewsPanel = NO;
                         }
                         // remove view shadows
                         [self showHockeyTableViewWithShadow:NO withOffset:0];
                         UITableView * hockeyTableView = [self.hockeyTableViewController.view.subviews objectAtIndex:1];
                         hockeyTableView.scrollEnabled = YES;
                     }];
}

-(UIView *)getNewsPanelView{
    // init view if it doesn't already exist
	if (_newsPanelViewController == nil)
	{
		// this is where you define the view for the left panel
		self.newsPanelViewController = [[NewsPanelController alloc] initWithNibName:@"NewsPanelController" bundle:nil];
		self.newsPanelViewController.view.tag = NEWS_PANEL_TAG;
        
		[self.view addSubview:self.newsPanelViewController.view];
        
		[self addChildViewController:_newsPanelViewController];
		[_newsPanelViewController didMoveToParentViewController:self];
        
		_newsPanelViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
	}
    
	self.showingNewsPanel = YES;
    
	// setup view shadows
	[self showHockeyTableViewWithShadow:YES withOffset:-2];
    
	UIView *view = self.newsPanelViewController.view;
	return view;
}


@end
