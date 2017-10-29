# 38_17-10-27

---

## CollectionView 가지고 놀기, UICollectionViewFlowLayout 사용하기

- 셀을 추가 & 삭제(다중선택 삭제) 가능하게 만들어보자.

#### 기본 인터페이스

<p align="center">

![screen](/study/image/playCollectionView.jpg)

</p>

> 네비게이션 컨트롤러를 이용해서, 추가, 삭제 버튼을 만들고, 버튼의 기능을 추가해서 원하는 기능을 넣을 생각입니다.
> 

#### - cell 추가

```swift

** 방법 1

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var CV: UICollectionView!
    var sectionCount: [String] = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
@IBAction func addBtnAction(_ sender: UIButton) {
        
        //방법 1
        sectionCount.append("h")
        CV.reloadData()
        
     }
}
->  sectinCount 에 데이터를 업로드하고, CollectionView의 데이터를 reload 했습니다.



** 방법 2 

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var CV: UICollectionView!
    var sectionCount: [String] = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
@IBAction func addBtnAction(_ sender: UIButton) {
        
        CV.performBatchUpdates({
            let indexPath = IndexPath(item: sectionCount.count, section: 0)
            sectionCount.append("h")
            
            // 어느위치에 넣고 업로드 할지 결정할수 있습니다.
            //sectionCount.insert("h", at: 3)
            
            // performBatchUpdates method 블럭안에서 collectionView안에 새로운 값을 넣어주는 작업을 하는것임..
            CV.insertItems(at: [indexPath])
            CV.reloadData()

        }, completion: nil)
        
     }
}



```

`performBatchUpdates` : 매소드는, 여러개의 에니메이션 처리가 아니라, 하나의 에니메이션 처리를 할떄 사용하면 좋습니다. 어떤 일괄처리를 하기위한(삭제, 추가) 작업을 하기위해서 하나의 block 코드로 사용됩니다. 


#### - cell 삭제 

| 선택 | 재선택 |
| :---: | :---: |
|![screen](/study/image/playCollectionView-1.jpg) |![screen](/study/image/playCollectionView-2.jpg) | 


```swift

** 셀 선택시 불려지는 함수

func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.allowsMultipleSelection = true
        let cell = collectionView.cellForItem(at: indexPath) as? CustomCell
        
        cell?.layer.borderColor = UIColor.purple.cgColor
        cell?.layer.borderWidth = 5
        tempDelete.append(indexPath)
        
        
        
    }
    
        
** 셀 제선택시 불려지는 함수


func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.allowsMultipleSelection = true
        
        let cell = collectionView.cellForItem(at: indexPath) as? CustomCell
        //cell?.LB.textColor = .black
        cell?.layer.borderColor = UIColor.clear.cgColor
    
    }



** 삭제시 실행되는 함수
    
-> 선택시 border 값을 변경하여 구분할수 할수 있게 만들었다


    @IBAction func deleteBtnAction(_ sender: UIButton) {

        tempDelete.sort { (x, y) -> Bool in
            
            return x.item > y.item
        }
        
        print(tempDelete)
        
        
        // 지우는 방법
        
        
        for i in tempDelete {

            print(i.item)

            
            let cell = CV.cellForItem(at: i) as? CustomCell
            let removedata = i.item
            
            sectionCount.remove(at: removedata)
            cell?.layer.borderColor = UIColor.clear.cgColor
            CV.deleteItems(at: [i])
        }
        
        CV.reloadData()
        tempDelete = []

       
    }
    
    

}

```

> cell을 선택할때, tempDelete에 선택된 IndexPath값이 들어가고, 그 값을 통해서, 값을 지워주는데, 이때 문제가 생기는게, 지워주는 순서에 따라서, CollectionView의 Cell 에 들어있는 데이터의 순서와, cell에 뿌려지는 데이터의 순서간의 차이가 생기게 된다.
> 
> 그래서 삭제하기 전에, 그 순서를 마추어 주기위해서, sort를 내림차순(10->9->8->) 으로 만들어주고 Cell에 뿌려지는 데이터를 삭제하게되면, index가 맞지않아서 실행되지 않는 오류를 방지 할수 있습니다.
> 
> 추가, 삭제시 선택 되어진 cell의 border 값을 변경 해주어야합니다. 그렇지 않으면, 삭제 되어질때 border 값이 먹여져있는것이 있다면, 새롭게 cell이 추가될때 이전의 border 값이 먹여진 채로 재생성됩니다. 
> 
> 그래서 cell 삭제시, 해당 cell의 먹여진 옵션값들을 초기화 시켜줍니다.




---


## UICollectionViewFlowLayout <br>


<center>

![screen](/study/video-gif/UICollectionViewFlowLayout-1.gif)

</center>

> 각 cell의 Layout 위치에 따라서 비율로 Scale 을 변화 시켜 주었습니다.


#### - 만들어지는 과정


