//
//  UIActionSheet+CSUIActionSheet.h
//  CSUIActionSheet
//
//  Created by Christian Schwarz on 14.04.14.
//  Copyright (c) 2014 Christian Schwarz. See LICENSE.md for details.
//

#import <UIKit/UIKit.h>
@class CSUIActionSheetOptions;

@interface UIActionSheet (CSUIActionSheet) <UIActionSheetDelegate>

+ (void)cs_presentWithOptions:(CSUIActionSheetOptions *)opts;

@end
