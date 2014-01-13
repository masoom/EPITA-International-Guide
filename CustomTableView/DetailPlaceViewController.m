//
//  DetailPlaceViewController.m
//  CustomTableView


#import "DetailPlaceViewController.h"

@interface DetailPlaceViewController ()

@end

@implementation DetailPlaceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = self.placeTitle;
    
    self.detailLabel.text = self.description;
    [self.detailLabel sizeToFit];
    
    self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pattern.png"]];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
