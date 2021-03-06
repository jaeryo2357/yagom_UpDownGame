//
//  ViewController.swift
//  UpDownGame
//
//  Created by YangMinUk on 10/07/2020.
//  Copyright © 2020 MinUkYang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var randomValue: Int = 0
    var tryCount: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximunValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
        reset()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
        let integerValue = Int(sender.value)
        sliderValueLabel.text = String(integerValue)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            self.reset()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func touchHitButton(_ sender: UIButton) {
        print(slider.value)
        let hitValue = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount = tryCount + 1
        tryCountLabel.text = "\(tryCount) / 5"
        
        if randomValue == hitValue {
            print("You Hit!!")
            showAlert(message: "You Hit!!")
        } else if tryCount >= 5 {
            print("You lose..")
            showAlert(message: "You lose..")
        } else if (randomValue > hitValue) {
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(hitValue)
        } else if (randomValue < hitValue) {
            slider.maximumValue = Float(hitValue)
            maximunValueLabel.text = String(hitValue)
        }
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("touch up reset button")
        reset()
    }
    
    func reset() {
        print("reset!")
        randomValue = Int.random(in: 0...30) //폐쇄 범위 연산자 A...B  A,B 모두 포함
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minimumValueLabel.text = "0"
        maximunValueLabel.text = "30"
        sliderValueLabel.text = "15"
    }

}

