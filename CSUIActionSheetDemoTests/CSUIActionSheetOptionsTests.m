//
//  CSUIActionSheetOptionsTests.m
//  CSUIActionSheetDemo
//
//  Created by Christian Schwarz on 14.04.14.
//  Copyright (c) 2014 Christian Schwarz. See LICENSE.md for details.
//

#import <XCTest/XCTest.h>
#import "CSUIActionSheet.h"
#import "CSUIActionSheetOptions_Private.h"

@interface CSUIActionSheetOptionsTests : XCTestCase

@end

@implementation CSUIActionSheetOptionsTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitSettingDefaults
{
    CSUIActionSheetOptions* opts = [[CSUIActionSheetOptions alloc] init];
    XCTAssertTrue([opts._buttons isKindOfClass:[NSMutableArray class]], @"_buttons is not initialized");
    XCTAssertTrue([opts.callbacks isKindOfClass:[NSMutableArray class]], @"callbacks is not initialized");
}

- (void)testDestructiveButtonIndexIsFirst
{
    
    CSUIActionSheetOptions* opts = [CSUIActionSheetOptions optionsWithView:nil];
    
    [opts setDestructiveButton:@"ds" callback:^{
        
    }];
    
    [opts addOption:@"opt" callback:^{
        
    }];
    [opts addOption:@"opt2" callback:^{
        
    }];
    
    XCTAssertEqual(opts.destructiveButtonIndex, 0, @"Destructive button index has to be 0 if a destructive button is set");
    XCTAssertEqual(opts.cancelButtonIndex, 3, @"Cancel button index is not at the end of all options.");
    
}

- (void)testIndexesCorrectWithoutDestructiveButton
{
 
    CSUIActionSheetOptions* opts = [CSUIActionSheetOptions optionsWithView:nil];
    
    [opts addOption:@"opt" callback:^{
        
    }];
    [opts addOption:@"opt2" callback:^{
        
    }];
    
    XCTAssertEqual(opts.destructiveButtonIndex, -1, @"Destructive button index has to be -1 if not explicitly set");
    XCTAssertEqual(opts.cancelButtonIndex, 2, @"Cancel button index is not at the end of all options.");
    
}

- (void)testHandlingOfNilInputOnAddOption
{
    CSUIActionSheetOptions* opts = [CSUIActionSheetOptions optionsWithView:nil];
    
    XCTAssertThrowsSpecificNamed([opts addOption:nil callback:nil], NSException, NSInternalInconsistencyException, @"first parameter (button name) must not be nil as it is added to the array");
    
    opts = [CSUIActionSheetOptions optionsWithView:nil];
    
    [opts addOption:@"foo" callback:nil];
    
    XCTAssertEqualObjects(opts.callbacks.firstObject, [NSNull null], @"Adding a nil-callback should result in adding NSNull to the callbacks array");
    
}


@end
