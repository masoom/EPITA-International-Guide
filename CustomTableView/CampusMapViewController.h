//
//  CampusMapViewController.h
//  CustomTableView


#import <UIKit/UIKit.h>
#import "PopoverView.h"

@interface CampusMapViewController : UIViewController <UIScrollViewDelegate, PopoverViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *mapImageView;
@property (weak, nonatomic) IBOutlet UIImageView *mapImgView;

@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *contentView2;

- (IBAction)showPopForButton:(UIButton *)sender;
- (IBAction)changeMap:(id)sender;

@end
