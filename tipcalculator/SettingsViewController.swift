//
//  SettingsViewController.swift
//  tipcalculator
//
//  Created by Anne Willborn on 8/19/17.
//  Copyright © 2017 Anne Willborn. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let selectedDefault = defaults.integerForKey("default_percent_index")
        defaultTipControl.selectedSegmentIndex = selectedDefault ?? 1
    }
    
    @IBAction func setDefaultPercent(sender: AnyObject) {
        let defaultPercentIndex = defaultTipControl.selectedSegmentIndex
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(defaultPercentIndex, forKey: "default_percent_index")
        defaults.synchronize()
    }
}
