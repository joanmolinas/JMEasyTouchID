//
//  JMEasyTouchID.swift
//  UIVIewControllerTouchIDSwift
//
//  Created by Joan Molinas on 20/2/15.
//  Copyright (c) 2015 Joan. All rights reserved.
//

import UIKit
import LocalAuthentication
import Foundation

extension UIViewController {

    func useTouchID(description: String, completion:(success:Bool, messageState: String, errorResult: LAError?)-> Void){
        let contexto = LAContext()
        var error: NSError?
        var message : String!
        if contexto.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
            [contexto.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: description, reply: { (success: Bool, error: NSError?) -> Void in
                
                if success {
                    completion(success:true, messageState:"User authentication OK", errorResult:nil)
                } else {
                    switch error!.code {
                        case LAError.SystemCancel.rawValue:
                            message = "The system has cancelled the login process";
                            completion(success: false, messageState: message, errorResult: LAError.SystemCancel)
                        case LAError.UserCancel.rawValue:
                            message = "The user has cancelled the login process";
                            completion(success: false, messageState: message, errorResult: LAError.UserCancel)
                        case LAError.UserFallback.rawValue:
                            message = "The user has chosen alternative method for login";
                            completion(success: false, messageState: message, errorResult: LAError.UserFallback)
                        
                        default:
                            message = "Login with TouchID has failed and show alternative method";
                            completion(success: false, messageState: message, errorResult: LAError.TouchIDNotAvailable)
                        }
                }
            })]
        } else{
            switch error!.code {
            case LAError.TouchIDNotEnrolled.rawValue:
                message = "User has not configurated the TouchID";
                completion(success: false, messageState: message, errorResult: LAError.TouchIDNotEnrolled)
                break;
            case LAError.PasscodeNotSet.rawValue:
                message = "User has not configurated the password";
                completion(success: false, messageState: message, errorResult: LAError.PasscodeNotSet)
                break;
            default:
                message = "Touch ID not available";
                completion(success: false, messageState: message, errorResult: LAError.TouchIDNotAvailable)
                break;
            }

        
        }
    }
}