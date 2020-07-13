//
//  ViewController.swift
//  UpDownGame
//
//  Created by YangMinUk on 10/07/2020.
//  Copyright © 2020 MinUkYang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider : UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
    }

    @IBAction func touchHitButton(_ sender: UIButton) {
        print(slider.value)
    }
}

