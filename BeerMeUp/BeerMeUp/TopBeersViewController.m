//
//  TopBeersViewController.m
//  BeerMeUp
//
//  Created by Lay Gonzalez Romero on 05/10/13.
//  Copyright (c) 2013 Lay Gonzalez Romero. All rights reserved.
//

#import "TopBeersViewController.h"
#import "TopBeersCellView.h"
#import "Beer.h"

@interface TopBeersViewController ()

@end

@implementation TopBeersViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return self.beers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	TopBeersCellView *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
	if(!cell){
		cell = [[[NSBundle mainBundle] loadNibNamed:@"TopBeersViewController" owner:self options:nil] objectAtIndex:0];
	}
	Beer *beer = [self.beers objectAtIndex:indexPath.row];
	cell.name.text = beer.name;
	[cell.color setBackgroundColor:[Beer colorForColorScaleValue:beer.color.intValue]];
	cell.rating.text = [NSString stringWithFormat:@"%d", beer.averageRating.intValue];
	cell.location.text = beer.location;
	
	return cell;
}



@end
