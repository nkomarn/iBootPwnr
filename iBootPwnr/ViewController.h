//
//  ViewController.h
//  iBootPwnr
//
//  Created by Nicky Komarn on 2/5/17.
//  Copyright © 2017 nkomarn. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
@property (strong) IBOutlet NSButton *iPhone2GButton;
@property (strong) IBOutlet NSButton *iPhone3GButton;
@property (strong) IBOutlet NSButton *iPodTouch1GButton;


@property (strong) IBOutlet NSProgressIndicator *activityIndicator;
@property (strong) IBOutlet NSTextField *currentActivity;
@property (strong) IBOutlet NSTextField *versionLabel;


@end

