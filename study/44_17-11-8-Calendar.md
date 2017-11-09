# 44_17-11-8

---

## 달력 만들기

---

|--View<br>
|----CollectionView

의 계층 구조로 달력을 만들자!

![screen](/study/image/Calendar.jpg)

위의 View에 CollectionView를 올려서 만들어보자.

---

## CollectionView 생성 

![screen](/study/image/Calendar-1.jpg) <br>

```swift

** MJCalendar 부분

class MJCalendar: UIView {


	private let cellIdentifie = "Cell"


	//초기화 하기위한 init method 3개 생성(각각 용도에 맞게 사용하자)
		override init(frame: CGRect) {
        super.init(frame: frame)
     	   setUpUI()
     	   updateLayout()
        
	    }
    override func awakeFromNib() {
    
        setUpUI()
        updateLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //collectionView의 속성을 closure 로 정의
    private var contentsView: UICollectionView = {
        
        // 컬렉션뷰는 만들기 위해서 Layout을 적용해주어야함.
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: layout)
        // collectionView 속성 추가 기능
        
        collectionView.backgroundColor = .clear
        collectionView.alpha = 1
        return collectionView
    }()
    
    
    // UI관련된것들을 set하기위한 method, CollectionView의 속성들을 정의한 closure에서는, 아직 View의 인스턴스가 생성되기 이전이라서, self, addsubView를 할수 없다.
    private func setUpUI() {
        self.addSubview(contentsView)
        contentsView.delegate = self
        contentsView.dataSource = self
        
        
        contentsView.register(CustomCell.self, forCellWithReuseIdentifier:cellIdentifie)
    }
    
    private func updateLayout() {
        self.contentsView.constraint(targetView: self, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0)
    }


}


// 오토레이아웃 확장
extension UIView {
    
    func constraint(targetView:UIView, topConstant:CGFloat?, bottomConstant:CGFloat?, leftConstant:CGFloat?, rightConstant:CGFloat?) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let constant = topConstant {
            self.topAnchor.constraint(equalTo: targetView.topAnchor, constant: constant).isActive = true
        }
        if let constant = bottomConstant {
            self.bottomAnchor.constraint(equalTo: targetView.bottomAnchor, constant: constant).isActive = true
        }
        if let constant = leftConstant {
            self.leftAnchor.constraint(equalTo: targetView.leftAnchor, constant: constant).isActive = true
        }
        if let constant = rightConstant {
            self.rightAnchor.constraint(equalTo: targetView.rightAnchor, constant: constant).isActive = true
        }
        
    }
    
}


extension MJCalendar: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // 각 색션의 item 개수 정의
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
  return 10        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifie, for: indexPath) as! CustomCell
        
        
        return cell
        
        }   
}

```

--- 

## CustomCell 정의

```swift
class CustomCell: UICollectionViewCell {
    
    // 연산프로퍼티로 사용하면, 외부에서 호출 해야함, closure로 사용하는 이유는 내부에서 사용하기 위해서임.
    var titleLB: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.textColor = UIColor.black
        lb.font = UIFont.boldSystemFont(ofSize: 13)
        return lb
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        updateLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    private func setUpUI() {
        self.addSubview(titleLB)
        
    }
    private func updateLayout() {
        titleLB.constraint(targetView: self, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0)
    }
}

```

---

## Calendar DateModel 

달력 정보를 가져오는데, CollectionView의 section1에는 일,월,화,수....
그리고 month 에 맞추어서 day를 각 cell에 뿌려줍니다. 그러기위해서 조금의 수학 연산이필요합니다

```swift

//
//  MJCalendarDataCenter.swift
//  17-11-8-Calendar
//
//  Created by MIN JUN JU on 2017. 11. 8..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//
import Foundation


enum WeekDay: Int {
    case Sun=0, Mon, Tue, Wed, Thu, Fri, Sat
    
    // WeekDay 의 해당 스트링값을 뱉러내기 위해서..
    var name: String {
        switch self {
        case .Sun:
            return "Sun"
        case .Mon:
            return "Mon"
        case .Tue:
            return "Tue"
        case .Wed:
            return "Wed"
        case .Thu:
            return "Thu"
        case .Fri:
            return "Fri"
        case .Sat:
            return "Sat"
        }
    }
}

struct MJcalendarDataModel {
    
    var year: Int
    var month: Int
    var day: Int
    
    // starWeekOfMonth 가 enum을 받음
    var startWeekOfMonth: WeekDay
    var lastDayOfMonth: Int
    
    init?(date: Date) {
        
        // Calendar 셋팅
        // calendar를 통해서 -> componets에 값을 넣고, year, month 를 가지고 있음
        let calendarIns = Calendar(identifier: .gregorian)
        
        var components = calendarIns.dateComponents([.year, .month, .day], from: date)
        
        year = components.year ?? 0
        month = components.month ?? 0
        
        day = components.day ?? 0
        // 첫째 주 의, 요일을 뽑아오기 위해서 그 달의 첫번째 날ㅇ
        components.day = 1
        
        
        //각 년월의 1일은 date -> 1부터 시작함. 1은 일요일.
        guard let firstDayDate = calendarIns.date(from: components) else { return nil }
        
        // weekday가 요일을 숫자로 바꾸어 준다.
        var weekDayCompo = calendarIns.dateComponents([.weekday], from: firstDayDate)
        startWeekOfMonth = WeekDay.init(rawValue: weekDayCompo.weekday! - 1)!
        
        var addComponets = DateComponents()
        addComponets.month = 1
        addComponets.day = -1
        
        guard let lastDayDate = calendarIns.date(byAdding: addComponets, to: firstDayDate) else { return nil }
        lastDayOfMonth = calendarIns.dateComponents([.day], from: lastDayDate).day ?? 1
        
    }
}


```
> Enum 을 통해서, 요일 타입을 정의하고, `MJcalendarDataModel`을 통해서 각 month 와 day 정보들을 가져옵니다.

---

## DateModel 을 통한 값을 CollectionView에 뿌려줍니다.
























---

|--View
|--CollectionView -> 색션 2개 -> 색션의 아이템은 7개(요일)

각 셀에 Label에 텍스트를 하나씩 주어서 만듬..

데이터 모델링을 할때, 

년도 
몇월
시작날이 무슨요일인지 
마지막날 : 30, 29, 31일...

이녀석들을 가지고, 각 CollectionView에다가 값을 뿌려주는것 같음.

initView-> 컬렉션뷰의 오토레이아웃을 잡아줌..
아이템과 라인 스페이싱은 기본적으로 0, 아이템의 사이즈는, 컬렉션뷰의 witdh와 hight 값이 같게, 만듬..

결국에는 캘린더에 뿌려주는 데이터를 어떻게 뿌려줄것인가에 대한고민, 그것만 해결하면 기능을 넣는것도 그렇게 어렵지 않을것 같다고 생각된다..