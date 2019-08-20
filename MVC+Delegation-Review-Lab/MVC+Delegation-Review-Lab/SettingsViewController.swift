//
//  SettingsViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Alexander George Legaspi on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var delegate: ChangeFontSize?
    
    @IBOutlet weak var settingsHeader: UILabel!
    @IBOutlet weak var settingsSlider: UISlider!
    @IBOutlet weak var settingsStepper: UIStepper!
    @IBOutlet weak var fontPreview: UILabel!

    @IBAction func slidingFontSize(_ sender: UISlider) {
    
        let fontsize = String(sender.value.rounded())
        fontPreview.text = "Current Font Size: \(fontsize)"
        
        delegate?.getFontSize(value: CGFloat(sender.value))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

}
