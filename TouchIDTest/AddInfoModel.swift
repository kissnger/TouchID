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
    
    init(info : Dictionary<String,String!> ) {
        
        self.eMail    = info["eMail"]!
        self.userName = info["userName"]!
        self.passWord = info["passWord"]!
        self.platform = info["platform"]!
    }
    
    func discription() ->NSString{
        return  "eMail:\(eMail)"       +
                "userName:\(userName)" +
                "passWord:\(passWord)" +
                "platform:\(platform)"
    }
    
}
