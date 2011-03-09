//
//  ViewController.m
//  JCSSheetController_Example
//
//  Created by Mike on 09/03/2011.
//  Copyright 2011 Jungle Candy Software. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController
@synthesize okButton;
@synthesize cancelButton;

- (id)init {
    if (!(self == [super initWithNibName:@"ExampleView" bundle:nil])) {
        return nil; // Bail!
    }
    return self;
}

// Mark: -
// Mark: Action methods

- (void)okClicked:(id)sender {
    //[self endSheetWithReturnCode:kSheetReturnedOk];
}

- (void)cancelClicked:(id)sender {
    //[self endSheetWithReturnCode:kSheetReturnedCancel];
}

@end
