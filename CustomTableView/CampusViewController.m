//
//  CampusViewController.m
//  CustomTableView
//
//  Created by Masoom  on 8/31/13.
//  Copyright (c) 2013 All rights reserved.
//

#import "CampusViewController.h"
#import "Campus.h"
#import "RecipeViewController.h"

#import "WhoViewController.h"

@interface CampusViewController ()

@property (nonatomic, strong) NSArray *recipes;

@end

@implementation CampusViewController
{
    NSUInteger _row;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        NSLog(@"------------------ I am in CampusViewController -------------");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pattern.png"]];
    
    self.navigationItem.title = @"On Campus";
    
    
    // Create recipe array for main screen.
    
    Campus *recipe1 = [[Campus alloc] init];
    recipe1.headline = @"Who we are?";
    recipe1.imageFile = @"oncampus_whoweare.png";
    
    Campus *recipe2 = [[Campus alloc] init];
    recipe2.headline = @"Meet the Team";
    recipe2.imageFile = @"oncampus_meettheteam.jpg";
    
    Campus *recipe3 = [[Campus alloc] init];
    recipe3.headline = @"Courses Schedule";
    recipe3.imageFile = @"oncampus_courseschedule.jpg";
    
    Campus *recipe4 = [[Campus alloc] init];
    recipe4.headline = @"Campus Map";
    recipe4.imageFile = @"oncampus_campusmap.jpg";
    
    Campus *recipe5 = [[Campus alloc] init];
    recipe5.headline = @"How to fill your forms";
    recipe5.imageFile = @"oncampus_fillingyourforms.jpg";
    
    Campus *recipe6 = [[Campus alloc] init];
    recipe6.headline = @"The cafeteria";
    recipe6.imageFile = @"pain_au_chocolat.png";  // is a .png file and not .jpg
    
    Campus *recipe7 = [[Campus alloc] init];
    recipe7.headline = @"Student associations & events";
    recipe7.imageFile = @"main_faq.jpg";
    
    self.recipes = [NSArray arrayWithObjects:recipe1, recipe2, recipe3, recipe4, recipe5, recipe6, recipe7, nil];
    
    // Remove table cell separator
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    // Assign custom backgroud for the view
    self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"welcome_screen"]];
    self.tableView.backgroundColor = [UIColor clearColor];
    
    // Add padding to the top of the table view
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.contentInset = inset;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.recipes count];
}

- (UIImage *)cellBackgroundForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger rowCount = [self tableView:[self tableView] numberOfRowsInSection:0];
    NSInteger rowIndex = indexPath.row;
    UIImage *background = nil;
    
    if (rowIndex == 0) {
        background = [UIImage imageNamed:@"cell_top.png"];
    } else if (rowIndex == rowCount - 1) {
        background = [UIImage imageNamed:@"cell_bottom.png"];
    } else {
        background = [UIImage imageNamed:@"cell_middle.png"];
    }
    
    return background;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Display recipe in the table cell
    Campus *recipe = [self.recipes objectAtIndex:indexPath.row];
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    recipeImageView.image = [UIImage imageNamed:recipe.imageFile];
    
    UILabel *recipeNameLabel = (UILabel *)[cell viewWithTag:101];
    recipeNameLabel.text = recipe.headline;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundView = [[UIImageView alloc] initWithImage:[self cellBackgroundForRowAtIndexPath:indexPath]];
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _row = indexPath.row;
    // It's a common C restriction for switch statements --You cannot declare local variables inside an individual case unless you put them inside {} brackets.
    switch (indexPath.row) {
        case 0:
            [self performSegueWithIdentifier:@"whoView" sender:self];
            break;
        case 1:
            [self performSegueWithIdentifier:@"meetView" sender:self];
            break;
        case 2:
            [self performSegueWithIdentifier:@"courseView" sender:self];
            // course schedule, link to appstore
            [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"https://itunes.apple.com/us/app/epilife/id437469369"]];
            break;
        case 3:
            [self performSegueWithIdentifier:@"mapView" sender:self];
            break;
        case 4:
            [self performSegueWithIdentifier:@"formsView" sender:self];
            break;
        case 5:
            // who view since its same, only text and image are different
            [self performSegueWithIdentifier:@"whoView" sender:self];
            break;
        case 6:
            [self performSegueWithIdentifier:@"eventsView" sender:self];
            break;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"whoView"])
    {
        WhoViewController *detailVC = segue.destinationViewController;
        detailVC.row = _row;
    }
}

@end
    
