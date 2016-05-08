//
//  AppDelegate.m
//  AlcatrazApp
//
//  Created by hewigovens on 2/26/16.
//  Copyright © 2016 supermar.in. All rights reserved.
//

#import "AppDelegate.h"
#import "AlcatrazPrivate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [AlcatrazPrivate loadAlcatrazBundle];
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag {
    [[AlcatrazPrivate sharedPlugin] loadWindowAndPutInFront];
    return YES;
}

@end
