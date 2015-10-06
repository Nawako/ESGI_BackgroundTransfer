//
//  ViewController.m
//  BackgroundTransfers
//
//  Created by Etudiant on 06/10/2015.
//  Copyright © 2015 Etudiant. All rights reserved.
//

#import "ViewController.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface ViewController () {
    @private
    NSUInteger level_;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTouchNextLevel:(id)sender {
    if ([WCSession defaultSession].paired && [WCSession defaultSession].watchAppInstalled) {
        [[WCSession defaultSession] transferUserInfo:@{
                                                      @"level" : @(level_)
                                                      }];
        // @{ } Créer un NSDictionnary InLine
    }
}

@end
