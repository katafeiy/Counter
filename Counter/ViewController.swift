//
//  ViewController.swift
//  Counter
//
//  Created by Константин Филиппов on 24.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var counter: Int = 0 {
        didSet {
            updateCounterValve()
        }
    }
    var date: String {return DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .medium)}
    
    @IBOutlet weak var counterValve: UILabel!
    @IBOutlet weak var changeValve: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterValve.text = ("\(counter)")
        changeValve.text = ("История изменений:\n")
        changeValve.isEditable = false
        
    }
    
    @IBAction func counterPlus(_ sender: Any) {
        counter += 1
        changeValve.text += ("[\(date)]: значение изменено на +1\n")
        print("\(date) Значение счетчика: \(counter)")
    }

    @IBAction func counterMinus(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            changeValve.text += ("[\(date)]: значение изменено на -1\n")
            print("\(date) Значение счетчика: \(counter)")
        } else {
            changeValve.text += ("[\(date)]: попытка уменшить значение счетчика ниже 0\n")
            print("\(date) Попытка уменшить значение счетчика ниже 0")
        }
        
    }
    
    @IBAction func counterClean(_ sender: Any) {
        counter = 0
        changeValve.text += ("[\(date)]: значение сброшено\n")
        print("\(date) Значение сброшено")
    }
    
    @IBAction func consolClean(_ sender: Any) {
        changeValve.text = ("История изменений:\n")
    }
    
    private func updateCounterValve(){
        counterValve.text = ("\(counter)")
    }
        
}

