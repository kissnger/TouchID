//
//  Safety.swift
//  TouchIDTest
//
//  Created by massimo on 15/5/18.
//  Copyright (c) 2015年 massimo. All rights reserved.
//

import UIKit
import LocalAuthentication
class Safety: NSObject {
    
    //单例
    class var sharedSafe: Safety {
        struct Singleton {
            static let instance = Safety()
        }
        return Singleton.instance
    }
    
    //通过通知中心 调用touchID
    func touchIDNoti(){
        
        var laContext = LAContext()
        
        var authError : NSError?
        
        var errorReason = "keep things secret"
        
        if laContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &authError){
            laContext.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: errorReason, reply: { (success, error) -> Void in
                if success {
                    println("success")
                }
                else{
                    //点击 输入密码时
                    
                    println("failed")
                }
            })
        }
            
        else{
            var alert = UIAlertView(title: "Can not do authenticatation", message: "", delegate: nil, cancelButtonTitle: "Cancel")
        }
    }

    
    
    
    
}
