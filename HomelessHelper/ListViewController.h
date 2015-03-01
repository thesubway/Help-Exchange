//
//  ListViewController.h
//  HomelessHelper
//
//  Created by Dan Hoang on 3/1/15.
//  Copyright (c) 2015 Dan Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSString *searchType;
@property (strong, nonatomic) NSString *searchValue;
@end
