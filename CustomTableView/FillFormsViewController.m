//
//  FillFormsViewController.m
//  CustomTableView


#import "FillFormsViewController.h"
#import "Recipe.h"
#import "FormVideoViewController.h"

@interface FillFormsViewController ()

@property (nonatomic, strong) NSArray *recipes;
@property (nonatomic,strong) UIWebView *videoView;

@end

@implementation FillFormsViewController
{
    NSString *_videoID;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    self.navigationItem.title = @"Fill Forms";
    
    // Use description for URL here
    Recipe *recipe1 = [[Recipe alloc] init];
    recipe1.headline = @"Social security part 1: Identity";
    recipe1.description = @"x175vl4_ss1";
    
    Recipe *recipe2 = [[Recipe alloc] init];
    recipe2.headline = @"Social security part 2: Specific Information";
    recipe2.description = @"x175vlc";
    
    Recipe *recipe3 = [[Recipe alloc] init];
    recipe3.headline = @"Social security part 3: Address";
    recipe3.description = @"x175vor";
    
    Recipe *recipe4 = [[Recipe alloc] init];
    recipe4.headline = @"Social security part 4: Administrative Section";
    recipe4.description = @"x175vp1";
    
    Recipe *recipe5 = [[Recipe alloc] init];
    recipe5.headline = @"Physician part 1";
    recipe5.description = @"x175vp1";
    
    Recipe *recipe6 = [[Recipe alloc] init];
    recipe6.headline = @"Physician part 2";
    recipe6.description = @"x175vj5";
    
    Recipe *recipe7 = [[Recipe alloc] init];
    recipe7.headline = @"CAF: Part I ";
    recipe7.description = @"x175vft";
    
    
    Recipe *recipe8 = [[Recipe alloc] init];
    recipe8.headline = @"CAF part 2";
    recipe8.description = @"x175vgi";
    
    
    Recipe *recipe9 = [[Recipe alloc] init];
    recipe9.headline = @"CAF part 3";
    recipe9.description = @"x175vgs";
    
    
    Recipe *recipe10 = [[Recipe alloc] init];
    recipe10.headline = @"CAF part 4";
    recipe10.description = @"x175vgv";
    
    
    Recipe *recipe11 = [[Recipe alloc] init];
    recipe11.headline = @"CAF Housing AID part 5";
    recipe11.description = @"x175vh0";
    
    
    Recipe *recipe12 = [[Recipe alloc] init];
    recipe12.headline = @"CAF Housing AID part 6";
    recipe12.description = @"x175vha";
    
    Recipe *recipe13 = [[Recipe alloc] init];
    recipe13.headline = @"LMDE PART I";
    recipe13.description = @"x175vhn";
    
    Recipe *recipe14 = [[Recipe alloc] init];
    recipe14.headline = @"LMDE PART 2";
    recipe14.description = @"x175vhz";
    
    
    Recipe *recipe15 = [[Recipe alloc] init];
    recipe15.headline = @"LMDE PART 3";
    recipe15.description = @"x175vif";
    
    Recipe *recipe16 = [[Recipe alloc] init];
    recipe16.headline = @"OFII PART 1";
    recipe16.description = @"x175vjl";
    
    
    Recipe *recipe17 = [[Recipe alloc] init];
    recipe17.headline = @"OFII PART 2";
    recipe17.description = @"x175vjx";
    
    Recipe *recipe18 = [[Recipe alloc] init];
    recipe18.headline = @"SMEREP PART 1";
    recipe18.description = @"x175vkl";
    
    Recipe *recipe19 = [[Recipe alloc] init];
    recipe19.headline = @"SMEREP PART 2";
    recipe19.description = @"x175vke";
    
    
    self.recipes = [NSArray arrayWithObjects:recipe1, recipe2, recipe3, recipe4, recipe5, recipe6, recipe7, recipe8, recipe9, recipe10, recipe10, recipe11, recipe12, recipe13, recipe14, recipe15,recipe16, recipe17, recipe18, recipe19,nil];
    
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
    Recipe *recipe = [self.recipes objectAtIndex:indexPath.row];
    
    NSString *video = [NSString stringWithFormat:@"http://www.dailymotion.com/services/oembed?format=json&url=http%%3A//www.dailymotion.com/video/%@", recipe.description];
    
    NSData *returnedData = [NSData dataWithContentsOfURL:[NSURL URLWithString:video]];
    
    NSError *error;
    NSDictionary *json = [NSJSONSerialization
                          JSONObjectWithData:returnedData
                          options:0
                          error:&error];
    NSString *thumbURL = json[@"thumbnail_url"];
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:thumbURL]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            // WARNING: is the cell still using the same data by this point??
            UIImageView *imgView = (UIImageView *)[cell viewWithTag:100];
            [imgView setImage:[UIImage imageWithData:data]];
        });
    });


    
    UILabel *recipeNameLabel = (UILabel *)[cell viewWithTag:101];
    recipeNameLabel.text = recipe.headline;
    
    return cell;
}

- (void)getThumbnailForCell:(UITableViewCell *)cell
{
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundView = [[UIImageView alloc] initWithImage:[self cellBackgroundForRowAtIndexPath:indexPath]];
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Recipe *recipe = self.recipes[indexPath.row];

    DMItem *item = [DMItem itemWithType:@"video" forId:@"xhy8d"];
    
    NSLog(@"%@", item.cachedFields);
    
    _videoID = recipe.description;

    [self performSegueWithIdentifier:@"formVideoView" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"formVideoView"]) {
        FormVideoViewController *videoView = segue.destinationViewController;
        videoView.videoID = _videoID;
    }
}
@end
