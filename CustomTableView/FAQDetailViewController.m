//
//  FAQDetailViewController.m
//  CustomTableView
//
//  Created by Masoom Tulsiani on 10/5/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "FAQDetailViewController.h"
#import "TBXML.h"

@interface FAQDetailViewController ()

@end

@implementation FAQDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSMutableArray *topics = [NSMutableArray array];
    NSMutableArray *answers = [NSMutableArray array];
    
    TBXML *sourceXML = [[TBXML alloc] initWithXMLFile:@"faq.xml" error:nil];
    
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
            else if(count==1)
            {
                word = [word stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
                [answers addObject:word];
            }
            
        } while ((textElement = textElement->nextSibling) != nil);
        count++;
    } while ((entryElement = entryElement->nextSibling) != nil);
    
    
    NSString *title = nil;
    NSString *description = nil;
    
    title = [topics objectAtIndex:self.row];
    description = [answers objectAtIndex:self.row];

    self.titleLabel.text = title;
    self.descriptionLabel.text = description;
    [self.titleLabel sizeToFit];
    [self.descriptionLabel sizeToFit];
    
    CGFloat height = 0.0f;
    for (UIView *v in self.contentScrollView.subviews)
    {
        height = height + v.frame.size.height;
    }
    
    self.contentScrollView.contentSize = CGSizeMake(self.contentScrollView.contentSize.width, height + 50);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
