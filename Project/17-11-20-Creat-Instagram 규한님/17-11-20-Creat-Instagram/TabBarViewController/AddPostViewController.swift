
import UIKit
import Photos
import PhotosUI

class AddPostViewController: UIViewController {
  var collectionView: UICollectionView!
  var layout = UICollectionViewFlowLayout()
  
  var allPhotos: PHFetchResult<PHAsset>!
  let imageManager = PHCachingImageManager()
  var headerView = UICollectionReusableView()
  
  var selectedImage: UIImage = UIImage()
  
  
  let v = UIView()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                             target: self,
                                                             action: #selector(self.next(_:)))
    
    view.backgroundColor = .white
//    layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 100, height: 100)
    collectionView = UICollectionView(frame: CGRect(x: 0,
                                                    y: 0,
                                                    width: self.view.frame.size.width ,
                                                    height: self.view.frame.size.height),
                                      collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    view.addSubview(collectionView)
    
    
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "Cell")
    collectionView.register(CellHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Cell")
    
    fetchAllPhotos()
    
  }
  
  func fetchAllPhotos() {
    let allPhotosOptions = PHFetchOptions()
    //allPhotosOptions.fetchLimit = 20
    //옥경님에게 질문하기
    allPhotosOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
    allPhotos = PHAsset.fetchAssets(with: allPhotosOptions)
    
    collectionView?.reloadData()
  }
  
  
  @objc func next(_ sender: UIBarButtonItem) {
    let nextVC = NextPostViewController()
    nextVC.headerImageView.image = self.selectedImage
    self.navigationController?.pushViewController(nextVC, animated: true)
    
  }
}



extension AddPostViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let returnSize = CGSize(width: 100, height: 100)
    return returnSize
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    let returnSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height/3)
    return returnSize
  }
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return allPhotos.count
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCell
    let asset = allPhotos.object(at: indexPath.item)
    
    cell.representedAssetIdentifier = asset.localIdentifier
    
    imageManager.requestImage(for: asset,
                              targetSize: CGSize(width: 300, height: 300),
                              contentMode: .aspectFill,
                              options: nil) { (image, hash) in
                                
                                if cell.representedAssetIdentifier == asset.localIdentifier {
                                  
                                  cell.photoImageView.image = image
                                }
    }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
    selectedImage = cell.photoImageView.image!
    collectionView.reloadData()
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Cell", for: indexPath) as! CellHeader
    
    headerView.backgroundColor = .white
    headerView.headerImageView.image = selectedImage
    return headerView
    
  }
}

class CustomCell: UICollectionViewCell {
  
  var representedAssetIdentifier: String!
  
  let photoImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.backgroundColor = .lightGray
    return iv
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(photoImageView)
    
    photoImageView.translatesAutoresizingMaskIntoConstraints = false
    
    photoImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    photoImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    photoImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
}
class CellHeader: UICollectionReusableView {
  
  let headerImageView: UIImageView = {
    let iv = UIImageView()
    iv.frame = CGRect(x: 10, y: 10, width: 10, height: 10)
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.backgroundColor = .lightGray
    return iv
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(headerImageView)
    
    headerImageView.translatesAutoresizingMaskIntoConstraints = false
    
    headerImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    headerImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    headerImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    headerImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

