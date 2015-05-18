//
//  Util.swift
//  TouchIDTest
//
//  Created by massimo on 15/5/19.
//  Copyright (c) 2015年 massimo. All rights reserved.
//

import UIKit

class Util: NSObject {
    
//    ==================通知中心==================
    
    class func addNotiCenter(observer: AnyObject, name:String,
                          selector:Selector)
    {
        NSNotificationCenter.defaultCenter().addObserver(observer, selector: selector, name: name, object: nil)
    }
    
    class func addNotiCenter(observer: AnyObject, name:String, selector:Selector, object:AnyObject!){
        NSNotificationCenter.defaultCenter().addObserver(observer, selector: selector, name: name, object: object)
    }
    
    class func postNoti(#name:String){
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: name, object: nil))
    }
    
    class func postNoti(#name:String, object:AnyObject!){
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: name, object: object))
    }
    
    
}
