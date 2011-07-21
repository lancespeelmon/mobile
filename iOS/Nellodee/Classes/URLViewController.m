//
//  URLViewController.m
//  Nellodee
//
//  Created by Ada Hopper on 17/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "URLViewController.h"


@implementation URLViewController

@synthesize mainViewController;
@synthesize url;

- (IBAction) saveURL{
    //Dismiss the keyboard
    [url resignFirstResponder];
    
    //Crete the string to store the url
    NSString *urlSakai = [url text];
    
    //Store the data
    //TODO: I SHOULD CHECK IF THE URL IS CORRECT BEFORE SAVE THE DATA
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    [defaults setObject:urlSakai forKey:@"url"];
    [defaults synchronize];
    
    NSLog(@"Saved Data");
    [mainViewController showLogin];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end