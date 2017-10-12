//
//  ViewController.swift
//  UIimage
//
//  Created by MIN JUN JU on 2017. 9. 25..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*let viewTest: UIImageView = UIImageView()
        viewTest.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        
        viewTest.image = UIImage(named: "vending_machine.png")
        self.view.addSubview(viewTest)*/
        
        let viewTest: UIImageView = UIImageView()
        viewTest.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        
        viewTest.image = UIImage(named: "a.png")
        
        //viewTest.backgroundColor = UIColor.black
        
        viewTest.contentMode = UIViewContentMode.redraw
        view.addSubview(viewTest)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

