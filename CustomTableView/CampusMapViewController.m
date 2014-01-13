//
//  CampusMapViewController.m
//  CustomTableView
//
//  Created by Masoom on 10/6/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "CampusMapViewController.h"
#import "Recipe.h"
#import "DetailPlaceViewController.h"

@interface CampusMapViewController ()

@property (nonatomic, strong) Recipe *recipe;

@end

@implementation CampusMapViewController
{
    NSUInteger _currentPicture;
    PopoverView *pv;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //UIImage *menuImage = [UIImage imageNamed:@"campus1.png"];
    
    //self.mapImageView = [[UIImageView alloc] initWithImage:menuImage];
    
    //[self.scrollView addSubview:self.mapImageView];
    [self.scrollView setContentSize:self.mapImgView.image.size];
    
    self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pattern.png"]];


    
    //CGRect scrollViewFrame = self.scrollView.frame;
    //CGFloat minScale = scrollViewFrame.size.width / self.scrollView.contentSize.width;
    self.scrollView.minimumZoomScale = 1.0f;
    
    self.scrollView.maximumZoomScale = 2.5f;
    self.scrollView.zoomScale = 1.0f;
    
    _currentPicture = 0;
    self.contentView.hidden = NO;
    self.contentView2.hidden = YES;
    self.recipe = [[Recipe alloc] init];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    if (_currentPicture == 0)
        return self.contentView;
    
    return self.contentView2;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showPopForButton:(UIButton *)sender
{
    // button tags goes from top left to right (something like rows but they are not linear)
    // something like:
    /*
     0 1 2 3
     4 5 6 7
     ...
     */
    NSString *pressedPlace = nil;
    NSString *description = nil;
    if (_currentPicture == 0)
    {
        switch (sender.tag)
        {
            case 0:
                pressedPlace = @"International Office";
                description = @"Open on Monday and Wednesdays subject to prior apppointment.";
                break;
            case 1:
                pressedPlace = @"Amphi 1";
                description = @"Classroom used for examinations and some classes for International Master's";
                break;
            case 2:
                pressedPlace = @"Accueil";
                description = @"Reception desk for EPITA.";
                break;
            case 3:
                pressedPlace = @"Amphi 3";
                description = @"Classroom used for examinations and some classes for International Master's";
                break;
            case 4:
                pressedPlace = @"WC";
                description = @"Washroom for EPITA Students";
                break;
            case 5:
                pressedPlace = @"Cafeteria";
                description = @"Melty Cafeteria for EPITA Students. Open from 9:30 am to 5 PM";
                break;
            case 6:
                pressedPlace = @"WC";
                description = @"Washroom";
                break;
            case 7:
                pressedPlace = @"Amphi 2";
                description = @"Custom description";
                break;
            case 8:
                pressedPlace = @"Pole Epita";
                description = @"Pole Epita";
                break;
            case 9:
                pressedPlace = @"Pole Epitech";
                description = @"Pole Epitech";
                break;
        }
    } else
    {
        switch (sender.tag)
        {
            case 0:
                pressedPlace = @"P03";
                description = @"Custom description";
                break;
            case 1:
                pressedPlace = @"WC";
                description = @"Washroom for EPITA Students";
                break;
            case 2:
                pressedPlace = @"P04";
                description = @"Classroom used for french courses";
                break;
            case 3:
                pressedPlace = @"P06";
                description = @"Custom description";
                break;
            case 4:
                pressedPlace = @"Salle Machine";
                description = @"Server Room";
                break;
            case 5:
                pressedPlace = @"Amphi Master";
                description = @"Classroom which is mainly reserved for International Master students";
                break;
            case 6:
                pressedPlace = @"P05";
                description = @"Custom description";
                break;
            case 7:
                pressedPlace = @"Amphi 4";
                description = @"Custom description";
                break;
            case 8:
                pressedPlace = @"Epitech";
                description = @"Epitech, the engineering school of epita.";
                break;
            case 9:
                pressedPlace = @"P08";
                description = @"Custom description";
                break;
            case 10:
                pressedPlace = @"P10";
                description = @"Custom description";
                break;
            case 11:
                pressedPlace = @"P09";
                description = @"Custom description";
                break;
            case 12:
                pressedPlace = @"Epitech";
                description = @"Custom description";
                break;
            case 13:
                pressedPlace = @"Amphi 10";
                description = @"Custom description";
                break;
            case 14:
                pressedPlace = @"IP12A (IM Lab)";
                description = @"Reserved for GITM and Master students";
                break;
            case 15:
                pressedPlace = @"Restaurant";
                description = @"House of Melty Cafe ";
                break;
            case 16:
                pressedPlace = @"E-Artsup";
                description = @"Student association promoting Arts & creative events";
                break;
            case 17:
                pressedPlace = @"IP12B";
                description = @"Class for Fundamental Master students";
                break;
            case 18:
                pressedPlace = @"IP11";
                description = @"Class for Master students";
                break;
        
        }
    }
    
    self.recipe.headline = pressedPlace;
    self.recipe.description = description;
    
    // Create a label with custom text
    CGPoint point = sender.center;
    
    if (_currentPicture == 0)
    {
        // self.contentView
        pv = [PopoverView showPopoverAtPoint:point
                                      inView:self.contentView
                                   withTitle:self.recipe.headline
                                    withText:@"More info"
                                    delegate:self]; // Show text with title
    } else
    {
        // self.contentView2
        pv = [PopoverView showPopoverAtPoint:point
                                      inView:self.contentView2
                                   withTitle:self.recipe.headline
                                    withText:@"More info"
                                    delegate:self]; // Show text with title
    }
}

#pragma mark - PopoverViewDelegate Methods

- (void)popoverView:(PopoverView *)popoverView didSelectItemAtIndex:(NSInteger)index
{
    [popoverView dismiss];
    [self performSegueWithIdentifier:@"detailPlaceView" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailPlaceView"])
    {
        DetailPlaceViewController *placeVC = segue.destinationViewController;
        placeVC.placeTitle = self.recipe.headline;
        placeVC.description = self.recipe.description;
    }
}

- (IBAction)changeMap:(UIBarButtonItem *)sender
{
    [pv dismiss];
    if (_currentPicture == 0)
    {
        _currentPicture = 1;
        self.contentView.hidden = YES;
        self.contentView2.hidden = NO;
    } else
    {
        _currentPicture = 0;
        self.contentView.hidden = NO;
        self.contentView2.hidden = YES;
    }
    
    self.scrollView.zoomScale = 1.0f;
    
}
@end
