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
    if ([_nameTextField.text isEqualToString:@""] || [_phoneTextField.text isEqualToString:@""] || [_lookingForTextField.text isEqualToString:@""] || [_offerTextField.text isEqualToString:@""]) {
        [self showAlert:@"Empty fields" withMessage:@"Please complete all fields"];
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
-(void)showAlert: (NSString *)title withMessage:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}

@end