```swift


** UICollectionViewFlowLayout 을 상속받은 class 생성 

class CoverFlowLayout : UICollectionViewFlowLayout {

	// 아이템의 scale 값을 1~1.5 배 만큼 주기위해서 고정값 설정
	// 아이템의 Alpha 값을 0~0.9999... 값의 범위까지 주기위해서, 고정값을 주었습니다.
	let itemScale:CGFloat = 0.5
	let itemAlpha:CGFloat = 0.5
    
    override func awakeFromNib() {
    		
    		//변화되는 값을, CollectionView의 Contents의 Witdh 값 + LineSpacing 값을 주고, 값 범위 안에 들어오면, CollectionView의 Contens의 Witdh, height 값을, Center 기준으로 Scale 을 서서히 1.5배율로 늘려줍니다.
        self.minimumLineSpacing = 25.0
        
    }
    
    
    
    // layoutAtrributesforelements각각 들을 가져온다
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        guard  let attributes = super.layoutAttributesForElements(in: rect) else {return nil}
        
        // 변경할 내용을 담아놓을 temp 같은 저장소?
        var layoutAttribute:[UICollectionViewLayoutAttributes] = []
        
        // 현재 layout의Attributes 값을 가져오고 -> 그 값을 변경 시킨후, 새롭게 [UICollectionViewLayoutAttributes] 를 만들어서 반환 시켜 줍니다. 
        
        for item in attributes {
            
            changeLayoutAttribute(attribute: item)
            layoutAttribute.append(item)
        }
        
        return layoutAttribute
    }
    
    func changeLayoutAttribute(attribute:UICollectionViewLayoutAttributes)
    {
        
        // FlowLayout의 width 사이즈,
        // 변경 가능한 최대거리
        // ContentsView의 witdh 값, + 고정 Spacing 값 -> 아이템간의 거리를 정의 해놓은것 같음.
        
        //변경가능한 최대 거리(조정가능)
        let maxDistance = self.itemSize.width + self.minimumLineSpacing
        
        //실제 거리과 최대거리중 작은거리를 선택!
        let choiceDistance = min(distance(ofCenter: attribute.center.x), maxDistance)
        
        // 비율 계산
        // maxDistance 와, choiceDistance의 값이 같아지면 0 반환
        // 1을 반환하지는 않지만, 1의 근사치의 값으로 올라간다
        // choiceDistance가 maxDistance의 근사치에 다가가기는 하지만, maxDistance보다 커지지는 않는다.
        
        let ratio = (maxDistance - choiceDistance) / maxDistance
        
        
        
        let scale = ratio * (1 - self.itemScale) + 1.0
        let alpha = ratio * (1 - self.itemAlpha) + self.itemAlpha;
        
        
        //attribute의 모습을 바꾸는 함수
        
        attribute.alpha = alpha;
        attribute.transform3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1);
        
        // z값의 범위는 0~9.999 까지 입니다. 
        attribute.zIndex = NSInteger(alpha * 10.0)
  
    }
    
    
    // offSet 값을 구합니다.
    func distance(ofCenter centerx:CGFloat) -> CGFloat {
        
        guard let collectionView = self.collectionView else {
            return 0
        }
        
        // 현재 아이템의 offsetX + 센터
        // 두값의 차의 최소값은 0이구나..
        let offSet = collectionView.contentOffset.x + (collectionView.bounds.size.width/2)
        return  fabs(offSet - centerx)
    }
    
    
    // layout의 값이 변할때 새롭게 변한 값을 사용하겠다는 method 입니다.
    // 아래의 method를 사용하지 않으면, 변하는 값이 실시간으로 적용되지 않습니다. 
    // Layout을 커스텀하게 만들때, 아래의 method를 모르면 로직을 올바르게 짜도 적용이 안되서 엄청난 삽질을 할수 있게 만드는.... 
    
    // cell 을 재사용해서 사용한다는게, cell이 재사용되고, 현재 View에 뿌려지는 데이터들도 변경된 값을 사용해야 하는데, 그 시점차이를 명확하게 인지 하고 있어야 할것 같습니다.
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    
    
    // cell 의 값이 이동시마다 변하기 떄문에 paging을 사용할수 없게되었습니다. 그래서 paging 역활을 하는 method를 사용합니다. 스크롤 될때 마다 불리는데, cell의 center.x의 값에 가까워지게되면, offSet을 중앙으로 옮겨지게 만들어줍니다.
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        guard let collectionView = self.collectionView  else { return proposedContentOffset }
        
        //현재 컬렉션 뷰의 [UICollectionViewLayoutAttributes] 가져오기
        guard let attributeList =  self.layoutAttributesForElements(in: collectionView.bounds) else {return proposedContentOffset}
        
        
        
        //거리가 가장 가까운 순으로 정렬
        let sortedAttributeList = attributeList.sorted {
            (attribute1, attribute2) -> Bool in
            distance(ofCenter: attribute1.center.x) < distance(ofCenter: attribute2.center.x)
            
        }
        
        //가장 가까은 아이템의 센터 위치
        let xCenterOfMinimumAttributes = sortedAttributeList.first?.center.x
    
        let screenXCenter = collectionView.frame.size.width / 2
        let targetContentOffset = CGPoint(x:xCenterOfMinimumAttributes! - screenXCenter,y: proposedContentOffset.y)
        
        return targetContentOffset
    }

}

``` 




