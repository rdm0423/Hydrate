//
//  ViewController.swift
//  WaterLossCalulatorSwift
//
//  Created by Ross McIlwaine on 5/6/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var preWeightTextField: UITextField!
    @IBOutlet weak var postWeightTextField: UITextField!
    @IBOutlet weak var fluidConsumptionTextField: UITextField!
    @IBOutlet weak var exerciseDurationTextField: UITextField!
    @IBOutlet weak var waterLossResultLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let firstLaunch = NSUserDefaults.standardUserDefaults().boolForKey("FirstLaunch")
//        if firstLaunch  {
//            
//            print("Not first launch.")
//        }
//        else {
//            print("First launch, setting NSUserDefault.")
//            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "FirstLaunch")
//        }
        
        view.backgroundColor = UIColor(hue:0.0, saturation:0.0, brightness:0.91, alpha:1)
        navigationController?.navigationBar.barTintColor = UIColor(hue:204.0/360, saturation:0.78, brightness:0.66, alpha:1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
         self.addDoneButtonOnKeyboard()
    }
    
    @IBAction func calculateButtonPressed(sender: AnyObject) {
        
        if preWeightTextField.text == "" || postWeightTextField.text == "" || fluidConsumptionTextField.text == "" || exerciseDurationTextField.text == "" {
            
            let alert = UIAlertController(title: "Error", message: "Please Enter a Value for Each Field", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                
                self.dismissViewControllerAnimated(true, completion: nil)
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            
            self.waterLossCalc()
        }
    }
    
    func waterLossCalc() {
        let preWeight:Int? = Int(self.preWeightTextField.text!)
        let postWeight:Int? = Int(self.postWeightTextField.text!)
        let fluid:Int? = Int(self.fluidConsumptionTextField.text!)
        let duration:Int? = Int(self.exerciseDurationTextField.text!)
        
        let weightChangeCalc = preWeight! - postWeight!
        let weightChangeWithFluid = weightChangeCalc + fluid!
        let weightFluidDuration = weightChangeWithFluid / duration!
        
        self.waterLossResultLabel.text = "Water Loss is: \(weightFluidDuration) oz"
    }
    
    @IBAction func clearAll(sender: AnyObject) {
        preWeightTextField.text = ""
        postWeightTextField.text = ""
        fluidConsumptionTextField.text = ""
        exerciseDurationTextField.text = ""
        waterLossResultLabel.text = "water loss value"
    }
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 50))
        doneToolbar.barStyle = UIBarStyle.BlackTranslucent
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: Selector("doneButtonAction"))
        
        var items = [AnyObject]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items as? [UIBarButtonItem]
        doneToolbar.sizeToFit()
        
        self.preWeightTextField.inputAccessoryView = doneToolbar
        self.postWeightTextField.inputAccessoryView = doneToolbar
        self.fluidConsumptionTextField.inputAccessoryView = doneToolbar
        self.exerciseDurationTextField.inputAccessoryView = doneToolbar
    }
    
    func doneButtonAction() {
        self.preWeightTextField.resignFirstResponder()
        self.postWeightTextField.resignFirstResponder()
        self.fluidConsumptionTextField.resignFirstResponder()
        self.exerciseDurationTextField.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

