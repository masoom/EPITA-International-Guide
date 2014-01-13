
//  Created by Masoom  on 24/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "EventsDetailViewController.h"


#define METERS_PER_MILE 1609.344
#define IS_OS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define IS_OS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

@interface EventsDetailViewController ()


@end

@implementation EventsDetailViewController 

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSString *title = nil;
    NSString *description = nil;
    NSString *image = nil;
    
    
    switch (self.row) {
        case 0:
            image = @"events.jpg";
            title = @"Events";
            description = @"WEI (first days of october)\rHalloween Party (end of october)\rXmas Party (last week before christmas)\rUnisson Party (february)\rInternational Week (In April every year)";
            
            break;
        case 1:
            image = @"athletics.jpg";
            title = @"Athletics";
            description = @"ASME : mechanical sports\rEpisport : Sports Bureau\rCast : air-soft & paint ball\rIIT : 24h Mans on Roller\rOne4One Obsession : paintball";
                       break;
        case 2:
            image = @"culture.jpg";
            title = @"Cultural / Artistic";
            description = @"EPIWORLD : social activities led by international students\rEphemere : photo club\r,Epioeno : oenology club ,Epitanime : Japanimation,EpTv : video editing\rLibrius : comics\rSoul of Sound : EPITA's concerts\rUnisson : musiques electroniques";
            
            break;
        case 3:
            image = @"ent.jpg";
            title = @"Entertainment";
            description = @"AIR Radio : EPITA's web radio\rVillejuif Nights : organizes evening events\rLa Paillotte : cocktail specialist";
                       break;
            
        case 4:
            image = @"tech.jpg";
            title = @"Technical";
            description = @"EpiMac : Macintosh & Apple,\rEpiSecu : security association,\rEvolutek : Robotics' French cup GConfs : conferences on IT sciences\rPrologin : national programming competition\rEPIDROÏD : ANDROÏD association";
            break;

        case 5:
            image = @"corporate.jpg";
            title = @"Corporate";
            description = @"CD-ROM Telecom : CD-ROM Telecom edition\rCristal : Corporate association - Student's jobs ";
           
            break;
        case 6:
            image = @"games.jpg";
            title = @"Games";
            description = @"Antre : role play\rCarré d'As : poker\rCycom : network games and sports Epicube : Rubik Cube \rPlay Back : musical video games\rStrataegyc : magic & Yu-Gi-Oh";
            break;
        case 7:
            image = @"huma.png";
            title = @"Humanitarian";
            description = @"Mhigepita : humanitarian mission inter-ivy league schools\rAEDD : sustainable development\rEPIBOOK : Books recycling and donation ";
            
            break;
       
    }
    self.imageView.image = [UIImage imageNamed:image];
    self.titleLabel.text = title;
    [self.titleLabel sizeToFit];
    self.descriptionLabel.text = description;
    [self.descriptionLabel sizeToFit];
    
     self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pattern.png"]];
    
    
    
    
    CGFloat height = 0.0f;
    for (UIView *v in self.contentScrollView.subviews)
    {
        height = height + v.frame.size.height;
    }
    
    self.contentScrollView.contentSize = CGSizeMake(self.contentScrollView.contentSize.width, height + 50 + 6*15);
    
    
    self.contentScrollView.contentSize = CGSizeMake(self.contentScrollView.contentSize.width, height + 50 + 6*15);
    if (IS_OS_7_OR_LATER)
    {
        CGRect frame = self.contentScrollView.frame;
        frame.origin.y -= 65;
        self.contentScrollView.frame = frame;
    }

    
   
}




#pragma mark - Table view data source


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Display recipe in the table cell
 //  Recipe *recipe = [self.recipes objectAtIndex:indexPath.row];
    
    
    return cell;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
