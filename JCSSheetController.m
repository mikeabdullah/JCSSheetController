//
//  JCSSheetController.m
//
//  Created by Abizer Nasir on 19/02/11.
//  Based on SDSheetController by Steven Degutis https://github.com/sdegutis/SDSheetController
//

#import "JCSSheetController.h"

@interface JCSSheetController ()
@property (nonatomic, copy) JCSCompletionHandler handler;
- (void)sheetDidEnd:(NSWindow *)sheet returnCode:(NSUInteger)returnCode contextInfo:(void *)contextInfo;
@end


#pragma mark -


@implementation JCSSheetController

#pragma mark Content View Controller

@synthesize contentViewController = _contentViewController;
- (void)setContentViewController:(NSViewController *)viewController;
{
    [viewController retain];
    [_contentViewController release]; _contentViewController = viewController;
    
    if ([self isWindowLoaded]) [[self window] setContentView:[viewController view]];
}

- (void)loadWindow;
{
    if (![[self windowNibName] length] && [self contentViewController])
    {
        // Create a window for the content view
        NSWindow *window = [[NSWindow alloc] initWithContentRect:[[[self contentViewController] view] frame]
                                                       styleMask:NSTitledWindowMask | NSResizableWindowMask
                                                         backing:NSBackingStoreBuffered
                                                           defer:YES];
        
        [window setContentView:[[self contentViewController] view]];
        [self setWindow:window];
        [window release];
    }
    else
    {
        [super loadWindow];
    }
}

// If nib name is nil, bizarrely, -loadWindow doesn't get called
- (id)init; { return [self initWithWindowNibName:@""]; }

#pragma mark Presentation

@synthesize handler;

- (void)beginSheetModalForWindow:(NSWindow *)window completionHandler:(JCSCompletionHandler)aHandler {
    self.handler = aHandler;
    
    [self sheetWillAppear];
    
    [NSApp beginSheet:self.window modalForWindow:window modalDelegate:self didEndSelector:@selector(sheetDidEnd:returnCode:contextInfo:) contextInfo:NULL];
}

- (void)endSheetWithReturnCode:(NSUInteger)result {
    [NSApp endSheet:[self window] returnCode:result];
}

- (void)sheetWillAppear {
    // Default does nothing.
    // Convenience for subclasses to override.
}

// Mark: -
// Mark: Class Extension methods

- (void)sheetDidEnd:(NSWindow *)sheet returnCode:(NSUInteger)returnCode contextInfo:(void *)contextInfo {
    [sheet orderOut:self];
    
    if (self.handler) {
        handler(returnCode);
    }
}

@end
