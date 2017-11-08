

import UIKit

class MJCalendar: UIView{
    
    private let cellIdentifie = "Cell"
    //외부에서 받을 데이터
    
    var year: Int?
    var month: Int?
    
    
    
    var date: Date? {
        willSet{
            calendarData = MJcalendarDataModel(date: newValue!)
            year = calendarData?.year
            month = calendarData?.month
            contentsView.reloadData()
        }
    }
    
    private var calendarData: MJcalendarDataModel?
    
    // 컬렉션뷰는 외부에서 건드릴수 없기때문에, private로 정의
    // 초기화 상태에서 frame을 잡을수 없음. frame의 witdh를 잡아줄수 없음
    // collectionView에 대한 인스턴스를 걍 생성 한다고 생각해야한다, 다른 self로 인해서 사용할수 있는 인스턴스는 안에서 사용할수 없음
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
    
    // Mark : - init
    override func awakeFromNib() {
        setUpUI()
        updateLayout()
        (contentsView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSize(width: contentsView.frame.size.width/7, height: contentsView.bounds.size.height/7)
//        self.addSubview(contentsView)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        updateLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func updateNextMonth() {
        date = MJcalendarMager.nextMonth(with: calendarData!)
    }
    
    func updatePrevious() {
        date = MJcalendarMager.previousMonth(with: calendarData!) 
        
    }
    
    private func setUpUI() {
        self.addSubview(contentsView)
        contentsView.delegate = self
        contentsView.dataSource = self
        
        
        contentsView.register(CustomCell.self, forCellWithReuseIdentifier:cellIdentifie)
    }
    
    //코드로 오토레이아웃 잡기, 단점은 멀티 플라이어가 안됨, 멀티플라이어를 사용하지 않고 오토레이아웃을 잡을대는 좋은 방법임
    private func updateLayout() {
        self.contentsView.constraint(targetView: self, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0)
        
        
//        contentsView.translatesAutoresizingMaskIntoConstraints = false
//
//        contentsView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        contentsView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        contentsView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        contentsView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
//        contentsView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0)
        
    }
    

}

// MARK : extension
extension MJCalendar: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK : - CollectionView Delegate, DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // MARK : NumberOfSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 7
        }else {
            if let calendarData = calendarData {
                return calendarData.lastDayOfMonth + calendarData.startWeekOfMonth.rawValue
            }else {
                return 0
            }
        }
        //return 10
    }
    
    // MARK : Creat Cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifie, for: indexPath) as! CustomCell

        
        cell.titleLB.text = ""
        cell.backgroundColor = .clear
        if indexPath.section == 0 {
            cell.titleLB.text = WeekDay(rawValue: indexPath.row)?.name
            
        }else {
            // 시작 cell의 위치를 잡기위해서 계산해주는식.
            let changedIndex = indexPath.item - calendarData!.startWeekOfMonth.rawValue
            if changedIndex >= 0 {
                let day = changedIndex + 1
                
                cell.titleLB.text = "\(day)"
                cell.titleLB.textColor = .black
                
                /* 선생님 코드 cell.date = calendarDate?newDate(of date) 형식으로 한번 바꾸어보자
 
                    */
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("내가선택한 collectionView의 indexPath는 \(indexPath), \(self.date)")
        let cell = collectionView.cellForItem(at: indexPath) as? CustomCell
        
        cell?.backgroundColor = .red
        
    }
    

    
}

// 오토레이아웃을 extenstion 해서 사용하는방법
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



//Cell 은 awake from XIB 을 할필요가 없음. 이유는 스토리 보드에서 가져오지 않기때문임.
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
//        titleLB.translatesAutoresizingMaskIntoConstraints = false
//        titleLB.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        titleLB.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
//        titleLB.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//        titleLB.bottofmAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
}


//protocol MJCalendarDelegate {
//    func
//}



























































