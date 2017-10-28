
import UIKit

class ViewController: UIViewController {

    var sectionCount: [String] = ["1","2","3","4","5","6","7","8","9","10"]
    
    @IBOutlet weak var LB: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// ViewController 위에서 사용하기 위해서
extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    // 색션안에 몇개의 아이템(cell)이 들어가야 하는지
    // 총 row의 개수를 지정 해주는것 같음.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionCount.count
    }
    
    // 해당 인덱스페스에
    // tableView에서 cell for row 에 해당 하는 녀석인것 같음.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        LB.text = sectionCount[indexPath.row]
        cell.contentView.backgroundColor = .red
        return cell
    }
    
    
    // cell 별로 각각의 size 를 설정해줄수 있음. cell 간격 별로 사이즈를
    // 각 cell의 사이즈를 반환해주는 녀석임
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.bounds.size.width / 2) - 5 
        return CGSize(width: width, height: width-10)
    }
    
    // 최소한의 거리?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return collectionView.bounds.size.height - 100
    }
    
    
    
    
    // 라인 스페이싱,
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return collectionView.frame.size.width * 0.5
    
    }
    
    // 각 셀의 위치를 조정 해줄수 있다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sideInset = collectionView.frame.size.width * 0.25
        
        return UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
    }
    
    
    
    
}



