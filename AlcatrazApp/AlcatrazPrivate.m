//
//  AlcatrazPrivate.m
//  Alcatraz
//
//  Created by hewigovens on 2/26/16.
//  Copyright © 2016 supermar.in. All rights reserved.
//

#import "AlcatrazPrivate.h"

@implementation AlcatrazPrivate

+ (void)pluginDidLoad:(NSBundle *)bundle{}
+ (id)sharedPlugin{return nil;}
- (void)createMenuItem {}
- (void)loadWindowAndPutInFront{}

+ (void)loadAlcatrazBundle
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Alcatraz" ofType:@"xcplugin"];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    [bundle load];
    
    Class klass = NSClassFromString(@"Alcatraz");
    SEL pluginDidLoadSEL = NSSelectorFromString(@"pluginDidLoad:");
    SEL sharedPluginSEL = NSSelectorFromString(@"sharedPlugin");
    if (klass) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [[klass class] performSelector:pluginDidLoadSEL withObject:bundle];
        AlcatrazPrivate *sharedPlugin = [[klass class] performSelector:sharedPluginSEL];
#pragma pop
        [sharedPlugin loadWindowAndPutInFront];
    }
}

@end
