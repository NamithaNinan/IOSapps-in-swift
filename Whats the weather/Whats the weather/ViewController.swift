//
//  ViewController.swift
//  Whats the weather
//
//  Created by Namitha Ninan on 8/29/16.
//  Copyright © 2016 namithaninan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var cityTextField: UITextField!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(cityTextField: UITextField!) -> Bool{
        cityTextField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func findWeather(sender: AnyObject) {
        
        var wasSuccessful = false
        let attemptedUrl = NSURL(string: "http://www.weather-forecast.com/locations/" + cityTextField.text!.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest")
        
        if let url = attemptedUrl {
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            
            if let urlContent = data {
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                let webSiteArrray = webContent!.componentsSeparatedByString("3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                
                if(webSiteArrray.count>1){
                    wasSuccessful = true
                    //print(webSiteArrray![1])
                    let weatherArray = webSiteArrray[1].componentsSeparatedByString("</span>")
                    if weatherArray.count>1 {
                        let weatherSummary = weatherArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                        
                        dispatch_async(dispatch_get_main_queue(), {
                        })
                        self.result.text = weatherSummary
                        
                    }
                }
                
                }
            
            if wasSuccessful == false {
                self.result.text = " Could'nt find the weather for that city ! Please try again !"
            }
            }
        
        task.resume()
        }
        
    }
    
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.cityTextField.delegate = self;
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

