//
//  CSUIActionSheetOptions_Private.h
//  CSUIActionSheet
//
//  Created by Christian Schwarz on 14.04.14.
//  Copyright (c) 2014 Christian Schwarz. See LICENSE.md for details.
//

#import "CSUIActionSheetOptions.h"

@interface CSUIActionSheetOptions ()

@property (nonatomic, strong) NSMutableArray* _buttons;
@property (nonatomic, strong) NSMutableArray* callbacks;
@property (nonatomic, copy) void(^destructiveCallback)();
@property (nonatomic, copy) void(^cancelCallback)();

@property (nonatomic, strong, readwrite) NSString* cancelButtonTitle;
@property (nonatomic, strong, readwrite) NSString* destructiveButtonTitle;

@property (readonly) BOOL interfaceIdiomForbidsCancelButton;


@end
