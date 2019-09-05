# Haptic Feedback Demo for Watch

Apple Watch App that let's you try out all available haptic feedbacks for your Apple Watch App.



### Currently available haptic types (aka. `WKHapticType`)
- Notification
- Direction Up
- Direction Down
- Success
- Failure
- Retry
- Start
- Stop
- Click



To play haptic feedback (e.g. notification) in your app, simply call:
`WKInterfaceDevice.current().play(.notification)`
