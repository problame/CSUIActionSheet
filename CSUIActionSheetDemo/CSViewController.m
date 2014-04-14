//
//  CSViewController.m
//  CSUIActionSheetDemo
//
//  Created by Christian Schwarz on 14.04.14.
//  Copyright (c) 2014 Christian Schwarz. See LICENSE.md for details.
//

#import "CSViewController.h"
#import "CSUIActionSheet.h"

@interface CSViewController ()

@end

@implementation CSViewController


- (IBAction)didPushShowDemoSheet:(id)sender {


    CSUIActionSheetOptions* opts = [CSUIActionSheetOptions optionsWithView:sender];
    
    [opts addOption:@"Option 1" callback:^{
        NSLog(@"Option 1");
    }];
    
    [opts addOption:@"Option 2" callback:^{
        NSLog(@"Option 2");
    }];
    
    [opts setCancelButton:nil callback:^{
        NSLog(@"Cancel");
    }];
    
    __block typeof(opts) weakOpts = opts;
    [opts setDestructiveButton:@"DESTROY" callback:^{
       
        CSUIActionSheetOptions* confOpts = [CSUIActionSheetOptions optionsWithView:weakOpts.view];
        confOpts.title = @"Confirmation\n\nDo you want to destroy?";
        
        [confOpts setCancelButton:@"No" callback:^{
            NSLog(@"Chose not to destroy");
        }];
        
        [confOpts setDestructiveButton:@"Yes" callback:^{
            NSLog(@"Chose to destroy");
        }];
        
        [UIActionSheet cs_presentWithOptions:confOpts];
        
        
    }];
    
    [UIActionSheet cs_presentWithOptions:opts];
    
}

@end
