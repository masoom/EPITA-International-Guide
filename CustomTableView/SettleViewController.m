//  Settle in Paris
//  SettleViewController.m
//  CustomTableView
//
//  Created by Masoom  on 9/11/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "SettleViewController.h"
#import "Recipe.h"
#import "ServicesViewController.h"

#import <UIKit/UIKit.h>

@interface SettleViewController ()

@property (nonatomic, copy) NSArray *recipes;

@end

@implementation SettleViewController
{
    NSUInteger _row;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    self.navigationItem.title = @"Settle";
    
    // Create recipe array for main screen.
    
    Recipe *recipe1 = [[Recipe alloc] init];
    recipe1.headline = @"Residents";
    recipe1.imageFile = @"residents.png";
    
    Recipe *recipe2 = [[Recipe alloc] init];
    recipe2.headline = @"Services";
    recipe2.imageFile = @"services.png";
    
    Recipe *recipe3 = [[Recipe alloc] init];
    recipe3.headline = @"Medicines";
    recipe3.imageFile = @"medicines.png";
    
    Recipe *recipe4 = [[Recipe alloc] init];
    recipe4.headline = @"Emergency Numbers";
    recipe4.imageFile = @"emergency.png";
    
    Recipe *recipe5 = [[Recipe alloc] init];
    recipe5.headline = @"Religious";
    recipe5.imageFile = @"religious.png";
    
    self.recipes = [NSArray arrayWithObjects:recipe1, recipe2, recipe3, recipe4, recipe5, nil];
    
    // Remove table cell separator
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    // Assign custom backgroud for the view
    //self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"welcome_screen"]];
    self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pattern.png"]];
    self.tableView.backgroundColor = [UIColor clearColor];
    
    // Add padding to the top of the table view
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.contentInset = inset;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (UIImage *)cellBackgroundForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger rowCount = [self tableView:self.tableView numberOfRowsInSection:0];
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

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.recipes count];
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
    
//    UILabel *recipeDetailLabel = (UILabel *)[cell viewWithTag:102];
//    recipeDetailLabel.text = recipe.description;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundView = [[UIImageView alloc] initWithImage:[self cellBackgroundForRowAtIndexPath:indexPath]];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [self performSegueWithIdentifier:@"residentsView" sender:self];
            break;
        case 1:
            [self performSegueWithIdentifier:@"servicesView" sender:self];
            break;
        case 2:
            [self performSegueWithIdentifier:@"medicinesView" sender:self];
            break;
        case 3:
            [self performSegueWithIdentifier:@"emergencyView" sender:self];
            break;
        case 4:
            [self performSegueWithIdentifier:@"religiousView" sender:self];
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
