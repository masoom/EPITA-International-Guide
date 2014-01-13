
//  Main Home Controller, First Launch Screen of the digital guide
//  RecipeViewController.m
//  CustomTableView
//
//  Created by Masoom on 28/7/13.
//  Copyright (c) 2013  All rights reserved.


#import "RecipeViewController.h"
#import "Recipe.h"
#import "CampusViewController.h"
#import "WhoViewController.h"
#import "LifeViewController.h"
#import "SettleViewController.h"
#import "TourismViewController.h"



@interface RecipeViewController ()

@property (nonatomic, strong) NSArray *recipes;

@end

@implementation RecipeViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)removeSplash:(UIImageView *)imageView
{
    [imageView removeFromSuperview];
    [self.navigationController.view setUserInteractionEnabled:YES];
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.dataSource=self;
    self.tableView.delegate=self;

    [self.navigationController.view setUserInteractionEnabled:NO];
    
    
    UIImageView*imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"welcome_screen"]];
    [imageView setFrame:CGRectMake(0, 0, self.navigationController.view.bounds.size.width, self.navigationController.view.bounds.size.height)];
    [self.navigationController.view addSubview:imageView];
    [self.navigationController.view bringSubviewToFront:imageView];
    
    // as usual
    
    //    //now fade out splash image
    [self performSelector:@selector(removeSplash:) withObject:imageView afterDelay:2.0];
    
    self.navigationItem.title = @"EPITA";
    
    // Create recipe array for main screen. 
    
    Recipe *recipe1 = [[Recipe alloc] init];
    recipe1.headline = @"On Campus";
    recipe1.description = @"International Office, Campus Map, How to fill your forms, Associations & Events";
    recipe1.imageFile = @"main_oncampus.jpg";

    Recipe *recipe2 = [[Recipe alloc] init];
    recipe2.headline = @"Settle in France";
    recipe2.description = @"Helpful information on how to settle in France. Apartment list, services access, filling your forms tutorial";
    recipe2.imageFile = @"main_settle.jpg";

    Recipe *recipe3 = [[Recipe alloc] init];
    recipe3.headline = @"Life in Paris";
    recipe3.description = @"Public transports, food, average prices";
    recipe3.imageFile = @"main_life.jpg";

    Recipe *recipe4 = [[Recipe alloc] init];
    recipe4.headline = @"Tourism";
    recipe4.description = @"Places to visit in Paris with description, maps, prices";
    recipe4.imageFile = @"main_tourism.jpg";
    
    Recipe *recipe5 = [[Recipe alloc] init];
    recipe5.headline = @"FAQ";
    recipe5.description = @"Questions & Answers about scholarships, fees,jobs, visa, french social security";
    recipe5.imageFile = @"main_faq.jpg";

    self.recipes = [NSArray arrayWithObjects:recipe1, recipe2, recipe3, recipe4, recipe5, nil];
    
    // Remove table cell separator
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

    
    // Assign custom backgroud for the view

     self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pattern.png"]];
    
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
    Recipe *recipe = [self.recipes objectAtIndex:indexPath.row];
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    recipeImageView.image = [UIImage imageNamed:recipe.imageFile];
    
    UILabel *recipeNameLabel = (UILabel *)[cell viewWithTag:101];
    recipeNameLabel.text = recipe.headline;
    
    UILabel *recipeDetailLabel = (UILabel *)[cell viewWithTag:102];
    recipeDetailLabel.text = recipe.description;

    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundView = [[UIImageView alloc] initWithImage:[self cellBackgroundForRowAtIndexPath:indexPath]];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
            [self performSegueWithIdentifier:@"showDetails" sender:self];
            break;
        case 1:
            [self performSegueWithIdentifier:@"showSettle" sender:self];
            break;
        case 2:
            [self performSegueWithIdentifier:@"showLife" sender:self];
            break;
        case 3:
            [self performSegueWithIdentifier:@"showTourism" sender:self];
            break;
        case 4:
            [self performSegueWithIdentifier:@"showFAQ" sender:self];
            break;
    }
}

@end 