//
//  ContactViewController.m
//  HomelessHelper
//
//  Created by Dan Hoang on 2/28/15.
//  Copyright (c) 2015 Dan Hoang. All rights reserved.
//

#import "ContactViewController.h"
#import "MMPickerView.h"
#import <Parse/Parse.h>
#import "ListViewController.h"
#import "DejalActivityView.h"

@implementation ContactViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    UIButton *typeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.phoneTextField.frame.size.width, self.phoneTextField.frame.size.height)];
    [self.phoneTextField addSubview:typeButton];
    [typeButton addTarget:self action:@selector(showPicker) forControlEvents:UIControlEventTouchUpInside];
    self.offerTextField.hidden = YES;
}
-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)submitPressed:(id)sender {
    if (![_lookingForTextField.text isEqualToString:@""]) {
        [self openEmail:_lookingForTextField.text];
        return;
    }
    
    if ([_nameTextField.text isEqualToString:@""] || [_phoneTextField.text isEqualToString:@""]) {
        [self showAlert:@"Empty fields" withMessage:@"Please complete all fields"];
    }
    else {
        [DejalBezelActivityView activityViewForView:self.view];
        [self performSelector:@selector(moveToList) withObject:self afterDelay:0.5];
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
-(void)showAlert: (NSString *)title withMessage:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}
-(void)showPicker {
    NSArray *myArray = [NSArray arrayWithObjects:@"Books",@"Videos", nil];
    [MMPickerView showPickerViewInView:self.view withObjects:myArray withOptions:nil objectToStringConverter:nil completion:^(NSString *selectedString) {
        self.phoneTextField.text = selectedString;
    }];
}
-(void)moveToList {
    [DejalBezelActivityView removeView];
    ListViewController *listView = [self.storyboard instantiateViewControllerWithIdentifier:@"listView"];
    listView.searchType = self.phoneTextField.text;
    listView.searchValue = self.lookingForTextField.text;
    [self.navigationController pushViewController:listView animated:YES];
}
-(void)openEmail: (NSString *)message {
    // Email Subject
    NSString *emailTitle = @"Feature Request";
    // Email Content
    NSString *messageBody = message;
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"thesubway@gmail.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    UIAlertView *alertView = [[UIAlertView alloc] init];
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"");
            break;
        case MFMailComposeResultSent:
            NSLog(@"");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"");
            break;
        case MFMailComposeResultFailed:
            alertView.title = @"Send failed";
            alertView.message = @"Sorry, your message failed to send.";
            [alertView show];
            return;
            
        default:
            break;
            
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
