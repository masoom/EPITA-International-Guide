

#import "EventsViewController.h"
#import "Recipe.h"
#import "EventsDetailViewController.h"

@interface EventsViewController ()

@property (nonatomic, strong) NSArray *recipes;

@end

@implementation EventsViewController
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
	// Do any additional setup after loading the view.
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    self.navigationItem.title = @"Events";
    
    Recipe *recipe1 = [[Recipe alloc] init];
    recipe1.headline = @"Events";
    recipe1.imageFile = @"events.jpg";
    
    Recipe *recipe2 = [[Recipe alloc] init];
    recipe2.headline = @"Athletics";
    recipe2.imageFile = @"athletics.jpeg";
    
    Recipe *recipe3 = [[Recipe alloc] init];
    recipe3.headline = @"Cultural / Artistic";
    recipe3.imageFile = @"cultural.jpg";
    
    Recipe *recipe4 = [[Recipe alloc] init];
    recipe4.headline = @"Entertainment / Media";
    recipe4.imageFile = @"entertainment.jpeg";
    
    Recipe *recipe5 = [[Recipe alloc] init];
    recipe5.headline = @"Technical";
    recipe5.imageFile = @"technical.jpg";
    
    Recipe *recipe6 = [[Recipe alloc] init];
    recipe6.headline = @"Corporate";
    recipe6.imageFile = @"corporate.jpg";
    
    Recipe *recipe7 = [[Recipe alloc] init];
    recipe7.headline = @"Games";
    recipe7.imageFile = @"games.jpg";
    
    Recipe *recipe8 = [[Recipe alloc] init];
    recipe8.headline = @"Humanitarian / Social";
    recipe8.imageFile = @"huma.png";

    self.recipes = [NSArray arrayWithObjects:recipe1, recipe2, recipe3, recipe4, recipe5, recipe6, recipe7, recipe8, nil];
    // Remove table cell separator
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    
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
    
    UIImageView *imgView = (UIImageView *)[cell viewWithTag:100];
    [imgView setImage:[UIImage imageNamed:recipe.imageFile]];
    
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
    [self performSegueWithIdentifier:@"eventsDetailView" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"eventsDetailView"])
    {
        EventsDetailViewController *detailVC = segue.destinationViewController;
        detailVC.row = _row;
    }
}



@end
