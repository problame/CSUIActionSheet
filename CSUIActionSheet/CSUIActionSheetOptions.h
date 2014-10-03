//
//  CSUIActionSheetOptions.h
//  CSUIActionSheet
//
//  Created by Christian Schwarz on 14.04.14.
//  Copyright (c) 2014 Christian Schwarz. See LICENSE.md for details.
//

#import <Foundation/Foundation.h>


@interface CSUIActionSheetOptions : NSObject <UIActionSheetDelegate>

+ (instancetype)optionsWithView:(UIView*)view;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, weak) UIView* view;
@property (nonatomic) CGRect rect;

- (void)addOption:(NSString*)buttonTitle callback:(void (^)())callback;
@property (readonly) NSArray* buttons;


- (void)setDestructiveButton:(NSString*)buttonTitle callback:(void (^)())callback;
@property (nonatomic, strong, readonly) NSString* destructiveButtonTitle;
@property (readonly) NSInteger destructiveButtonIndex;


- (void)setCancelButton:(NSString*)buttonTitle callback:(void (^)())callback;
@property (nonatomic, strong, readonly) NSString* cancelButtonTitle;
@property (readonly) NSInteger cancelButtonIndex;
@property (nonatomic) BOOL forceCancelButton;

@end
