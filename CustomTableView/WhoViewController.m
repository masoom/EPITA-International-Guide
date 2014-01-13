//
//  WhoViewController.m
//  CustomTableView
//
//  Created by Masoom  on 9/9/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "WhoViewController.h"

@interface WhoViewController ()

@end

@implementation WhoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *title = nil;
    NSString *description = nil;
    NSString *image = nil;
    
    // this view is used for who are we (row 0) and cafeteria (row 5)
    
    switch (self.row) {
        case 0:
            title = @"EPITA";
            description = @"Incepted in 1984, EPITA (from the French Ecole pour l'Informatique et les Techniques Avancées : School of Computer Science & Advanced Techniques) has been steadily gaining a reputation of excellence among multinational companies, which often recruit our students before the end of their studies. At EPITA, computing and information technologies are considered fundamental subjects and are always placed in the context of students' future managerial role and within the perspective of their position of responsibility.";
            image = @"whoarewe.png";
            break;
        case 5:
            title = @"The cafeteria";
            description = @"Each campus has its own cafeteria serving a variety of dishes.\r\rThe cafeteria's on EPITA campuses are open every week day (8:00am-5:00pm) and on week-ends during workshops and special events.\r\r* Breakfast (8:00am-11:00am):£1.90\r\r* Plat du jour, Hot meals (11:00am- 5:00pm):between £3.50 and £6.00";
            image = @"pain_au_chocolat.png";
            break;
         
    }
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pattern.png"]];
    
    self.titleLabel.text = title;
    self.descriptionLabel.text = description;
    [self.titleLabel sizeToFit];
    [self.descriptionLabel sizeToFit];
    
    self.imageView.image = [UIImage imageNamed:image];
    
    CGFloat height = 0.0f;
    for (UIView *v in self.scrollView.subviews)
    {
        height = height + v.frame.size.height;
    }
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, height + 50);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
