TouchIDExtension
======================
TouchID used easy on one line in your ViewController. 

##Installation
At this moment, You can install only a way, manually.
For install, you can add JMEasyTouchID folder to your project. 
##Usage
1. Import `JMEasyTouchID` and init a view.   
2. In ViewController add the follow block:<br />
    **- useTouchID(_:completion)**
    <pre><code>useTouchID("touchID", completion: { (success, messageState, errorResult) -> Void in
            println(messageState)
        });</code></pre>
3. Import LocalAuthentication framework

##Return values
- success: BOOL -> if succes or not
- stateMessage: NSString -> message with touchID login
- errorResult: 
    - TouchID OK                  = nil
    - LAErrorAuthenticationFailed = -1
    - LAErrorUserCancel           = -2
    - LAErrorUserFallback         = -3
    - LAErrorSystemCancel         = -4
    - LAErrorPasscodeNotSet       = -5
    - LAErrorTouchIDNotAvailable  = -6
    - LAErrorTouchIDNotEnrolled   = -7


##Requirements
- TouchID.
- iOS 8 or higher

##License 
Mit License

##Contact
joanmramon@gmail.com

http://joanmolinas.com

