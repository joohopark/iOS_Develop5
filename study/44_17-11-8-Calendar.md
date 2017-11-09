# 44_17-11-8

---

## 달력 만들기

---

![screen](/study/image/Calendar-2.jpg)

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

```swift

class MJCalendar: UIView {

	  var year: Int?
    var month: Int?
    
    //Date 값을 옵져빙으로 가져옴
    // ViewController 에서 date 에 Date() 값을 넣으면, date의 변한값으로 year,month, 값을 넣어주고 contentsView를 reload후, 데이터를 뿌려줍니다.
    var date: Date? {
        willSet{
            calendarData = MJcalendarDataModel(date: newValue!)
            year = calendarData?.year
            month = calendarData?.month
            contentsView.reloadData()
        }
    }
    
    private var calendarData: MJcalendarDataModel?
}

```
---

## Cell, itemSize 를 정의합니다.

```swift

extension MJCalendar: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // 각 색션의 item 개수 정의
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 7
        }else {
            if let calendarData = calendarData {
                // 2번째 색션의 총 cell의 개수는, 첫 날짜개수 + 마지막 달의 개수
                return calendarData.lastDayOfMonth + calendarData.startWeekOfMonth.rawValue
            }else {
                return 0
            }
        }
       
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifie, for: indexPath) as! CustomCell
        
        
        if indexPath.section == 0 {
            //WeekDay의 rawValue 이용했음.
            cell.titleLB.text = WeekDay(rawValue: indexPath.row)?.name
            
        }else {
            // 시작 cell의 위치를 잡기위해서 계산해주는식.
            // 각달의 1일의 요일을 숫자로 변경한후, 그값을 indexPath.item에서 빼주게되었을때 '0' 이 되는 곳을 시작점으로 줄수있다.
            let changedIndex = indexPath.item - calendarData!.startWeekOfMonth.rawValue
            if changedIndex >= 0 {
                let day = changedIndex + 1
                
                cell.titleLB.text = "\(day)"
                cell.titleLB.textColor = .black
            }
        }
        return cell
    }
    // MARK: Modified Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: collectionView.bounds.size.width/7, height: collectionView.bounds.size.height/6)
        }else {
            return CGSize(width: collectionView.bounds.size.width/7, height: collectionView.frame.size.height/6)
        }
    }
    
    // lineSpaceing 을 0으로
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}


```

> 주의 사항으로는 CollectionView는 기본적으로, item, lineSpacing 이 10 정도 먹여져(?) 있습니다. 그래서 CollectionView의 Cell size를 생각할때, item, lineSpacing을 함께 고려해서 생각 해주어야 합니다.
> 
> 기본적으로, 첫번째 View에 달력을 뿌려주기가 완성됬습니다. 이제 기본적은 달력을 가져왔으니, 다음달, 전 달을 load 하는것을 만들어봅니다..!


---

## 확장

![screen](/study/image/Calendar-3.gif)

ViewController 에서 Next, Previous 버튼을 누르게 되면

|--ViewController <br>
|----MJCalendar.updatePrevious() <br>
|------MJcalendarMager.previousMonth(with: MJcalendarDataModel!) <br>

계층 구조로 데이터를 부르고 CollectionView를 `reload()` 합니다.

```swift

** ViewController 부분 
@IBAction func previousAction(_ sender: UIButton) {
        mjcalendear.updatePrevious()
        if let monthText = mjcalendear.month {
            monthLB.text = "\(monthText) 월"
        }
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
        mjcalendear.updateNextMonth()
        if let monthText = mjcalendear.month {
            monthLB.text = "\(monthText) 월"
        }
        
        
    }

** MJCalendar(UIVIew) 부분

func updateNextMonth() {
        date = MJcalendarMager.nextMonth(with: calendarData!)
    }
    
    func updatePrevious() {
        date = MJcalendarMager.previousMonth(with: calendarData!)
        
    }
    
** MJcalendarMager 부분 

class MJcalendarMager {
    
    class func nextMonth(with dateModel: MJcalendarDataModel) -> Date {
        
        let calendarIns = Calendar(identifier: .gregorian)
        
        var newComponets = DateComponents()
        newComponets.year = dateModel.year
        newComponets.month = dateModel.month + 1
        newComponets.day = dateModel.day
        
        if let nextDate = calendarIns.date(from: newComponets) {
            return nextDate
        }else {
            return Date()
        }
    }
    
    class func previousMonth(with nowDate: MJcalendarDataModel) -> Date? {
        print(nowDate)
        
        let calendarIns = Calendar(identifier: .gregorian)
        
        var newComponets = DateComponents()
        
        newComponets.year = nowDate.year
        newComponets.month = nowDate.month - 1
        newComponets.day = nowDate.day
        print(newComponets.year, newComponets.month, newComponets.day)
        
        if let nextDate = calendarIns.date(from: newComponets) {
            return nextDate
        }else {
            return Date()
        }
        
        
    }
    
    
    
}

```

> 확장 & 고려 해야하는 부분은, 각 cell을 선택하고 어떤 Action을 주어야 할때, Cell 이 재사용 되는것을 어떻게 해결할것인지에 대한 문제랑, 다른 month 를 갔다가, 다시 돌아왔을때, 내가 표시해둔 어떤 정보를 그대로 가져오는 방법에 대해서 고민 해야할것 같습니다. 
> 




---
