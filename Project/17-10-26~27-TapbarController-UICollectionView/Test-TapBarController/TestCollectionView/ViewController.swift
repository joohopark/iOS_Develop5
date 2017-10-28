

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var CV: UICollectionView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CV.dataSource = self
        CV.delegate = self
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 중요한 매소드 2가지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 30
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //cell을 재사용하겟다는 명령어, 재사용 명령어는 deque 명령어로 구현한다. 이때 cell 등록을 해주어야함.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? Custom
        cell?.backgroundColor = UIColor.brown
        print(indexPath)
        
        
        
        return cell!
        
    }
    
    
    
    ///////////LayOut
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 8
    }
    
    // 각 cell의 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 사용하려고 하는 cell을 등록..?
        //collectionView.cellForItem(at: indexPath)
        
        
        let width = collectionView.bounds.size.width/8
        let height = collectionView.bounds.size.width/8
        
        return CGSize(width: width, height: height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
    }
    
    /// Delegate
    // cell의 아이템이 선택 되었을때 불리는 delegate
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        print("shodlSelectItemAt \(indexPath.item)")
        
        var x = collectionView.cellForItem(at: indexPath)
        x?.backgroundColor = .red
        
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        
        print("shouldHigh")
        return true
    }
    
    // 아이템을 누르기 직전에 불리는 녀석. 화면에 띄워지기 이전에 어떤 일을 하기위해서 사용하는 method 인것 같습니다.
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        
        print("didhighlightitem")
        
        var x = collectionView.cellForItem(at: indexPath)
        x?.frame.size = CGSize(width: collectionView.bounds.size.width/10, height: collectionView.bounds.size.width/10)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        
        print("didunhigh")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        print("shouldDeselect")
        
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelctItem")
        
        
    }
    
    
    
}

