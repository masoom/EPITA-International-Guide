//
//  VocabularyDetailViewController.m
//  EPITA International Guide
//
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "VocabularyDetailViewController.h"
#import "TBXML.h"

@interface VocabularyDetailViewController ()

@end

@implementation VocabularyDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSMutableArray *topics = [NSMutableArray array];
    NSMutableArray *mapEN = [NSMutableArray array];
    NSMutableArray *mapFR = [NSMutableArray array];
    NSMutableArray *en = [NSMutableArray array];
    NSMutableArray *fr = [NSMutableArray array];
    
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
            else if(count==1)
            {
                [mapEN addObject:word];
            }
            else if(count==2)
            {
                [mapFR addObject:word];
            }
            
        } while ((textElement = textElement->nextSibling) != nil);
        count++;
    } while ((entryElement = entryElement->nextSibling) != nil);
    
    entryElement = [TBXML childElementNamed:@"string-array" parentElement:rootElement];
    
    do {
        TBXMLElement *textElement = [TBXML childElementNamed:@"item" parentElement:entryElement];
        
        NSString *attrName = @"@array/";
        attrName = [attrName stringByAppendingString:[TBXML valueOfAttributeNamed:@"name" forElement:entryElement]];
        NSString *enName = [mapEN objectAtIndex:self.row];
        NSString *frName = [mapFR objectAtIndex:self.row];
        
        do {
            NSString *word = [TBXML textForElement:textElement];
            
            if([attrName isEqualToString:enName])
            {
                [en addObject:word];
            }
            else if([attrName isEqualToString:frName])
            {
                [fr addObject:word];
            }
            
        } while ((textElement = textElement->nextSibling) != nil);
    } while ((entryElement = entryElement->nextSibling) != nil);
    
    
    NSString *title = nil;
    NSString *description = @"";
    
    title = [topics objectAtIndex:self.row];
    
    count = 0;
    for (NSString *s in fr) {
        
        NSString *des = @"";
        if([s isEqualToString:@""])
        {
          des = @"\n";
        }
        else
        {
            des  = s;
            des = [des stringByAppendingString:@" - "];
            des = [des stringByAppendingString:[en objectAtIndex:count]];
            des = [des stringByAppendingString:@"\n"];
        }
        
        description = [description stringByAppendingString:des];
        count++;
    }
    
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
