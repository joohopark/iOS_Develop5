//
//  ViewController.swift
//  17-11-20-Autolayout-hugging
//
//  Created by MIN JUN JU on 2017. 11. 20..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let subView: UIView = {
    let v: UIView = UIView()
    v.backgroundColor = .red
    return v
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(subView)
    
    // Autolayout을 코드로 작성하게된다면 이것을 꼭 작성해주어야함.
    subView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint(item: <#T##Any#>,
                       attribute: <#T##NSLayoutAttribute#>,
                       relatedBy: <#T##NSLayoutRelation#>,
                       toItem: <#T##Any?#>,
                       attribute: <#T##NSLayoutAttribute#>,
                       multiplier: <#T##CGFloat#>,
                       constant: <#T##CGFloat#>)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

