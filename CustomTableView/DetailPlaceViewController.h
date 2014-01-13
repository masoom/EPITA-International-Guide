//
//  DetailPlaceViewController.h
//  CustomTableView
//


#import <UIKit/UIKit.h>

@interface DetailPlaceViewController : UIViewController

@property (nonatomic, copy) NSString *placeTitle;
@property (nonatomic, copy) NSString *description;

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@end
