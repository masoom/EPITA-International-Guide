//
//  VocabularyDetailViewController.h
//  EPITA International Guide
//
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VocabularyDetailViewController : UIViewController

@property (nonatomic, assign) NSUInteger row;

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

