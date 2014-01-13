
//  Created by Masoom  on 24/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "EventsDetailViewController.h"
#import <UIKit/UIKit.h>

@interface EventsDetailViewController : UIViewController


@property (nonatomic, assign) NSUInteger row;

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;


@end
