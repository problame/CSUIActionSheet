//
//  CSUIActionSheetOptions.m
//  CSUIActionSheet
//
//  Created by Christian Schwarz on 14.04.14.
//  Copyright (c) 2014 Christian Schwarz. See LICENSE.md for details.
//

#import "CSUIActionSheetOptions.h"
#import "CSUIActionSheetOptions_Private.h"

@implementation CSUIActionSheetOptions
@dynamic buttons, cancelButtonIndex, destructiveButtonIndex;

+ (instancetype)optionsWithView:(UIView *)view
{
    CSUIActionSheetOptions* opts = [[self alloc] init];
    opts.view = view;
    return opts;
}

- (id)init
{
    self = [super init];
    if (self) {
        self._buttons = [NSMutableArray array];
        self.callbacks = [NSMutableArray array];
    }
    return self;
}

- (void)addOption:(NSString *)buttonTitle callback:(void (^)())callback
{
    if (![buttonTitle isKindOfClass:[NSString class]]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Button title is nil." userInfo:nil];
    }
    
    [self._buttons addObject:buttonTitle];
    if (callback) {
        [self.callbacks addObject:callback];
    } else {
        [self.callbacks addObject:[NSNull null]];
    }
    
}

- (void)setDestructiveButton:(NSString *)buttonTitle callback:(void (^)())callback
{
    self.destructiveButtonTitle = buttonTitle;
    self.destructiveCallback = callback;
}

- (void)setCancelButton:(NSString *)buttonTitle callback:(void (^)())callback
{
    self.cancelButtonTitle = buttonTitle;
    self.cancelCallback = callback;
}

- (NSArray *)buttons
{
    return self._buttons;
}

- (NSString *)cancelButtonTitle
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        //API Documentation says iPad shall not have a cancel button title
        return nil;
    } else if (_cancelButtonTitle) {
        return _cancelButtonTitle;
    } else {
        return NSLocalizedString(@"Cancel", @"");
    }
}

- (NSInteger)cancelButtonIndex
{
    if (!self.cancelButtonTitle) {
        return -1;
    } else {
        return self.buttons.count + (self.destructiveButtonIndex >= 0 ? 1 : 0);
    }
}

- (NSInteger)destructiveButtonIndex
{
    if (self.destructiveButtonTitle) {
        return 0;
    } else {
        return -1;
    }
}


#pragma mark - action sheet

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == actionSheet.destructiveButtonIndex) {
        if (self.destructiveCallback) { self.destructiveCallback();}
        return;
    }
    
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        if (self.cancelCallback) { self.cancelCallback(); };
        return;
    }
    
    id callback = self.callbacks[buttonIndex - (self.destructiveButtonIndex >= 0 ? 1 : 0)];
    if ([callback isKindOfClass:[NSNull class]] || !callback) {
        return;
    } else {
        void(^actualCallback)() = callback;
        actualCallback();
    }
    
}

@end
