//
//  SecondViewController.swift
//  To Do List
//
//  Created by Namitha Ninan on 8/28/16.
//  Copyright © 2016 namithaninan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var label: UILabel!
    
    func button(sender: AnyObject) {
        toDoList.append(textField.text!)
        textField.text=""
        NSUserDefaults.standardUserDefaults().setObject( toDoList, forKey: "toDoList")
    }
    
    weak var textField: UITextField!
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    


}

