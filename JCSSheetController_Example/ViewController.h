//
//  ViewController.h
//  JCSSheetController_Example
//
//  Created by Mike on 09/03/2011.
//  Copyright 2011 Jungle Candy Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ViewController : NSViewController {

}

@property (nonatomic, assign) IBOutlet NSButton *okButton;
@property (nonatomic, assign) IBOutlet NSButton *cancelButton;

- (IBAction)okClicked:(id)sender;
- (IBAction)cancelClicked:(id)sender;

@end
