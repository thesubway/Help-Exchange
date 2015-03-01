//
//  ContactViewController.m
//  HomelessHelper
//
//  Created by Dan Hoang on 2/28/15.
//  Copyright (c) 2015 Dan Hoang. All rights reserved.
//

#import "ContactViewController.h"

@implementation ContactViewController

-(void)viewDidLoad {
    [super viewDidLoad];
}
-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)submitPressed:(id)sender {
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
