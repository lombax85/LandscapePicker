//
//  FLApplication.m
//  PickerTest
//
//  Created by Lombardo on 08/11/13.
//  Copyright (c) 2013 Lombardo. All rights reserved.
//

#import "FLApplication.h"

@implementation FLApplication

- (NSUInteger)supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    UIViewController *topController = window.rootViewController;
    
    if ([self hasPicker:topController])
        return UIInterfaceOrientationMaskAll;
    
    return [super supportedInterfaceOrientationsForWindow:window];
    
}

-(BOOL)hasPicker:(UIViewController *)controller
{
    BOOL hasPicker = NO;
    
    NSLog(@"Check Controller: %@", controller);
    
    if ([controller isKindOfClass:[UIImagePickerController class]])
        return YES;
    
    for (UIViewController *child in controller.childViewControllers) {
        hasPicker = [self hasPicker:child];
        
        if (hasPicker)
            return YES;
    }
    
    return NO;
}

@end
