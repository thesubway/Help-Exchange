//
//  ContactViewController.h
//  HomelessHelper
//
//  Created by Dan Hoang on 2/28/15.
//  Copyright (c) 2015 Dan Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import <MessageUI/MessageUI.h>

@interface ContactViewController : UIViewController <MFMailComposeViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *submitButton;
- (IBAction)submitPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
@property (strong, nonatomic) IBOutlet UITextField *lookingForTextField;
@property (strong, nonatomic) IBOutlet UITextField *offerTextField;

@end
