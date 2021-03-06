# 17.9.26(월)

---

## UI Base, Resolutions, UIView, UILabel
 
- Resolutions <br>
	- Pixel : 실제 이미지 사이즈
	- Point : 화면에 표시되는 사이즈 
  	   
> Pixel 과 Point의 차이는, Pixel 의 이미지를 큰 Point 로 나누어서, 이미지를 넣음.

<p align="center">

![screen](/study/image/pixel.png) 

</p>


- 좌표계(Frame-Base) 
	- View 기준 좌측 상단이 0,0 입니다. y값은 아래로 증가하고, x값은 오른쪽으로 증가한다. <br>
- FrameWork 
	- 응용 프로그램 표준 구조를 구현하는 클래스와 라이브러리의 모임이다. 간단하게 프레임 워크라고도 부릅니다. 

---

## UI Class Hierarchy

![screen](/study/image/UIClassHierarchy.png)


> 사실 우리가 눈에 보이는 UI들은 모두 클레스 이고 인스턴스 이다. 그 인스턴스 녀석들의 계층구조를 알면, 내가 사용하는 버튼, 뷰 등을 어떻게 사용해야하고, 어떤 기능들이 어떤 클레스에 상속되어 있는지 알고 접근 한다면, UIKit 프레임 워크에 대한 이해를 도와줄수 있습니다.

---

## Quick Help

Command + Shift + O(영문 '0') -> xcode 의 alfred 처럼 사용할수 있음(?) <br>
Command + Shift + O(숫자 0) -> documents 형식으로 되어있는것을 사용할수 있음. 

---

## UIView 를 Code 로 만들기. 

```swift
import UIKit
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
          // type 를 찾아가면서, 내가 원하는 값을 찾아나갔다..! 
         let origin:CGPoint = CGPoint(x: 100, y: 100)
         let size:CGSize = CGSize(width: 200, height: 200)
         let rect:CGRect = CGRect(origin: origin, size: size)
         let subView:UIView = UIView(frame: rect)
         subView.backgroundColor = UIColor.red
         view.addSubview(subView)
         
         // view 의 x,y 좌표, width, height 사이즈 정의 
         let rect:CGRect = CGRect(x: 100, y: 100, width: 200, height: 200)
         
         // subView 라는 UiView 객체 생성!
         let subView:UIView = UIView(frame: rect)
         
         // subView 의 backgroundcolor 설정 
         subView.backgroundColor = UIColor.red
         
         // 실제 화면에. view 를 추가해서 뿌려줌.
         view.addSubview(subView)
         
         // UILabel 만들기 -> UILabel 에서 변경할수 있는 속성(?) 들을 코드로서 바꾸어보자.
         let makeLabel: UILabel = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        
        // backgroundColor 설정해줌.
        makeLabel.backgroundColor = UIColor.darkGray
        makeLabel.text = "Label TEXT"
        makeLabel.font = UIFont.systemFont(ofSize: 50)
        view.addSubview(makeLabel)
        
        // UIImage 만들기 
        
        let viewTest: UIImageView = UIImageView()
        viewTest.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        
        viewTest.image = UIImage(named: "a.png")
        
        //viewTest.backgroundColor = UIColor.black
        
        viewTest.contentMode = UIViewContentMode.redraw
        view.addSubview(viewTest)
          
        **Image 를 넣었는데, 객체는 생성이 되는데, 이미지가 들어가지 않는 이슈가 발생했다. 알고 보니까 taget member 의 체크가 해제 되어 있었는데, 이럴때는 이미지가 연동이 되지않는것 같다.**
        // autulayout 작은 아이디어
        
        let halfView:UIView = UIView(frame: CGRect(x: 15, y: 15, width: self.view.bounds.size.width*0.92 ,height: 100))
        
        -> self.view.bounds.size.width = 기기의 x값이 변할때, 총 사이즈값이다! 이값을 가지고 주물주물해서, 원하는값을 만들어 낼수 있다.
        
        halfView.backgroundColor = UIColor.red
        self.view.addSubview(halfView)
        
        let halfView1:UIView = UIView(frame: CGRect(x: 15, y: self.view.bounds.size.height-115, width: self.view.bounds.size.width*0.92 ,height: 100))
        
        halfView1.backgroundColor = UIColor.red
        self.view.addSubview(halfView1)
```

---