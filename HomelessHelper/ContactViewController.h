//
//  ContactViewController.h
//  HomelessHelper
//
//  Created by Dan Hoang on 2/28/15.
//  Copyright (c) 2015 Dan Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface ContactViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *submitButton;
- (IBAction)submitPressed:(id)sender;

@end
