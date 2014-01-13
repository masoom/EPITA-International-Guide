
//
//  Created by Masoom  on 9/11/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "VocabularyViewController.h"
#import "VocabularyDetailViewController.h"
#import "TBXML.h"

@interface VocabularyViewController ()

@property (nonatomic, strong) NSArray *topics;

@end

@implementation VocabularyViewController
{
    NSUInteger _row;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    self.navigationItem.title = @"French Vocabulary";
    
    NSMutableArray *topics = [NSMutableArray array];
    
    TBXML *sourceXML = [[TBXML alloc] initWithXMLFile:@"french_vocab.xml" error:nil];
    
    TBXMLElement *rootElement = sourceXML.rootXMLElement;
    TBXMLElement *entryElement = [TBXML childElementNamed:@"string-array" parentElement:rootElement];
    
    int count = 0;
    do {
        TBXMLElement *textElement = [TBXML childElementNamed:@"item" parentElement:entryElement];
        
        do {
            NSString *word = [TBXML textForElement:textElement];
            if(count==0)
            {
                [topics addObject:word];
            }
            
        } while ((textElement = textElement->nextSibling) != nil);
        count++;
    } while ((entryElement = entryElement->nextSibling) != nil);
    
    self.topics = topics;
    
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
    return [self.topics count];
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
    NSString *topic = [self.topics objectAtIndex:indexPath.row];

    UILabel *recipeNameLabel = (UILabel *)[cell viewWithTag:101];
    recipeNameLabel.text = topic;
    
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
    [self performSegueWithIdentifier:@"vocabularyDetails" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"vocabularyDetails"])
    {
        VocabularyDetailViewController *detailVC = segue.destinationViewController;
        detailVC.row = _row;
    }
}

@end
