//
//  IntroViewController.swift
//  Hackaton
//
//  Created by 황재욱 on 2017. 11. 2..
//  Copyright © 2017년 FC. All rights reserved.
//

import UIKit
import TextFieldEffects


class IntroViewController: UIViewController {
    
    var mainImageView: UIImageView!
    
    var timer = Timer()
    @IBOutlet weak var introLB: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var usernameTextField: KaedeTextField!
    @IBOutlet weak var emailTextField: KaedeTextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(0, forKey: "dCount")
        UserDefaults.standard.set(0, forKey: "iCount")
        UserDefaults.standard.set(0, forKey: "sCount")
        UserDefaults.standard.set(0, forKey: "cCount")
        
        
        
        
        usernameTextField.isHidden = true
        emailTextField.isHidden = true
        introLB.isHidden = true
        startButton.isHidden = true
        
        // 인트로 로고
        
        mainImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        mainImageView.image = #imageLiteral(resourceName: "intro")
        mainImageView.layer.cornerRadius = 6
        mainImageView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        mainImageView.layer.borderWidth = 3
        mainImageView.center.x = view.bounds.width / 2
        mainImageView.center.y = view.bounds.height / 2
        
        
        view.addSubview(mainImageView)
        introAnimation()
        
        
        
       
        
    }
    
    
    // MARK: 인트로 애니메이션
    
    func introAnimation(){
        mainImageView.center.x = -(view.bounds.width / 2)
        
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            self.mainImageView.center.x = (self.view.bounds.width / 2)
        })
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(introGoesUp), userInfo: nil, repeats: false)
        
        
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.8, target: self, selector: #selector(showDetails), userInfo: nil, repeats: false)
        
    }
    
    // 로고 위로 올리기 애니메이션
    
    @IBAction func startBtnPressed(_ sender: CustomButton) {
        
        guard let username = self.usernameTextField.text else {
            sender.shake()
            return presentLoginAlert() }
        guard let email = self.emailTextField.text, email.matchEmail() else {
            sender.shake()
            return presentLoginAlert() }
        
        if username == ""{
            sender.shake()
            presentLoginAlert()
        }
        
        UserDefaults.standard.set(username, forKey: "name")
        UserDefaults.standard.set(email, forKey: "email")
        
        performSegue(withIdentifier: "first", sender: nil)
    }
    
    @objc func introGoesUp(){
        UIView.animate(withDuration: 0.7, animations: {
          self.mainImageView.center.y -= 170
            
        })
    }
    
    @objc func showDetails(){
        UIView.animate(withDuration: 0.7, animations: {
            
            self.usernameTextField.isHidden = false
            self.emailTextField.isHidden = false
            self.introLB.isHidden = false
            self.startButton.isHidden = false
        })
        
    }
    
    func presentLoginAlert(){
        
        let alert = UIAlertController(title: "입력오류", message: "입력된 내용이 없거나 \n 이메일 형식에 어긋납니다", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
        
        
    }
    


}


extension String{
    func matchEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}", options: [])
        
        let matches = regex.matches(in: self, options: [], range: NSRange(location:0,length:characters.count))
        
        return matches.count > 0
    }
}





