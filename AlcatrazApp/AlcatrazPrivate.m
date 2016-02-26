//
//  AlcatrazPrivate.m
//  Alcatraz
//
//  Created by hewigovens on 2/26/16.
//  Copyright © 2016 supermar.in. All rights reserved.
//

#import "AlcatrazPrivate.h"

static AlcatrazPrivate *_instance;

@implementation AlcatrazPrivate

+ (void)pluginDidLoad:(NSBundle *)bundle{}
+ (id)sharedPlugin{return _instance;}
- (void)createMenuItem {}
- (void)loadWindowAndPutInFront{}

+ (void)loadAlcatrazBundle
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
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
            _instance = sharedPlugin;
#pragma pop
            [sharedPlugin loadWindowAndPutInFront];
        }
    });
}

@end
