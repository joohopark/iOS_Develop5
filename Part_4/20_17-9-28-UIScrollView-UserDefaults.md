# 20_17.9.28(목)

---

## UIScrollView, UserDeFaults
 
---

## UIScrollView

스크롤뷰를 사용할때 주의점이 있는데, 스크롤뷰 속에, 컨텐츠 뷰가 있다. 둘을 명확하게 나누어야 하는데, 스크롤뷰 속에 컨텐츠 뷰가 있는데, 여기서 명확하게 짚고 넘어가야하는게, 스크롤뷰 속에 컨텐츠뷰를 넣고 그 안에 내가 보여주고 싶은 컨텐츠들을 넣어서 표현 해주어야 한다.


```swift
import UIKit
// Delegate 가 있는 녀석들은 Delegata 를 사용할수있음. Delegate를 상속받는다.
class ViewController: UIViewController, UIScrollViewDelegate {
    var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()    
        // 스크롤뷰를 그려보자.
        // 스크롤뷰 생성 -> 주의사항은 전역변수 부분에서는 생성이 되지않음.. 이유는 이때는 인스턴스를 만들기 위해서는 어떤 type가 필요한데, type가 정의되기 이전이다.
        // 스크롤뷰는, 핸드폰 사이즈의 크기로 정햇다.
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        // 스크롤뷰에 있는 컨텐츠뷰 사이즈를 정해보자 -> 가로의 사이즈는 늘리고, 새로의 사이즈는 스크롤뷰와 같은 사이즈로 만들어줬다.
        scrollView.contentSize = CGSize(width: 1000, height: scrollView.frame.size.height)
        // 여러가지 기능들이 있는데
        // 기능-1 : 스크롤을 쭈욱 밀었을때 끝에 벽에 부딛히고 꿀렁 거리는 모션을 사라지게 할수 있다.
        scrollView.bounces = true
        // 기능-2 : 화면을 넘길때 페이징 단위로 넘길수있다. 내가어떤 뷰를 생성하고, 그 뷰의 페이징 단위로 50% 가 넘어가면 다음화면, 50% 미만이면 지금화면유지 되게 할수있음.
        scrollView.isPagingEnabled = false
        // 기능 -3 : 처음에 시작할때 어디서부터 시작해라라는 액션을 줄수 있음
        // offset 전체 스크롤뷰에서, 처음에 어디서 시작을 할지를 정해줌. 컨텐츠 사이즈의, 좌표를 찍어서 그곳으로 가게하는 애니메이션을 줄수있음. 이때 주의할점은 이녀석을 언제 불러오느냐에 따라서 애니메이션이 실행되고, 실행되지 않고가 결정됨, 모든 화면을 다 불러오고 나서 실행할것인지, 화면이 시작전에 실행되서 화면이 딱 눈에 보일때 나타나게 할것인지 고민해주어야하는 시점차이가옴.. viewdidload 말그대로, 모든 뷰들이 로드 되고난 이후니까, 화면이 눈에 보이고 실행되서 애니메이션이 실질적으로 보이지않음.
        //scrollView.setContentOffset(CGPoint(x: 400, y:0), animated: true)
        //scrollView.setContentOffset(CGPoint(x: 400, y:0), animated: true)
        
			// 그라데이션이 다른 뷰를 생성 해보자
        for i in 0...19 {
            let someThingView: UIView = UIView(frame: CGRect(x: (i%10)*100, y: (i/10)*100, width: 100, height: 100))
            someThingView.backgroundColor = UIColor(red: CGFloat(Double(i)*5/255.0), green: CGFloat(Double(i)*5/255.0), blue: CGFloat(Double(i)*5/255.0), alpha: 0.7)
            scrollView.addSubview(someThingView)
        }
        
        // delegate를 사용하기 위해서, delegate에 self 자기자신을 집어넣어줌.
        // -> 아직 delegate에 대한 명확한 이해가 이루어진것은 아니지만, delegate는 UIView가 해야할 일을 UIController가 대신해준다..? 정도로 이해해보자.
        scrollView.delegate = self
        // 스크롤뷰도, view에게 상속받아서 사용하기 때문에, view의 addsubview로 scrollview를 뿌려준다.
        view.addSubview(scrollView)
    }
    
    // delegate를 부른이유는, 이녀석을 사용하기위해서임. 스크롤이 조금 움직일때마다, 이녀석의 바로 호출된다
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //scrollView.contentOfset 까지 CGPoint
        //let offsetX: CGFloat = scrollView.contentOffset.x
        let offSetX: CGFloat = scrollView.contentOffset.x
        let UIColorValue: CGFloat = 1 - (offSetX/scrollView.contentSize.width)
        scrollView.backgroundColor = UIColor(red: UIColorValue, green: 100/255, blue: 100/255, alpha: 1)
    }
} 
```
 
 
- 기본 상태 구현했을때!
   
