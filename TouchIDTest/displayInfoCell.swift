//
//  displayInfoCell.swift
//  TouchIDTest
//
//  Created by Massimo on 15/5/19.
//  Copyright (c) 2015年 massimo. All rights reserved.
//

import UIKit

class displayInfoCell: UITableViewCell {
    var model : AddInfoModel?
    @IBOutlet weak var platform : UILabel!
    @IBOutlet weak var info : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.addObserver(self, forKeyPath: "model", options: .New , context: nil)
        platform.adjustsFontSizeToFitWidth = true
        info.adjustsFontSizeToFitWidth = true
        
    }
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if keyPath == "model"{
            configData()
        }
    }
    
    func configData(){
        platform.text = "   \(model!.platform)"
        info.text = "  " + model!.userName + "    " + model!.eMail
    }
    
    deinit{
        self.removeObserver(self, forKeyPath: "model")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
