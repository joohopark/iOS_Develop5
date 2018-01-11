import UIKit
import Photos

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  // collectionView의 해더부분이 새로운 이미지 부분이고,
  func fetchPhoto() {
    // PHfetchOption 옵션 설정
    // 이미지를 fetch 할때, 옵션을 줌, 정렬을 주기위한 기준.
    let fetchOption = PHFetchOptions()
    fetchOption.fetchLimit = 20
    NSSortDescriptor(key: "creationDate", ascending: false)
    
    //
    fetchOption.sortDescriptors =
    
    
    let assets = PHAsset.fetchAssets(with: .image, options: nil)
    
    DispatchQueue.global().async {
      assets.enumerateObjects { (asest, count, stop) in
        let manager = PHImageManager()
        
        
        let requsetOPtion = PHImageRequestOptions()
        requsetOPtion.isSynchronous = true
        
        manager.requestImage(for: assets,
                             targetSize: CGSize(width: 200, height: 200),
                             contentMode: .aspectFit,
                             options: requsetOPtion,
                             resultHandler: { (image, info) in
                              
                              print(image, info)
                              
                              
                                
                                DispatchQueue.main.async {
                                  if assets.count == count-1 {
                                  }
                                }
                                //stop
                                // collectionView reload
        })
    }
      
      
    
    
      
    }
    
  }
  
  
  
  
}

