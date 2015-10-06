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
    level_++;
    if ([WCSession defaultSession].paired && [WCSession defaultSession].watchAppInstalled) {
        [[WCSession defaultSession] transferUserInfo:@{
                                                      @"level" : @(level_)
                                                      }];
        // @{ } Créer un NSDictionnary InLine
    }
}
- (IBAction)onTouchDownLevel:(id)sender {
    level_--;
    if ([WCSession defaultSession].paired && [WCSession defaultSession].watchAppInstalled) {
        [[WCSession defaultSession] transferUserInfo:@{
                                                       @"level" : @(level_)
                                                       }];
    }
}
- (IBAction)onTouchSwitch:(id)sender {
    if (self.secretSwitch.on) {
        self.resetButton.hidden = false;
    } else {
        self.resetButton.hidden = true;
    }
}

- (IBAction)onTouchReset:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Quitter" message:@"Êtes-vous sûr de vouloir quitter l'application ?" delegate:self cancelButtonTitle:@"Quitter" otherButtonTitles:@"Annuler", nil];
    [alert show];
    
    level_ = 0;
    if ([WCSession defaultSession].paired && [WCSession defaultSession].watchAppInstalled) {
        [[WCSession defaultSession] transferUserInfo:@{
                                                       @"level" : @(level_)
                                                       }];
    }
}

// Ne marche pas, je ne passe pas dans la boucle
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
        NSLog(@"QUIT APP");
    }
}

@end
