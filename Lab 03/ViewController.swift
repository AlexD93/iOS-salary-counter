//
//  ViewController.swift
//  Lab 03
//
//  Created by Student on 2017-02-09.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var money : Int = 28000
    var timer = Timer()
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var costSlider: UISlider!
    
    @IBOutlet weak var m_costLabel: UILabel!
    
    @IBAction func slider(_ sender: UISlider) {
        
        m_costLabel.text = String(Int(costSlider.value))
        
        money = Int(costSlider.value)
        
        defaults.set(money, forKey: "costSlider")
        
    }
    
    // called every time interval from the timer(see selector parameter)
    func timerAction() {
        money += 1
        costSlider.value += 1
        m_costLabel.text = String(Int(money))

        defaults.set(money, forKey: "costSlider")
        print(costSlider.value)
        
    }
    
    //set up a timer
    func setUpTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    //start button
    @IBAction func startTimer(_ sender: UIButton) {
        
        timer.invalidate()
        setUpTimer()
        print(costSlider.value)
        
    }

    //stop button
    @IBAction func stopTimer(_ sender: Any) {
        
        timer.invalidate()
        print(costSlider.value)
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        money = defaults.integer(forKey: "costSlider")
        
        if (money == 0){
                money = 28000
        }
        
        m_costLabel.text = money.description
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
