//
//  ServicesDetailViewController.m
//  EPITA International Guide
//
//  Created by Masoom  on 25/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "ServicesDetailViewController.h"
#import "ServicesViewController.h"

#define IS_OS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define IS_OS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

@interface ServicesDetailViewController ()

@property (nonatomic, strong) NSArray *services;

@end

@implementation ServicesDetailViewController

{
    
    NSUInteger _row;
}

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSString *title = nil;
    NSString *description = nil;
    NSString *location = nil;
    NSString *website = nil;
    NSString *image = nil;
    //NSString *map = nil;
   
    NSString *contact = nil;
    
    switch (self.row) {
        case 0:
            image = @"cityhall.jpg";
            title = @"City hall";
            description = @"Open Hours Monday – Friday: 8h30 a.m. – 7 p.m.Saturday: 9 a.m. – 12 a.m.";
            location = @"Place Jean-Jaurès, 94270 Le Kremlin-Bicêtre";
            contact = @"Phone : 01 45 15 55 55 ";
            website = @"http://www.ville-kremlin-bicetre.fr/frm.htm";
            //map = @"map_cityhall.jpg";
            
            break;
        case 1:
            image = @"policestation.jpg";
            title = @"Police Station";
            description = @"";
            location = @"167 rue Gabriel-Péri, 94270 Le Kremlin-Bicêtre";
            contact = @"Phone: +33 1 45 15 69 00";
            website = @"http://www.police-nationale.interieur.gouv.fr/";
           // map = @"map_police.jpg";
            
            break;
        case 2:
            image = @"poste.jpg";
            title = @"La Poste";
            description = @"Opening Hours: 8h - 1pm , 4 - 7PM";
            location = @"12 Place Jean-Jaurès, 94270 Le Kremlin-Bicêtre";
            contact = @"0895 430 10";
            website = @"http://www.laposte.net";
           // map = @"map_poste.jpg";
            
            break;
        case 3:
            image = @"caf.gif";
            title = @"CAF DU VAL DE MARNE.";
            description = @"French Housing Assistance for Students. By Appointment only. Thursday 9:00 am - 12:15 pm, 1:00 a.m. to 4:15 pm ";
            location = @"2 Voie Félix Eboué, 94000 Créteil CEDEX 33";
            contact = @"0810 25 94 10";
            website = @"http://www.caf.fr/";
           // map = @"map_caf.jpg";
            
            break;
        
            }
    self.imageView.image = [UIImage imageNamed:image];
    
    self.titleLabel.text = title;
    [self.titleLabel sizeToFit];
    self.descriptionLabel.text = description;
    [self.descriptionLabel sizeToFit];
    self.locationLabel.text = location;
    [self.locationLabel sizeToFit];
    self.websiteLabel.text = website;
    [self.websiteLabel sizeToFit];
    self.contactLabel.text = contact;
    [self.contactLabel sizeToFit];
    
    //self.mapView.image = [UIImage imageNamed:image];
    
      self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pattern.png"]];
  
    /*
    
    [self.prLabel setFrame:CGRectMake(self.prLabel.frame.origin.x, self.descriptionLabel.frame.origin.y + self.descriptionLabel.frame.size.height + 15, self.prLabel.frame.size.width, self.prLabel.frame.size.height)];
    [self.locationLabel setFrame:CGRectMake(self.locationLabel.frame.origin.x, self.prLabel.frame.origin.y + self.prLabel.frame.size.height + 15, self.locationLabel.frame.size.width, self.locationLabel.frame.size.height)];
    [self.howToLabel setFrame:CGRectMake(self.howToLabel.frame.origin.x, self.locationLabel.frame.origin.y + self.locationLabel.frame.size.height + 15, self.howToLabel.frame.size.width, self.howToLabel.frame.size.height)];
    
    
    [self.contactLabel setFrame:CGRectMake(self.contactLabel.frame.origin.x, self.contactLabel.frame.origin.y + self.contactLabel.frame.size.height + 15, self.contactLabel.frame.size.width, self.contactLabel.frame.size.height)];
    
    [self.websiteLabel setFrame:CGRectMake(self.websiteLabel.frame.origin.x, self.webLabel.frame.origin.y + self.webLabel.frame.size.height + 15, self.websiteLabel.frame.size.width, self.websiteLabel.frame.size.height)];
    */
    CGFloat height = 0.0f;
    for (UIView *v in self.contentScrollView.subviews)
    {
        height = height + v.frame.size.height;
    }
    
    self.contentScrollView.contentSize = CGSizeMake(self.contentScrollView.contentSize.width, height + 50 + 6*15);
    if (IS_OS_7_OR_LATER)
    {
        CGRect frame = self.contentScrollView.frame;
        frame.origin.y -= 65;
        self.contentScrollView.frame = frame;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end