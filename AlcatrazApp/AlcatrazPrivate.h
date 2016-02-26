//
//  AlcatrazPrivate.h
//  Alcatraz
//
//  Created by hewigovens on 2/26/16.
//  Copyright © 2016 supermar.in. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlcatrazPrivate : NSObject

// proxy
+ (void)pluginDidLoad:(NSBundle *)bundle;
+ (id)sharedPlugin;
- (void)createMenuItem;
- (void)loadWindowAndPutInFront;

+ (void)loadAlcatrazBundle;

@end

