//
//  MeetTeamViewController.m
//  CustomTableView


#import "MeetTeamViewController.h"
#import "Recipe.h"
#import "PLMessageView.h"

#import <QuartzCore/QuartzCore.h>

@interface MeetTeamViewController ()

@property (nonatomic, strong) NSArray *team;

@end

@implementation MeetTeamViewController
{
    PLMessageView *_personInformationView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    self.navigationItem.title = @"Meet the Team";
    
    Recipe *recipe1 = [[Recipe alloc] init];
    recipe1.headline = @"Christophe ROUVRAIS";
    recipe1.description = @"Director of development and international office.";
    recipe1.imageFile = @"adm_rouvrais.png";
    
    Recipe *recipe2 = [[Recipe alloc] init];
    recipe2.headline = @"Rabih HADAD";
    recipe2.description = @"Deputy Director of Development & International Office";
    recipe2.imageFile = @"Rabih.png";
    
    Recipe *recipe3 = [[Recipe alloc] init];
    recipe3.headline = @"Celia FERNANDEZ";
    recipe3.description = @"Study abroad and Exchange Coordinator";
    recipe3.imageFile = @"celia.png";
    
    Recipe *recipe4 = [[Recipe alloc] init];
    recipe4.headline = @"Sophie BORDES";
    recipe4.description = @"International Programs Assistant";
    recipe4.imageFile = @"Sophie.png";
    
    Recipe *recipe5 = [[Recipe alloc] init];
    recipe5.headline = @"Sadia Kaifouche";
    recipe5.description = @"Assistant";
    recipe5.imageFile = @"Sadia.png";
    
    
    Recipe *recipe6 = [[Recipe alloc] init];
    recipe6.headline = @"Alice Million";
    recipe6.description = @"International Officer";
    recipe6.imageFile = @"Alice.png";
    
    self.team = [NSArray arrayWithObjects:recipe1, recipe2, recipe3, recipe4,recipe5, recipe6,nil];

    
    // Remove table cell separator
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    // Assign custom backgroud for the view
    self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"welcome_screen"]];
    self.tableView.backgroundColor = [UIColor clearColor];
    
    // Add padding to the top of the table view
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.contentInset = inset;
    
    NSArray *nibView =[[NSBundle mainBundle] loadNibNamed:@"PLMessageView" owner:self options:nil];
    _personInformationView = (PLMessageView *)[nibView objectAtIndex:0];
    _personInformationView.layer.cornerRadius = 7.5;
    _personInformationView.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
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
    return [self.team count];
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
    Recipe *recipe = [self.team objectAtIndex:indexPath.row];
    
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

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    header.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"oncampus_meettheteam.jpg"]];
    [imgView setFrame:CGRectMake(5, 5, 90, 90)];
    [header addSubview:imgView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(imgView.frame.size.width + 10, 10, 90, 40)];
    titleLabel.text = @"Office";
    titleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    titleLabel.backgroundColor = [UIColor clearColor];
    
    UILabel *descLabel = [[UILabel alloc] initWithFrame:CGRectMake(imgView.frame.size.width + 10, 35, 200, 40)];
    descLabel.numberOfLines = 0;
    descLabel.text = @"Open Hours:\rMon 10 - 12, Thu-Fri 14-16";
    descLabel.font = [UIFont systemFontOfSize:12.0f];
    descLabel.backgroundColor = [UIColor clearColor];

    [header addSubview:titleLabel];
    [header addSubview:descLabel];
    
    return header;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_personInformationView superview]) {
        [_personInformationView removeFromSuperview];
    }
    switch (indexPath.row) {
        case 0:
            _personInformationView.personInfo.text = @"Tel: + 331 80 51 01 35\rMail: chirstophe.rouvrais@epita.fr";
            [self.view addSubview:_personInformationView];
            break;
        case 1:
            _personInformationView.personInfo.text = @"Tel: + 331 80 51 71 37\rMail:	rabih.haddad@epita.fr";
            [self.view addSubview:_personInformationView];
            break;
        case 2:
            _personInformationView.personInfo.text = @"Tel: + 331 44 08 00 32\rMail: celia.fernandez@epita.fr";
            [self.view addSubview:_personInformationView];
            break;
        
        case 3:
            _personInformationView.personInfo.text = @"Tel: + 331 44 08 43 76\rMail: sophie.bordes@epita.fr";
            [self.view addSubview:_personInformationView];
            break;
            
        case 4:
            _personInformationView.personInfo.text = @"Tel: + 331 44 08 00 32\rMail: Sadia.KIFOUCHE@epita.fr";
            [self.view addSubview:_personInformationView];
            break;
            
        case 5:
            _personInformationView.personInfo.text = @"Tel: + 331 84 07 42 80 \rMail: alice.million@epita.fr";
            [self.view addSubview:_personInformationView];
            break;
            
        default:
            break;
    }
}


@end
