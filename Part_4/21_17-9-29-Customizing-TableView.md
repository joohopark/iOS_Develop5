# 17.9.29(금)

---

## UITableView Customizing 하기
 
- UITableView 생성하기 위한 log
	1. UITableView 구조를 알아보자!
		- Section : TableView의 category 를 나누는 역활(?)을 해준다고 생각해보자.
		- Row : Section의 하위 계층입니다. 카테고리 안의 내용(?) 이라고 이해하면 조금 수월 합니다.!
		- Cell : Row 에 채워지는 데이터의 모음 입니다.
	2. Section, Row, Cell 을 사용하기 위해서는 , UITableViewDatasource 와 UITableViewdelegate 를 상속받아야 한다. 이유는 Section, Row, Cell 을 만들기 위해서필요한 프로퍼티와, 함수들이 Datasource 와 delegate 에 들어가 있다. 그것을 사용하기 위해 상속을 받자  

```swift
import UIKit
// UITableViewDataSource, UITableViewDelegate 두개를 상속받음, 각각의 매소드들을 사용하기위해서!
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var viewTablelist:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        appendNumber()
        print(viewTablelist)    
        // 테이블뷰를 사용하기 위해서는 계층구조를 이해해야함.
        //테이블뷰의 전체 section, row, cell 의 구조를 알고 있어야한다.
        // 전체 큰 타이틀은 Section, 그 색션의 각 구역 index 같은 부분을 row 그 row 안에들어가있는 데이터가 cell!
        
        // 1. 테이블뷰 정의
        var vt: UITableView = UITableView()
        // bounds 는, defaults로, 그 기기의 전체 해당의 전체 사이즈를 의미한다
        vt = UITableView(frame: view.bounds, style: .grouped)
        // 테이블뷰를 사용하기위해서는 section, row, cell을 사용해야하는데, 그녀석을 사용하기 위한 함수를 사용하기 위해서는 datasource와, delegate를 상속받아서, 그 안에 있는 프로퍼티, 함수를 사용해야한다. 그러기 위해서 내가 만든 프로퍼티에 datasource, delegate를 인스턴스로 넣어준다.
        vt.dataSource = self
        vt.delegate = self
        
        // cell을 사용하기위해서 기본적으로 identifier 을 해야함.
                  // UITableViewCell class 자체를 등록해서, 그 클레스를 사용하겠다는 의미이다   // 등록이름은 아무거나해도되는데, 통상 클레스 이름을 많이 사용한다.
        //Register 을 할때 인스턴스를 만드는게 아니라, 말그대로 register 에서 클레스를 등록하는 과정에서는 말그대로 내가 이 클레스를 사용할껀데, 이 클레스에다가 identifier를 줘서 사용한다는 의미인데, 이때에는, 인스턴스를 만드는게 아니다. 인스턴스의 생성은, dequeue 과정에서 꺼내올때 인스턴스를 생성하고 만드는는것임. 
        vt.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
        // 테이블 뷰를 뷰에 뿌려준다
        view.addSubview(vt)
    }
    // row는, ViewTablelist의 길이만큼으로 작성함. *** tableView 함수를 사용하기 위해서 dataSource를 사용한다. ***
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewTablelist.count
    }
    // cell 을 어떻게 구성할건지 정의해주는곳!, cell의 재사용을 하기위해서 설계를 해주어야 한다
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // cell을 등록하고, 어떻게 사용할것인지 뿌려줄것인지 정해 주었음
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // cell의 보여지는 부분을 viewTablelist로 할것이기 때문에, textLabel 선택
        cell.textLabel?.text = viewTablelist[indexPath.row]
        print(indexPath, indexPath.row, indexPath.section)
        
        return cell   
    }
    
    // 총 색션을 3개로 구성
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // 값을 어레이에 집에 넣어주는 함수생성
    func appendNumber() {
        for i in 0...29 {
            viewTablelist.append(String(i))
        }
    }
}
```

- 스크롤 뷰의 기본 작동, **색션0~2 까지 스크롤을 내렸을때 모습**

<p align="center">

![screensh](/study/image/tableview.jpg) ![screensh](/study/image/tableview1.jpg) ![screensh](/study/image/tableview2.jpg)

</p>
		
	
---

## UITableView 에 Alert 추가하기! 

위의 구성이 UITableView의 가장 기본적은 구성 모습이다. 조금씩 응용을 해보자, 테이블을 클릭했을때, 알럿이 발생하게 만들어보자, 혹은 다른 화면으로 넘어게 만들어도 재미있을것 같다!

- row를 선택시, Alert 이 발생하게 만들었습니다.!
 
```swift
// 테이블뷰를 선택했을때, 어떤 모션이 발생하게 만들어보자!
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        // 1. UIAlertController 설정
        var popAlert: UIAlertController = UIAlertController(title: "PppooooppP", message: "\(indexPath.section) 색션의, \(indexPath.row) 번째 row가 선택 되었습니다.", preferredStyle: .alert)    
        // 2. UIAlertAction 설정
        let okAlertAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let cancelAlertAction: UIAlertAction = UIAlertAction(title: "cancel", style: .default, handler: nil)
        // 3. 알럿액션을 알럿 컨트롤러에 연결
        popAlert.addAction(okAlertAction)
        popAlert.addAction(cancelAlertAction)    
        
        // 4. 알럿 뿌려주기
        self.present(popAlert, animated: true, completion: nil)
    }
```

