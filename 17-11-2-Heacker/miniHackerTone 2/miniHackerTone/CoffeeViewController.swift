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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    coffeeView.layer.borderWidth = 1
    coffeeView.layer.borderColor = #colorLiteral(red: 0.8623481393, green: 0.8572215438, blue: 0.8662891984, alpha: 1)
    coffeeView.backgroundColor = #colorLiteral(red: 0.9654366374, green: 0.9596964717, blue: 0.9698489308, alpha: 1)
    coffeeView.layer.cornerRadius = 20
    
    buyBtn.layer.cornerRadius = 15
    
    coffeeText.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
