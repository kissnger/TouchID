//
//  InputInfoViewController.swift
//  TouchIDTest
//
//  Created by Massimo on 15/5/19.
//  Copyright (c) 2015年 massimo. All rights reserved.
//

import UIKit

class InputInfoViewController: UIViewController {
    @IBOutlet weak var platform : UITextField!
    @IBOutlet weak var eMail    : UITextField!
    @IBOutlet weak var userName : UITextField!
    @IBOutlet weak var passWord : UITextField!
    
    var sendBlock = { (model:AddInfoModel) ->() in }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //点击完成
    
    @IBAction func clickDone(){
        let info = ["eMail" : eMail.text , "userName" : userName.text , "passWord" : passWord.text , "platform" : platform.text]
        let model = AddInfoModel(info: info)
        sendBlock(model)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func hiddenView(#tag:Int, hidden:Bool ){
        
        let view = self.view.viewWithTag(tag) as! UILabel
        
        view.hidden = hidden

    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension InputInfoViewController : UITextFieldDelegate {
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        self.hiddenView(tag: textField.tag + 100 , hidden: false)
        
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
       
        self.hiddenView(tag: textField.tag + 100 , hidden: true)
        
    }
}


