//
//  ListViewController.m
//  HomelessHelper
//
//  Created by Dan Hoang on 3/1/15.
//  Copyright (c) 2015 Dan Hoang. All rights reserved.
//

#import "ListViewController.h"
#import "PlayVideoViewController.h"
#import <Parse/Parse.h>
#import "Video.h"

@interface ListViewController ()

@property (strong, nonatomic) NSMutableArray *listOfBooks;
@property (strong, nonatomic) NSMutableArray *listOfVideos;
@property (strong, nonatomic) NSMutableArray *listOfIDs;
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listOfBooks = [[NSMutableArray alloc] initWithObjects:@"The Swift Programming Language",@"How to Win Friends and Influence People", nil];
//    self.listOfVideos = [[NSMutableArray alloc] initWithObjects:@"Piano playing",@"Swift navigation tutorial", nil];
//    PFObject *videoList = [[PFObject alloc] initWithClassName:@"videoList"];
    PFQuery *query = [[PFQuery alloc] initWithClassName:@"videoList"];
//    NSMutableArray *listOfIDs = [[NSMutableArray alloc] initWithObjects:@"8Q7QUEBYXHU",@"AQXWsDNno8o", nil];
    if ([self.searchType isEqualToString:@"Books"]) {
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        return;
    }
    else {
    }
    [query getObjectInBackgroundWithId:@"ogrCNqYDJl" block:^(PFObject *object, NSError *error) {
        if (error != nil) {
            UIAlertView *alertView = [[UIAlertView alloc] init];
            alertView.title = @"Retrieve failed";
            alertView.message = @"Failed to retrieve data.";
            [alertView show];
        }
        else {
//            [object setObject:listOfIDs forKey:@"id_list"];
//            [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//                if (error != nil) {
//                    UIAlertView *alertView = [[UIAlertView alloc] init];
//                    alertView.title = @"Save failed";
//                    alertView.message = @"Failed to retrieve data.";
//                    [alertView show];
//                }
//            }];
            
            self.listOfVideos = object[@"video_list"];
            self.listOfIDs = object[@"id_list"];
            self.tableView.dataSource = self;
            self.tableView.delegate = self;
            [self.tableView reloadData];
        }
    }];
    //    Video *myVid = [[Video alloc] init];
    //    myVid.name = @"Piano playing";
    //    myVid.videoId = @"8Q7QUEBYXHU";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.searchType isEqualToString:@"Books"]) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"The Swift Programming Language" ofType:@".EPUB"];
        NSString *stringURL = [@"itms-bookss://" stringByAppendingPathComponent:path];
        NSURL *url = [NSURL URLWithString:stringURL];
        
        if ([[UIApplication sharedApplication] canOpenURL:url])
        {
            NSLog(@"Yes");
        }
        [[UIApplication sharedApplication] openURL:url];
    }
    else {
        PlayVideoViewController *playVideoView = [self.storyboard instantiateViewControllerWithIdentifier:@"playVideoView"];
        playVideoView.listOfVideos = _listOfVideos;
        playVideoView.listOfIDs = _listOfIDs;
        playVideoView.indexPath = indexPath;
        [self.navigationController pushViewController:playVideoView animated:YES];
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.searchType isEqualToString:@"Books"]) {
        return self.listOfBooks.count;
    }
    else if ([self.searchType isEqualToString:@"Videos"]) {
        return self.listOfVideos.count;
    }
    return self.listOfVideos.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell"];
    NSString *currentValue;
    NSLog(self.searchType);
    if ([self.searchType isEqualToString:@"Books"]) {
        currentValue = [self.listOfBooks objectAtIndex:indexPath.row];
    }
    else {
        currentValue = [self.listOfVideos objectAtIndex:indexPath.row];
    }
    cell.textLabel.text = currentValue;
    return cell;
}

@end
