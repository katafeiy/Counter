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
    
    @IBOutlet weak var counterValue: UILabel!
    @IBOutlet weak var changeValue: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterValue.text = ("\(counter)")
        changeValue.text = ("История изменений:\n")
        changeValue.isEditable = false
        
    }
    
    @IBAction func counterPlus(_ sender: Any) {
        counter += 1
        changeValue.text += ("[\(date)]: значение изменено на +1\n")
        print("\(date) Значение счетчика: \(counter)")
    }
    
    @IBAction func counterMinus(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            changeValue.text += ("[\(date)]: значение изменено на -1\n")
            print("\(date) Значение счетчика: \(counter)")
        } else {
            changeValue.text += ("[\(date)]: попытка уменшить значение счетчика ниже 0\n")
            print("\(date) Попытка уменшить значение счетчика ниже 0")
        }
        
    }
    
    @IBAction func counterClean(_ sender: Any) {
        counter = 0
        changeValue.text += ("[\(date)]: значение сброшено\n")
        print("\(date) Значение сброшено")
    }
    
    @IBAction func consoleClean(_ sender: Any) {
        changeValue.text = ("История изменений:\n")
    }
    
    private func updateCounterValve(){
        counterValue.text = ("\(counter)")
    }
}

