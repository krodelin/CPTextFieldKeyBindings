/*
 * AppController.j
 * CPTextFieldKeyBindings
 *
 * Created by Udo Schneider on June 25, 2014.
 * Copyright 2014, Krodelin Software Solutions All rights reserved.
 */

@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>


@implementation AppController : CPObject
{
    @outlet CPWindow    theWindow;
    @outlet CPWindow    findWindow;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.

    // In this case, we want the window from Cib to become our full browser window
    // [theWindow setFullPlatformWindow:YES];
    [CPPlatformWindow preventCharacterKeyFromPropagating:'f'];
}

- (@action)performFindPanelAction:(id)sender
{
    [findWindow makeKeyAndOrderFront:nil];
}

@end
