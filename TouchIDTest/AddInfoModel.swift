//
//  AddInfoModel.swift
//  TouchIDTest
//
//  Created by Massimo on 15/5/19.
//  Copyright (c) 2015年 massimo. All rights reserved.
//

import UIKit
//let info = ["eMail" : eMail.text , "userName" : userName.text , "passWord" : passWord.text , "platform" : platform.text]
class AddInfoModel: NSObject {
    var eMail    : String!
    var userName : String!
    var passWord : String!
    var platform : String!
    
    init(info : NSDictionary) {
        self.eMail    = info["eMail"] as! String
        self.userName = info["userName"] as! String
        self.passWord = info["passWord"] as! String
        self.platform = info["platform"] as! String
    }
    
    func discription() ->NSString{
        return  "eMail:\(eMail)"       +
                "userName:\(userName)" +
                "passWord:\(passWord)" +
                "platform:\(platform)"
    }
    
}
