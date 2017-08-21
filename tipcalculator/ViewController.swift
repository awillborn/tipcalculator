
//
//  ViewController.swift
//  tipcalculator
//
//  Created by Anne Willborn on 8/14/17.
//  Copyright © 2017 Anne Willborn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let selectedDefault = defaults.integerForKey("default_percent_index")
        tipControl.selectedSegmentIndex = selectedDefault ?? 1
        calculateTip(self)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.22]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        totalLabel.text = formatter.stringFromNumber(total)
        tipLabel.text = formatter.stringFromNumber(tip)
    }
   }

