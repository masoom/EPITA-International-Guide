//
//  TourismDetailViewController.h
//  CustomTableView


#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface TourismDetailViewController : UIViewController

@property (nonatomic, assign) NSUInteger row;

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *websiteLabel;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

// just titles to be moved
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *prLabel;
@property (weak, nonatomic) IBOutlet UILabel *addrLabel;
@property (weak, nonatomic) IBOutlet UILabel *webLabel;



@end
