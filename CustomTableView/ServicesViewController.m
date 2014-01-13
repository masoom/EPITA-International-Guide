//
//  ServicesViewController.m
//  EPITA International Guide
//
//  Created by Masoom  on 23/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "ServicesViewController.h"
#import "ServicesDetailViewController.h"
#import "SettleViewController.h"
#import "Recipe.h"



@interface ServicesViewController()

@property (nonatomic, strong) NSArray *recipes;


@end


@implementation ServicesViewController

{
    
    NSUInteger _row;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    self.navigationItem.title = @"Services";
    
    // Create recipe array for main screen.
    
    Recipe *recipe1 = [[Recipe alloc] init];
    recipe1.headline = @"City Hall";
    recipe1.imageFile = @"cityhall.jpg";
    
    Recipe *recipe2 = [[Recipe alloc] init];
    recipe2.headline = @"Police Station";
    recipe2.imageFile = @"policestation.jpg";
    
    Recipe *recipe3 = [[Recipe alloc] init];
    recipe3.headline = @"Poste";
    recipe3.imageFile = @"poste.jpg";
    
    Recipe *recipe4 = [[Recipe alloc] init];
    recipe4.headline = @"CAF";
    recipe4.imageFile = @"caf.gif";
    
    
    self.recipes = [NSArray arrayWithObjects:recipe1, recipe2, recipe3, recipe4,nil];
    
    // Remove table cell separator
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    // Assign custom backgroud for the view
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailServices"])
    {
        ServicesDetailViewController *detailVC = segue.destinationViewController;
        detailVC.row = [self.tableView indexPathForSelectedRow].row;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end

