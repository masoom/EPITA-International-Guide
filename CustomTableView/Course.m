//
//  Course.m
//  EPITA International Guide
//
//  Created by Masoom  on 23/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "Course.h"



@interface Course ()

//@property (nonatomic) IBOutlet UIWebView *webView;

@end



@implementation Course


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *urlAddress = @"https://itunes.apple.com/us/app/epilife/id437469369";
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [_webView loadRequest:requestObj];
    
    
     
}


@end


