# 32_17-10-20

---

## TableView

---

## Cell Reusable 

IOS 의 TableView의 강력한 장점중의 하나인 `재사용` 조금 을 이해하기가 조금 까다롭다. 아래의 예제를 통해서 cell 재사용에 대해서 생각해보자.

| * | * | 
| :------------ | -----------: | 
| ![screen](/study/image/TablewViewReusable.jpg) | ![screen](/study/image/TablewViewReusable-1.jpg)          | 



```swift

하나의 cell을 만들고, 그 셀에 switch를 넣고, cell이 어떻게 재사용되는지 살펴 보았다.

문제점 1. 아무 설정도 해놓지 않고 사용하면, 0번 row에서 switcher를 false만들면, 다음 화면으로 스크롤 될때, 0번의 switcher의 false 가 그대로 따라가게 된다. 

 -> 사실 엄밀하게는, 각각 row의 switcher 값을 지정 시켜놓고, switcher의 isOn 값이 변할때 마다, 지정해놓은 부분을 변경 하는 식인데, cell의 재사용을 이해하지 못하면 절대 해결할수 없는 문제가 생기게 된다.
 
 
 - ViewController 부분
    -> 테이블뷰의 형태는 스토리보드로 그려주고 연결만 시켜서 사용하였따.



 import UIKit

class ViewController: UIViewController, UITableViewDataSource, SwitchTableViewCellDelegate {
    
    
    var tv: UITableView?
    
    
    
    //switcher가 각 row마다 참조할 값
    var cellCount = [true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tv = UITableView()
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        cell.textLabel?.text = "\(indexPath.row)"
        cell.delegate = self


        cell.sw.isOn = cellCount[indexPath.row]
        
        //cell에서 indexPath의 값을 가져와서, switcher가 변했을때의 row값을 알기 위해서 정의 해준다.
        cell.idx = indexPath
        
       
       
        return cell
    }
    
    func switchTableViewCell(cell: CustomCell, didChangedSwitch value: Bool) {
    
    		// 사실 delegate를 사용하지 않아도, CustomCell Class에서 switcher가 변화할때 변화하는 switcher.isOn값을 가져오려고 했는데, 값이 생각처럼 넘어오지 않았다. 그래서 Delegate를 사용해서 switcher.isOn 값만 넘겨주고, 그 넘겨준 값을 row값에 넣고, cell 을 계속해서 반환시켜 주면서 사용을 하였다.
    		
        cellCount[cell.idx![1]] = value
        
    }
    
    
    
 
 - CustomCell 부분
import UIKit

class CustomCell: UITableViewCell, SwitchTableViewCellDelegate  {
    
    
    func switchTableViewCell(cell: CustomCell, didChangedSwitch value: Bool) {
        
    }
    
    // delegate 변수 정의 
    var delegate: SwitchTableViewCellDelegate?
    
    
    //switcher가 변화했을때 값을 추적하기 위해서 생성.
    @IBAction func swAction(_ sender: UISwitch) {
        switchData = sender.isOn
        
        delegate?.switchTableViewCell(cell: self, didChangedSwitch: sender.isOn)

     //   print(switchData)
    }
    
    @IBOutlet weak var sw: UISwitch!
    
    
    var idx: IndexPath?
    
    // switcher가 변화한값을 옵져빙변수로 넘겨주었음..!
    var switchData: Bool = true{
        willSet {
            self.sw.isOn = newValue
            
        }
        
    }
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}


// Delegate 생성하기 위해서 protocol 생성 
protocol SwitchTableViewCellDelegate {
    func switchTableViewCell(cell: CustomCell, didChangedSwitch value:Bool)
}



}






```

---

## TableView 

**show**, : navi -> show -> push 
				  viewController -> 강제로 모달리 시키는것임.
				  
				  **show, modal**의 차이를 알아놓고 정리하자.
				  
				  
**modalry**, 를 하는 이유가 show 는 쌓이는것이고, modalry 는 현재 stack밖으로 벗어난다고 생각하자..

---























---

## 해야 하는것



1. singlerton 사용해서, 인풋텍스트값을 Plist에 저장해서, 다시 load할때 Plist를 생성하고 불러온다. 

2. 테이블뷰 여러가지 형식으로 만들어서 오자(숙제!)

- Delegate 다시 한번 만들어보기
- tableView 모두 뜯어보기, Singleton 사용해서 만들기 


**Delegate를 사용했을때 값이 넘어가는 이유 다시 정리, Delegate를 사용하지 않고 옵져빙만 사용했을때 값이 넘어가지 않았던 이유 고민하고 정리하기**

---

## 10-20 필기

- 테이블뷰의 각셀의 정보를 sender 로 받았을때 다음 뷰컨트롤러로 넘어갈때, sender의 정보를 다음 viewContoller로 넘기는 방법 다시한번 정리하자..!





---

UI 를 돌려서 cell 이 재사용된다고 생각하지 말고, data 자체를 던져주면서, 총 16개의 버튼이 있을때, 1번 버튼의 값이 false가 될때, 그 다음 재사용 될 cell의 값을 변경 해주게 되면, 지속적으로 사용할수 있다.

---

## 테이블뷰 해더뷰 만들기.


---

## Reference 

