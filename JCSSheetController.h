//
//  JCSSheetController.h
//  
//  Created by Abizer Nasir on 19/02/11.
//  Based on SDSheetController by Steven Degutis https://github.com/sdegutis/SDSheetController
// 
//  Requires Garbage Collection to be turned on.
//  A basic window controller subclass that wraps a sheet callback in a block.
//

#import <Cocoa/Cocoa.h>

typedef void (^JCSCompletionHandler)(NSUInteger result);

@interface JCSSheetController : NSWindowController {
@private
    JCSCompletionHandler handler;
    
    NSViewController    *_contentViewController;
}

// If a window/nib has been provided, this will replace its content view. If not, a window will be created on-demand
@property(nonatomic, retain) NSViewController *contentViewController;

- (void)beginSheetModalForWindow:(NSWindow *)window completionHandler:(JCSCompletionHandler)aHandler;

// Convenience methods for subclasses to use
- (void)endSheetWithReturnCode:(NSUInteger)result;
- (void)sheetWillAppear; // Default does nothing

@end
