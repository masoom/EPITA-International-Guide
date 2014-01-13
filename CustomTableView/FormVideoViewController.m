//
//  FormVideoViewController.m
//  CustomTableView


#import "FormVideoViewController.h"

@interface FormVideoViewController ()

@property (strong, nonatomic) DMPlayerViewController *playerViewController;

@end

@implementation FormVideoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // Init the player
    self.playerViewController = [[DMPlayerViewController alloc] initWithParams:@{@"webkit-playsinline": @(YES)}];
    self.playerViewController.delegate = self;
    [self addChildViewController:self.playerViewController];
    self.playerViewController.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:self.playerViewController.view];
    [self.playerViewController load:self.videoID];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
