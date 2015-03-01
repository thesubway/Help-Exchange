//
//  PlayVideoViewController.m
//  HomelessHelper
//
//  Created by Dan Hoang on 3/1/15.
//  Copyright (c) 2015 Dan Hoang. All rights reserved.
//

#import "PlayVideoViewController.h"
#import "DejalActivityView.h"
#import <Parse/Parse.h>

@interface PlayVideoViewController ()
@property (strong, nonatomic) UIWebView *movieView;
@end

@implementation PlayVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // add movie:
    CGFloat movieWidth = self.view.bounds.size.width * 7 / 8;
    CGFloat movieHeight = self.view.bounds.size.height * 1 / 2;
    self.movieView = [[UIWebView alloc] init];
    //frame: CGRect(x: 20, y: 100, width: movieWidth, height: movieHeight)
    self.movieView.frame = CGRectMake(self.view.bounds.size.width / 2 - (movieWidth / 2), self.view.bounds.size.height / 2 - (movieHeight / 2), movieWidth, movieHeight);
    self.movieView.delegate = self;
    NSURLRequest *request;
    
    //retrieve video:
    
    
//    if (_indexPath.row == 0) {
//        request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.youtube.com/embed/8Q7QUEBYXHU" ]];
//    }
//    else if (_indexPath.row == 1) {
//        request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.youtube.com/embed/AQXWsDNno8o" ]];
//    }
    NSString *vidID = [_listOfIDs objectAtIndex:_indexPath.row];
    NSString *youtubeURL = [NSString stringWithFormat:@"%@%@", @"http://www.youtube.com/embed/",vidID];
    request = [NSURLRequest requestWithURL:[NSURL URLWithString:youtubeURL]];
    [self.view addSubview:self.movieView];
    [DejalBezelActivityView activityViewForView:self.view];
    [self.movieView loadRequest:request];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [DejalBezelActivityView removeViewAnimated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end