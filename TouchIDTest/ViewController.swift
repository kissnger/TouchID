//
//  ViewController.swift
//  TouchIDTest
//
//  Created by massimo on 15/5/18.
//  Copyright (c) 2015年 massimo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTabelView : UITableView!
    
    var dataArray = [AddInfoModel]()
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.addObserver(self, forKeyPath: "dataArray", options: .New | .Initial, context: nil)
        if Safety.success != true {
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("welcomeVC") as! welcomeViewController
            
            self.navigationController?.presentViewController(vc, animated: false, completion: nil)
        }
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeObserver(self, forKeyPath: "dataArray")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)


    }
    override func observeValueForKeyPath(keyPath: String,
                                 ofObject object: AnyObject,
                              change: [NSObject : AnyObject],
                                         context: UnsafeMutablePointer<Void>)
    {
        if keyPath == "dataArray" {
            let view  = self.view.viewWithTag(200) as! UILabel
            (dataArray.count > 0) ? (view.hidden = true) : (view.hidden = false)
        }
        
    }
    
    
    @IBAction func clickAdd(){
        var infoVC = self.storyboard?.instantiateViewControllerWithIdentifier("inputInfoVC") as! InputInfoViewController
        
        infoVC.sendBlock = { model ->() in
            
            self.dataArray.append(model)
            self.myTabelView.reloadData()
            println(model)
        }
        
        self.navigationController!.pushViewController(infoVC, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

extension ViewController : UITableViewDataSource{
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("infoCell") as! displayInfoCell
        
        let model = dataArray[indexPath.row]
        
        cell.setValue(model, forKey: "model")
        
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
}

extension ViewController : UITableViewDelegate{
    
    
    
}