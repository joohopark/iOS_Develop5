// b386e899ce89aef401f50a43e85f547d2cff21a4

import UIKit

class ViewController: UIViewController {
    
    var toggleView: UIView = {
        var v: UIView = UIView()
        v.backgroundColor = .blue
        v.alpha = 0.3
        v.layer.cornerRadius = 50
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var toggleLable: UILabel = {
        var lb: UILabel = UILabel()
        lb.textColor = .white
        lb.font = UIFont.systemFont(ofSize: 25)
        lb.textAlignment = .center
        lb.text = "+"
        return lb
    }()
    
    var stackViewLists: UIStackView = {
        let st: UIStackView = UIStackView()
        st.axis = .horizontal
        st.distribution = .fillEqually
        st.layer.borderColor = UIColor.darkGray.cgColor
        st.layer.borderWidth = 2
        st.layer.cornerRadius = 50
        st.spacing = 30
        st.backgroundColor = .blue
        st.alpha = 0.3
        return st
        
    }()
    
    var btn1: UIButton = {
        var btn: UIButton = UIButton()
        btn.backgroundColor = .red
        btn.layer.cornerRadius = 50
        return btn
    }()
    
    var btn2: UIButton = {
        var btn: UIButton = UIButton()
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 50
        return btn
    }()
    
    var btn3: UIButton = {
        var btn: UIButton = UIButton()
        btn.backgroundColor = UIColor.brown
        btn.layer.cornerRadius = 50
        return btn
    }()
    
    
    var isToggle: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pointX = self.view.frame.size.width - 150
        let pointY = self.view.frame.size.height - 150
        toggleView.frame = CGRect(x: pointX,
                                  y: pointY,
                                  width: 100,
                                  height: 100)
        toggleLable.frame = CGRect(x: 0,
                                   y: 0,
                                   width: toggleView.frame.size.width,
                                   height: toggleView.frame.size.height)
        
        view.addSubview(toggleView)
        toggleView.addSubview(toggleLable)
        
        let gesture = UITapGestureRecognizer(target: self,
                                             action: #selector(buttonTappedForToggleSize))
        toggleView.addGestureRecognizer(gesture)
        let fremaGesture = UITapGestureRecognizer(target: self,
                                                  action: #selector(fremaGestureAction))
        view.addGestureRecognizer(fremaGesture)
    }
    
    
    @objc func buttonTappedForToggleSize(_ sender: UIGestureRecognizer) {
        // gesture Animation 설정
        
        // 버튼이 커질때
        if isToggle == false {
            self.isToggle = true
            toggleLable.removeFromSuperview()
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: 0.3, animations: {
                self.toggleView.frame = CGRect(x: 0,
                                               y: self.view.frame.size.height-150,
                                               width: self.view.frame.size.width,
                                               height: 100)
                self.toggleView.addSubview(self.stackViewLists)
                self.stackViewLists.frame = CGRect(x: 0,
                                                   y: 0,
                                                   width: self.view.frame.size.width,
                                                   height: 100)
                
                self.stackViewLists.addArrangedSubview(self.btn1)
                self.stackViewLists.addArrangedSubview(self.btn2)
                self.stackViewLists.addArrangedSubview(self.btn3)
                
            }, completion: { (complete) in
            })
            
            self.btn1.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
            self.btn2.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
            self.btn3.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
            
            
            // 버튼이 커지고 난 이후에 터치 할때
        }else {
            self.isToggle = false
            UIView.animate(withDuration: 0.3, animations: {
                let pointX = self.view.frame.size.width - 150
                let pointY = self.view.frame.size.height - 150
                self.toggleView.frame = CGRect(x: pointX,
                                               y: pointY,
                                               width: 100,
                                               height: 100)
                
            }, completion: nil)
            self.toggleView.addSubview(self.toggleLable)
            self.stackViewLists.removeFromSuperview()
            
            
        }
    }
    
    @objc func btnAction(_ sender: UIButton) {
        print("버튼 연결완료")
    }
    
    @objc func fremaGestureAction(_ sender: UIGestureRecognizer) {
        if isToggle {
            self.isToggle = false
            UIView.animate(withDuration: 0.35, animations: {
                let pointX = self.view.frame.size.width - 150
                let pointY = self.view.frame.size.height - 150
                self.toggleView.frame = CGRect(x: pointX,
                                               y: pointY,
                                               width: 100,
                                               height: 100)
                
            }, completion: nil)
            self.toggleView.addSubview(self.toggleLable)
            self.stackViewLists.removeFromSuperview()
        }
    }
    
    
    
}

