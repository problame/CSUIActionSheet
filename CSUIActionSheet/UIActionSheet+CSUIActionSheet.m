//
//  UIActionSheet+CSUIActionSheet.m
//  CSUIActionSheet
//
//  Created by Christian Schwarz on 14.04.14.
//  Copyright (c) 2014 Christian Schwarz. See LICENSE.md for details.
//

#import "UIActionSheet+CSUIActionSheet.h"
#import "CSUIActionSheetOptions.h"
#import <objc/runtime.h>

@implementation UIActionSheet (CSUIActionSheetOptions)

+ (void)cs_presentWithOptions:(CSUIActionSheetOptions *)opts
{
    
    UIActionSheet* sheet = [[UIActionSheet alloc] initWithTitle:opts.title
                                                       delegate:(id <UIActionSheetDelegate>)[self class]
                                              cancelButtonTitle:nil
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:nil];
    
    objc_setAssociatedObject(sheet, "cs_actionSheetOptions", opts, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (opts.destructiveButtonTitle) {
        [sheet addButtonWithTitle:opts.destructiveButtonTitle];
        [sheet setDestructiveButtonIndex:opts.destructiveButtonIndex];
    }
    
    for (NSString* opt in opts.buttons) {
        [sheet addButtonWithTitle:opt];
    }
    
    if (opts.cancelButtonTitle) {
        [sheet addButtonWithTitle:opts.cancelButtonTitle];
        [sheet setCancelButtonIndex:opts.cancelButtonIndex];
    }
    
    //Presentation
    id view = opts.view;
    if (view) {
        if (!CGRectEqualToRect(opts.rect, CGRectZero)) {
            [sheet showFromRect:opts.rect inView:view animated:YES];
        } else {
            if([view isKindOfClass:[UIView class]]) {
                [sheet showInView:view];
            }
            if([view isKindOfClass:[UITabBar class]]) {
                [sheet showFromTabBar:(UITabBar*) view];
            }
            if([view isKindOfClass:[UIBarButtonItem class]]) {
                [sheet showFromBarButtonItem:(UIBarButtonItem*) view animated:YES];
            }
        }
    }
    
}

+ (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    CSUIActionSheetOptions* opts = objc_getAssociatedObject(actionSheet, "cs_actionSheetOptions");
    objc_removeAssociatedObjects(actionSheet);

    [opts actionSheet:actionSheet didDismissWithButtonIndex:buttonIndex];
    
}

@end
