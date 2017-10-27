

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var CV: UICollectionView!
    var sectionCount: [String] = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"]
    
    var tempDelete: [IndexPath] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(sectionCount)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addBtnAction(_ sender: UIButton) {
        
        //방법 1
//        sectionCount.append("h")
//        CV.reloadData()
        
        CV.performBatchUpdates({
            
            let indexPath = IndexPath(item: sectionCount.count, section: 0)
            
            sectionCount.append("h")
            //sectionCount.insert("h", at: 3)
            CV.insertItems(at: [indexPath])
            
            CV.reloadData()
            print(indexPath,sectionCount)
            
        }, completion: nil)
        
        // 프린트 찍어서 어떻게 작동하는 지 확인해보면 알수 있을것 같다.
        print(sectionCount)
        
        
    }
    @IBAction func deleteBtnAction(_ sender: UIButton) {
        
        // 지우는 방법
        CV.performBatchUpdates({
//            let indexPath = IndexPath(item: 0, section:0)
//
//            sectionCount.removeFirst()
            var removeIDX = tempDelete[0].item
            
            for i in tempDelete {
                let removedata = i.item
                sectionCount.remove(at: removedata)
                
                print(i, removeIDX)
                CV.deleteItems(at: [i])
            }
            
            
            
            
            tempDelete = []
            //CV.reloadData()
            
            
            
            
        }, completion: nil)
        
    }
    
    

}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    // 색션의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(section, collectionView)
        return sectionCount.count
    }
    
    // cell 을 어떻게 정해줄건지 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CustomCell
        
        cell?.LB.text = sectionCount[indexPath.row]
        
        //var colorRGB = UIColor(red: 10, green: 200, blue: 30, alpha: 1)
        cell?.backgroundColor = UIColor(red: 100/255, green: (5/255)*CGFloat(indexPath.item), blue: 100/255, alpha: 0.6)
        
        cell?.LB.textAlignment = .center
        return cell!
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.bounds.size.width/4
        let height = view.bounds.size.height/8
        
        let itemSize = CGSize(width: width-2, height: height)
        
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.allowsMultipleSelection = true
        // 선택되었다는 UI

        // 현재 클릭된 cell의 인스턴스를 가져오는
        let cell = collectionView.cellForItem(at: indexPath) as? CustomCell

//        cell?.layer.borderColor = UIColor.blue.cgColor
//        cell?.layer.borderWidth = 3
        
        cell?.LB.textColor = .red
        print(indexPath)
        
        
        // reloadData 를 하면 랜덤하게 위의값들이 적용되는데 왜그런지 한번 확인해봐야할것 ㄱ타다.
        //collectionView.reloadData()
        
        /// 선택 -> 삭제 버튼 누르면 삭제가 가능하게됨.
        tempDelete.append(indexPath)
        
    }
    
    // 재선택 될때 불리는 매소드?
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.allowsMultipleSelection = true
        
        let cell = collectionView.cellForItem(at: indexPath) as? CustomCell
        
        cell?.LB.textColor = .black
        
    }

    
    
    
    
    
}
