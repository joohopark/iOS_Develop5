# 20-1_17.9.28

## Alert

---
 
## Alert

- alert 생성하기 위한 순서!
	1. alert 컨트롤러를 생성한다. 알럿컨트롤러는 UIViewContoller을 상속받아서, 계층 구조를 생각해본다.
	2. alert이 생성 되었을때 액션을 어떻게 줄것인지 결정한다.(알럿의 선택 할수 있는 부분과, 그 선택하는 부분을 선택했을때 취하는 액션)
	3. alert을 내가 연결한 어떤 버튼,이나 액션을 실행했을때 보여지기 위해서 뷰에 뿌려줍니다.
	
	
```swift
**** login button 에 구현했습니다. ****
import UIKit
class ViewController: UIViewController {
    var btn:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()    
        // 버튼 정의 ok
        btn = UIButton(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        //btn?.titleLabel?.text = "버튼 입니다"
        btn?.backgroundColor = UIColor.blue
        //isbeauty.setTitleColor(UIColorFromRGB("F21B3F"), forState: .Normal)
        
        btn?.setTitle("버튼입니다.", for: .normal)
        btn?.setTitleColor(.red, for: .normal)
        btn?.setTitle("버튼입니다.", for: .highlighted)
        btn?.setTitleColor(.white , for: .highlighted)
        
        btn?.addTarget(self, action: #selector(btnAction) , for: .touchUpInside)
        view.addSubview(btn!)
    }
    @objc func btnAction(_ sender: UIButton) {
        // 알럿 설정   
        // 1. 알럿컨트롤러 설정
        let alertControllor: UIAlertController = UIAlertController(title: "알럿 타이틀 입니다.", message: "알럿 메세지 입니다", preferredStyle: .alert)
        
        // 2. 알럿 액션 버튼 설정
        let okActionAlert: UIAlertAction = UIAlertAction(title: "OK Btn", style: .destructive) { (alert) in
            print("ok 버튼을 눌렀다.")
        }
        
        // 2-1. 알럿 액션 버튼 설정
        let cancelActionAlert: UIAlertAction = UIAlertAction(title: "cancel", style: .default) { (alert) in
            print("cancel 버튼을 눌렀다.")
        }
        
        // 3. 알럿 액션을 알럿 컨트롤러에 추가 해줘야함
        alertControllor.addAction(okActionAlert)
        alertControllor.addAction(cancelActionAlert)
       
        // 알럿을 뷰에 뿌려 줘야함. 
        self.present(alertControllor, animated: true, completion: nil)
        print("버튼을 눌렀습니다.")
    }
}
```

- alert 생성 되는것 확인 

<p align="center">

![screensh](/study/image/LoginAlert.jpg) ![screensh](/study/image/LoginAlert-1.jpg)

</p>

- alertAction 정의할때, 정의했던 액션 정의 되는지 확인!

<p align="center">

![screensh](/study/image/LoginAlert-2.jpg)

</p>

> alert 을 조금더 세분화시켜서 사용하면, 재미있는것들을 많이 만들수 있을것 같다는 생각이 든다.
---
