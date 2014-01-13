//
//  ServicesDetailViewController.h
//  EPITA International Guide
//
//  Created by Masoom  on 25/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServicesDetailViewController : UIViewController

@property (nonatomic, assign) NSUInteger row;

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactLabel;
//@property (weak, nonatomic) IBOutlet UIImageView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *websiteLabel;

/*
// just titles to be moved
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *prLabel;
@property (weak, nonatomic) IBOutlet UILabel *howToLabel;
@property (weak, nonatomic) IBOutlet UILabel *webLabel;

*/

@end
