

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var CV: UICollectionView!
    var sectionCount: [String] = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"]
    
    var tempDelete: [IndexPath] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(sectionCount.count)
        
        
        
        
        
        
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
            
            // 어느위치에 넣고 업로드 할지 결정할수 있습니다.
            //sectionCount.insert("h", at: 3)
            
            // performBatchUpdates method 블럭안에서 collectionView안에 새로운 값을 넣어주는 작업을 하는것임..
            CV.insertItems(at: [indexPath])
            CV.reloadData()

        }, completion: nil)

        // 프린트 찍어서 어떻게 작동하는 지 확인해보면 알수 있을것 같다.
        print(sectionCount)
        
        
    }
    
    
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
        let cell = collectionView.cellForItem(at: indexPath) as? CustomCell
        
        
        //cell?.LB.textColor = .red
        
        cell?.layer.borderColor = UIColor.purple.cgColor
        cell?.layer.borderWidth = 5
        tempDelete.append(indexPath)
        
        print(tempDelete, tempDelete.count)
        
    }
    

    // 재선택 될때 불리는 매소드?
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.allowsMultipleSelection = true
        
        let cell = collectionView.cellForItem(at: indexPath) as? CustomCell
        //cell?.LB.textColor = .black
        cell?.layer.borderColor = UIColor.clear.cgColor
        
        
        
        
    }

    
    
    
    
    
}
