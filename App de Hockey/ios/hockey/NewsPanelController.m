//
//  NewsPanelController.m
//  deportes
//
//  Created by Compean on 22/08/13.
//  Copyright (c) 2013 Bithound. All rights reserved.
//

#import "NewsPanelController.h"

@interface NewsPanelController ()

@property (nonatomic, strong) NSArray *imageArray;

@end

@implementation NewsPanelController

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
	// Do any additional setup after loading the view.
#warning TODO change images that are showing in the news feed to images that come from a webservice
    _imageArray = [[NSArray alloc] initWithObjects:@"logocortado.jpg", @"logocortado.jpg", @"logocortado.jpg",  nil];
    
    
    for (int i = 0; i < [_imageArray count]; i++) {
        //We'll create an imageView object in every 'page' of our scrollView.
        
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.image = [UIImage imageNamed:[_imageArray objectAtIndex:i]];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        [self.scrollView addSubview:imageView];
        
    }
    //Set the content size of our scrollview according to the total width of our imageView objects.
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * [_imageArray count], _scrollView.frame.size.height);
    /*for(int i = 0; i<self.scrollView.subviews.count; i++){
        ((UIImageView *)[self.scrollView.subviews objectAtIndex:i]).contentMode = UIViewContentModeScaleAspectFill;
    }*/
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
