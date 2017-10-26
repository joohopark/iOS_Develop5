
import UIKit

class PlayerViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    @IBOutlet weak var collection: UICollectionView!
    
    @IBOutlet weak var collectionImage: UICollectionViewCell!
    
    
    
    @IBOutlet weak var musicTitle: UILabel!
    @IBOutlet weak var singerTitle: UILabel!
    
    @IBOutlet weak var previousBtn: UIButton!
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