<p align="center">

![screensh](/study/image/tableview3.jpg) 

</p>

---

## UITabelView 를 커스터마이징 해보자! 

- 커스터마이징 log -> cell 의 모양을, 이미지로 변경해서, 내가 넣은 이미지를 각 셀에 넣어보자
	1. cell 을 imageView 로 만들고, cell 위에 imageView 를 올리는 workFlow 를 생각하자
	2. 각 이미지들을 imageView 로 만들어주는 class 를 생성하고, 인스턴스를 생성해서, cell 에 던져질때, down 캐스팅을 이용해서 던져주자 ! **이때 주의사항이, 함수에서 던져주는 type 가 상위 클레스 일때, 그 안에 속해 있는 subclass type 들을 던져줄수 있다. 이유는 부모안에 어차피 자식들이 들어있기 때문에, 자식 클레스들이 있다고 인지하고 다른 type을 return type로 던져줄수 있는것임!**
	3. register 새로운 cell 을 등록 해주기, row 범위 설정하기(사용하는 이미지 수만큼의 row 길이를 정하자) 

- 던져지는 type 의 위계계층에 따라서 return 가능 유.무를 한번 확인해보자. 
- UITableView 의 Cell을 customizing 해보자!

```swift
*** cell에 이미지를 넣기 위해 cell 에 던져질 UIImageView 를 만들어보자. ***

// cocoa touch Class 로 만들었다. 
class MyCustomCell: UITableViewCell {
    
    //UI 를 스토리 보드로 만들었을때 이녀석에서부터 시작 함.. -> 일반 viewcontrollor 에서  viewDidLoad 영역..?
    /*override func awakeFromNib() {
     super.awakeFromNib()
     // Initialization code
     } */
    
    // 시작지점은 init
    // required init의 정의는 UITableViewCell 에 필수적으로 만들라고 정의 되어 있음.
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        creatView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    var bgImgView: UIImageView?
    
    // 이미지를 만듬.
    func creatView() {
        bgImgView = UIImageView()
        
        // 옵셔널을 넣어주고 느낌표를 찍는이유는, 이미지가 확실히 들어있다고 내가 알고 잇기 때문에 느낌표를 날려줌!
        self.addSubview(bgImgView!)
        
    }
    
    //우리가 넣으려는 이미지 이름.
    func setImage(name: String) {
        bgImgView?.image = UIImage(named: name)
    }
    
    func updataLayout() {
        bgImgView?.frame = self.bounds
    }
    
    // 새로운 메소드 생성
    override func layoutSubviews() {
        updataLayout()
    }

}
*** register 을 다시 등록해준다.(새로운 cell 을 만들어서 던질것 이기 떄문에!)
vt!.register(MyCustomCell.self, forCellReuseIdentifier: "MyCustomCell")

*** row 의 길이도 재정의 해준다.(사용하는 이미지 갯수 만큼의 길이로) ***
let poketmon: [String] = ["1","2","3","4","5","6","7","8","9"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poketmon.count 
    }
*** cell 을 다시 재정의 한다. ***
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell을 등록하고, 어떻게 사용할것인지 뿌려줄것인지 정해 주었음
        // 이때 MyCustomCell 은 UITableView 의 모든것을 상속받았음. 한마디로 MyCustomCell 은 UITableView의 subClass 가된다. 이때 문제점이 이 함수는 return 값으로, UITableViewCell 을 던짐. 그래서 사실상 cell의 값 자체로 던져져도 괜찮지만, cell이 queue 에서 dequeue 를 하기위해서 설정이 되어야 하는데, 이 method의 타입이 UITableViewCell 이다. 그래서 MycustomCell 로 다운 캐스팅을 해서 사용이 되어져야한다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath) as! MyCustomCell   
        // 셀의 이미지 셋팅은, indexPath.row 의 번호를, poketmon array 의 인덱스 번호로 사용해서, 이미지 셋팅을 해주고 그 값을  뿌려준다!
        // 여기서 궁금한점은 textLebel 을 하지않아도 이미지가 보인다. 우리는 textLebel 처럼 text 값을 cell 에서 보고 싶은게 아니라, ImageView 그 자체를 cell 에 던지는 것이기 때문에, textLeble 명령어는 사용하지 않아도 된다. 
        cell.setImage(name: poketmon[indexPath.row])
        
        // 이미지를 뿌려주는 여러가지 방법이 있음.. 번외변..

        // 1. 이미지 생성        
        iv = UIImageView()
        iv?.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        
        // 이미지를 넣기 위해 어떤 이미지를 넣을지 선택 하는 것.
        iv?.image = UIImage(named: "1")
        view.addSubview(iv!) */
        return cell   
```

- customizing 이 완료된 모습!, tableView의 핵심은 정리인것같다. section 을 어떤 구조로 만들지 설계하고, 그 section 안에 몇개의 row를 넣고, 그 row 각각에 어떤 모습의 cell 을 넣어서 활용할지에 대한 설계가 무궁무진할것 같다.  

<p align="center">

![screensh](/study/image/tableview4.jpg) 

</p>
---


		
  
 
  
  