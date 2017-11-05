//
//  SplashViewController.swift
//  MiniHackerton
//
//  Created by 김정원 on 2017. 11. 2..
//  Copyright © 2017년 김정원. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView?
    @IBOutlet weak var topLayout: NSLayoutConstraint?
    
    let SEGUE_TO_MAIN = "segueSplashToMain"
    let SEGUE_TO_FIRST_USE = "segueSplashToFirstUse"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let topLayout = topLayout, let stackView = stackView {
            topLayout.constant = view.bounds.height / 2.0 - stackView.bounds.height / 2.0
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let topLayout = topLayout {
            topLayout.constant = view.bounds.height * 0.08
            
            UIView.animate(withDuration: 1.0, animations: {
                self.view.layoutIfNeeded()
            }, completion: { finished in
                if finished {
                    let segueIdentifier: String = UserDefaults.standard.bool(forKey: "isNotFirst") ? self.SEGUE_TO_MAIN : self.SEGUE_TO_FIRST_USE
                    self.performSegue(withIdentifier: segueIdentifier, sender: self)
                }
            })
        }
    }

}

class LaunchScreenViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView?
    @IBOutlet weak var topLayout: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let topLayout = topLayout, let stackView = stackView {
            topLayout.constant = view.bounds.height / 2.0 - stackView.bounds.height / 2.0
            self.view.layoutIfNeeded()
        }
    }
}
