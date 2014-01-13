// 
//  TourismViewController.m
//  CustomTableView
//
//  Created by Masoom  on 9/11/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "TourismViewController.h"
#import "TourismDetailViewController.h"
#import "Recipe.h"

@interface TourismViewController ()

@property (nonatomic, strong) NSArray *recipes;

@end

@implementation TourismViewController
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
    
    self.navigationItem.title = @"Tourism";
    
    // Create recipe array for main screen.
    
    Recipe *recipe1 = [[Recipe alloc] init];
    recipe1.headline = @"La tour Eiffel et le Trocadero";
    recipe1.imageFile = @"tourism1.jpg";
    
    Recipe *recipe2 = [[Recipe alloc] init];
    recipe2.headline = @"Le Louvre";
    recipe2.imageFile = @"tourism2.jpg";
    
    Recipe *recipe3 = [[Recipe alloc] init];
    recipe3.headline = @"Cathedrale Notre Dame de Paris";
    recipe3.imageFile = @"tourism3.jpg";
    
    Recipe *recipe4 = [[Recipe alloc] init];
    recipe4.headline = @"Musee d'Orsay";
    recipe4.imageFile = @"tourism4.jpg";
    
    Recipe *recipe5 = [[Recipe alloc] init];
    recipe5.headline = @"La Sorbonne et le quartier Latin";
    recipe5.imageFile = @"tourism5.jpg";
    
    Recipe *recipe6 = [[Recipe alloc] init];
    recipe6.headline = @"L'Arc de Triomphe et les Champs-Elysees";
    recipe6.imageFile = @"tourism6.jpg";
    
    Recipe *recipe7 = [[Recipe alloc] init];
    recipe7.headline = @"Le Chateau de Versailles";
    recipe7.imageFile = @"tourism7.jpg";
    
    Recipe *recipe8 = [[Recipe alloc] init];
    recipe8.headline = @"Chateau de Fountainebleau";
    recipe8.imageFile = @"tourism8.jpg";
    
    Recipe *recipe9 = [[Recipe alloc] init];
    recipe9.headline = @"Disneyland Paris";
    recipe9.imageFile = @"tourism9.jpg";
    
    Recipe *recipe10 = [[Recipe alloc] init];
    recipe10.headline = @"Père Lachaise Cemetery";
    recipe10.imageFile = @"tourism10.jpg";
    
    self.recipes = [NSArray arrayWithObjects:recipe1, recipe2, recipe3, recipe4, recipe5, recipe6, recipe7, recipe8, recipe9, recipe10, nil];
    
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
    [self performSegueWithIdentifier:@"detailTourism" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailTourism"])
    {
        TourismDetailViewController *detailVC = segue.destinationViewController;
        detailVC.row = _row;
    }
}

@end
