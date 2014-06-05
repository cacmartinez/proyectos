//
//  NewsPanelController.h
//  deportes
//
//  Created by Compean on 22/08/13.
//  Copyright (c) 2013 juvs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsPanelController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;


@end
