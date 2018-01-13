# SwiftLoadingIndicator
Loading Indicator in Swift

<img src="https://raw.github.com/vincechan/SwiftLoadingIndicator/master/ScreenShots/ActivityIndicatorWithOverlay.gif" alt="screen shot" >

## Features

1. Easy to use
2. Show a transparent overlay over the whole screen or part of the screen. The overlay will prevent user interaction with the covered controls while the task is in progress.
3. Show animating UIActivityIndicatorView programmatically in the center of the overlay to indicate a task is being processed
4. Show additional custom text in the overlay to provide additional information
 
## How To Use
Include the LoadingIndicatorView.swift file. Call one of the show methods to show the indicator before long running task. 
Call hide method to hide the indicator after long running task.

##### Show indicator to cover entire screen
LoadingIndicatorView.show()

##### Show indicator to cover entire screen with custom text
LoadingIndicatorView.show("Loading")

##### Show indicator to cover target view
LoadingIndicatorView.show(target)

##### Show indicator to cover target view with custom text
LoadingIndicatorView.show(target, "Loading")

##### Hide indicator
LoadingIndicatorView.hide()
