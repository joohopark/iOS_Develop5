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


## UICollectionViewFlowLayout


![screen](/study/video-gif/UICollectionViewFlowLayout-1.gif){.aligncenter}