<p align="center">

![screen](/study/image/UIScroll.jpg)
 
</p>

- offSet과, delegate를 이용해서 구현한모습! 스크롤을 ->>> 움직일때마다, 백그라운드 배경색이 변함.

<p align="center">

![screen](/study/image/offSet.jpg) ![screen](/study/image/offSet-1.jpg)
 
</p>

---

## 응용 

- story board 에 있는 녀석들을 code로 그려주는것을 응용해서 사용할수 있다.

```swift
// UISwitch 사이즈와 위치 정의
        var switcher: UISwitch = UISwitch(frame: CGRect(x: 0, y: 300, width: 100, height: 100))
        // 고민, view에 뿌려줘야 되나? scrollview에 뿌려 줘야되나?
        // view에 뿌려주니까 switch가 작동을 하지않음.. 이유는...view위에 scrollView가 있다고 생각해야겠다.
        var silederr: UISlider = UISlider(frame: CGRect(x: 0, y: 350, width: 500, height: 100))
        var search: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 400, width: 100, height: 100))
        scrollView.addSubview(switcher)
        scrollView.addSubview(silederr)
        scrollView.addSubview(search)
        //어떨때 addTarget 이 가능한지 한번 고민 해봐야겠다.
        switcher.addTarget(self, action: #selector(self.switchAction(_:)), for: .touchUpInside)
        // addTaget을 해서, 각 버튼별로 기능을 정의 해줄수 있음.       
  @objc func switchAction(_ sender: UISwitch) {
        print("switch 실행!")
    }
```

---

## UserDefualts 

사용자의 정보를 저장하는 싱글톤 형식(어떤 요청을 보내면 -> standard 라는 녀석이 요청을 받고, 그 요청을 -> 어떤 테이블 같은곳에 보내줌. 그러면 그 테이블에 정보를 넣거나, 정보를 꺼내올수 있다. 
일종의 슈퍼 전역변수(?)같은 느낌이다. 한번 값을 저장하면, plist 파일에 내부적으로 저장이 되어있다. 
plist 파일을 사용하기 위해서 저장이 가능한 데이터들을 판별해서, 변환해주어서 저장 해주어야 한다 .

```swift
 
open class var standard: UserDefaults { get }
 //데이터 불러오기open func object(forKey defaultName: String) -> Any? open func string(forKey defaultName: String) -> String? open func array(forKey defaultName: String) -> [Any]?
//데이터 저장하기open func set(_ value: Any?, forKey defaultName: String)
//데이터 지우기open func removeObject(forKey defaultName: String)
 
```

 값이 저장되어질때, Any타입으로 저장이 되어 지는데, 이유는 사용자가 어떤 값을 저장할지 모르기 때문에, Any로 저장을 하고, 값을 꺼내올때는 type 다운캐스팅을 통해서 원하는 형태로 바꾸어 주고, 사용해야한다.


```swift

// userDefaults 를 [[String:String]] 형식으로 저장하기 위해서, 타입을 순차적으로 변경시켜주는 모습!
let userData:[String:String] = ["ID":userName, "PW":passWord]
let list:[[String:String]] = [userData]
UserDefaults.standard.set(list, forKey: "userList")

// 위의 형식으로 다운캐스팅해서, [[String:String]] 형태로 바꾸어서 사용함!
guard let checkData:[[String:String]] = UserDefaults.standard.object(forKey: "userList") as? [[String:String]] else {
            return
        }
```

---
