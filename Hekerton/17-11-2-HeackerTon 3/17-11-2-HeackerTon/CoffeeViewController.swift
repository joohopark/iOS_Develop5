//
//  CoffeeViewController.swift
//  miniHackerTone
//
//  Created by okkoung on 2017. 11. 2..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class CoffeeViewController: UIViewController {
  
    @IBOutlet weak var coffeeView: UIView!
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var coffeeText: UILabel!
    
    
    @IBOutlet weak var inputMoney: UITextField!
    
    var resultText = ""
    var typeText = ""
    var inputName = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    coffeeView.layer.borderWidth = 1
    coffeeView.layer.borderColor = #colorLiteral(red: 0.8623481393, green: 0.8572215438, blue: 0.8662891984, alpha: 1)
    coffeeView.backgroundColor = #colorLiteral(red: 0.9654366374, green: 0.9596964717, blue: 0.9698489308, alpha: 1)
    coffeeView.layer.cornerRadius = 20
    
    buyBtn.layer.cornerRadius = 15
    
    
    
    coffeeText.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
  }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var nextVC = segue.destination as? ResultViewController
        
        // 다음 ViewController 넘어갈때 값을 넘겨주자
        nextVC?.resultText = self.resultText
        //        resultTextView.text = self.resultValue
        nextVC?.typeText = self.typeText
        nextVC?.inputName = self.inputName
        
        print("nextVC")
        
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if (inputMoney.text?.isEmpty)! {
            return false
        }else {
            return true
        }
        
        
        
        return false
    }

    
    

    

}
