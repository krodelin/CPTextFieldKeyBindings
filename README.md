# CPTextFieldKeyBindings

This project was created in response to a [posting in the Cappuccino Group](https://groups.google.com/forum/#!topic/objectivej/BoW0zZ5Adew).

> Hi, I'd like to add bindings to some textfields. For example, if the first
> responder is one of my textfields and the user presses ctrl + f then display a
> popover.
> 
> Ive seen that I can subclass from CPTextField and override the method
> interpretKeyEvents:  and add the desired behaviour there.
> Is there an easier way of doing this?
>
>
> Thanks in advance.
>
> Sebastian

## General Cococa & Cappuccino behaviour
This project shows the concept of the responder chain.

Pressing `Control+F` (`Command-F` on the Mac) will open a (dummy) Find Window even if the Text Field is in focus (firstResponder). No object in the responder chain (up to the menu) intercepts this command. The menu however has a `Find ...` Menu Entry with that shortcut. So it's action is triggered. The action's receiever is the "pseudo" object `First Responder` - basically a `nil`-targeted action. Triggering this command make Cappuccino once again use the responder chain to find an object which implements the action's message  `- (@action)performFindPanelAction:(id)sender` which in this case is the `AppController`. More (all?) details about the responder chain can be found in Apple's [Cocoa Event Handling Guide](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/EventOverview/EventArchitecture/EventArchitecture.html).

## Cappuccino specific behaviour

Everything above is standard Cocoa behaviour. One special thing to take care of when using Cappuccino is that most key commands are propagated to the browser itself. So pressing `Control-F` will most likely open the browser's find window. To prevent this (and handle the key in Cappuccino) you have to prevent Cappuccino from propagating this key command:

    [CPPlatformWindow preventCharacterKeyFromPropagating:'f'];
