//
//  ViewController.m
//  HomelessHelper
//
//  Created by Dan Hoang on 2/28/15.
//  Copyright (c) 2015 Dan Hoang. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "DejalActivityView.h"
#import "MMPickerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)enterPressed:(id)sender {
    [DejalBezelActivityView activityViewForView:self.view];
    [self performSelector:@selector(moveToContact) withObject:self afterDelay:1.0];
}
-(void)moveToContact {
    ContactViewController *contactView = [self.storyboard instantiateViewControllerWithIdentifier:@"contactView"];
    [DejalBezelActivityView removeView];
    [self.navigationController pushViewController:contactView animated:YES];
}

@end
