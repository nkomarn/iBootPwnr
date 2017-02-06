//
//  ViewController.m
//  iBootPwnr
//
//  Created by Nicky Komarn on 2/5/17.
//  Copyright © 2017 nkomarn. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_currentActivity setStringValue:@""];
    [_iPhone2GButton setHidden:NO];
    [_iPhone3GButton setHidden:NO];
    [_iPodTouch1GButton setHidden:NO];
    _iPhone3GButton.enabled = NO;
    _iPodTouch1GButton.enabled = NO;
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}
- (IBAction)forceQuitButtonAction:(id)sender {
    //Force quit app
    [NSApp terminate: nil];
}

- (IBAction)iPhone2GButtonAction:(id)sender {
    
    //Enter recovery mode prompt
    NSAlert *enterrecmode = [[NSAlert alloc] init];
    [enterrecmode setMessageText:@"Enter recovery mode"];
    [enterrecmode setInformativeText:@"Turn off your iPhone and plug the cable in while holding the home button. Wait until the iTunes logo appears and then click 'Next'."];
    [enterrecmode addButtonWithTitle:@"Next"];
    [enterrecmode addButtonWithTitle:@"Quit"];
    NSInteger button = [enterrecmode runModal];
    [_currentActivity setStringValue:@"Preparing to boot into recovery mode..."];
    if (button == NSAlertFirstButtonReturn) {
        
        //Begin booting OpeniBoot image
        [_currentActivity setStringValue:@"Preparing to boot OpeniBoot image..."];
        NSLog(@"Begin booting OpeniBoot image");
        [_iPhone2GButton setHidden:YES];
        [_iPhone3GButton setHidden:YES];
        [_iPodTouch1GButton setHidden:YES];
        [_versionLabel setStringValue:@""];
        [_activityIndicator startAnimation:self];
        
        //Find file locations
        [_currentActivity setStringValue:@"Looking for loadibec file..."];
        NSString *loadibecFile = [[NSBundle mainBundle] pathForResource:@"loadibec" ofType:nil];
        [_currentActivity setStringValue:@"Looking for OpeniBoot file..."];
        NSString *OiBFile = [[NSBundle mainBundle] pathForResource:@"openiboot-iPhone2G" ofType:@"img3"];
        
        NSLog(@"%@",OiBFile);
        
        //Begin task
        [_currentActivity setStringValue:@"Booting image..."];
        
        NSTask *task = [NSTask new];
        [task setLaunchPath: loadibecFile];
        [task setArguments: OiBFile];
        [task launch];
        [_currentActivity setStringValue:@"Waiting for device to boot..."];
        
        
        
    } else if (button == NSAlertSecondButtonReturn) {
        //Quit app
        [NSApp terminate: nil];
    }
}

@end
