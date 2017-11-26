# 52_17-11-26

---

## 글 post 하기

| PHAsset | * | posting 확인 |
| :--: | :--: | :--: |
| ![screen](/study/image/CreatInstagra-CoreData.png) | ![screen](/study/image/CreatInstagra-CoreData-1.png)| ![screen](/study/image/CreatInstagra-CoreData-2.png)|

---

## PHAsset 사용하기

```swift

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
  var addBtn: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    addBtn = UIButton(frame: CGRect(x: 200,
                                    y: 200,
                                    width: 60,
                                    height: 60))
    
    self.navigationController?.isNavigationBarHidden = false
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                             target: self,
                                                             action: #selector(self.next(_:)))
    layout = UICollectionViewFlowLayout()
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
```

> PHAsset를 사용할때, Info.Plist 에서 접근을 허용시켜 주어야합니다. collectionView를 Code로 작성해서 만들어보니, storyboard 로 만들때와는 다르게 느껴 졌습니다. code와, storyborad 를 똑같이 사용할수 있게 공부하는 습관을 들여야 겠습니다. StroyBoard 로 만들때 추상적으로 생략 되었던 부분들을 code로는 하나하나 작성해서 만들어 주어야 해서, 처음에 조금해매면서 만들었던것 같습니다. 어떤 Class 를 사용할때, `구조`를 반드시 알고 짜야 조금더 기본에 충실해서 만들수 있을것 같다는 생각이 들었습니다. 
> 

---

## Firebase CoreData, Storage 에 저장하기

```swift


import UIKit
import Firebase
import CoreData

class NextPostViewController: UIViewController {
  var ref: DatabaseReference!
  let storageRef = Storage.storage().reference()
  let uid = Auth.auth().currentUser?.uid
  var dic: [String : [String : [String : String]]]?
  
  let headerImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.backgroundColor = .lightGray
    return iv
  }()
  
  let postTextView: UITextView = {
    let tf = UITextView()
    tf.isEditable = true
    tf.layer.borderColor = UIColor.black.cgColor
    tf.layer.borderWidth = 3
    return tf
  }()
  
  var indicate: UIActivityIndicatorView! = {
    let idc = UIActivityIndicatorView()
    idc.backgroundColor = .black
    return idc
  }()
  
  var btn: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    ref = Database.database().reference()
    
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                             target: self.btn,
                                                             action: #selector(self.networkPost(_:)))
    view.addSubview(headerImageView)
    view.addSubview(postTextView)
    let navigationHeight: CGFloat = (self.navigationController?.navigationBar.frame.size.height)!
    let height: CGFloat = 27
    headerImageView.frame = CGRect(x: 0,
                                   y: navigationHeight+height,
                                   width: self.view.frame.size.width/5,
                                   height: self.view.frame.size.height*0.2)
    postTextView.frame = CGRect(x: self.view.frame.size.width/5,
                                y: navigationHeight+height,
                                width: self.view.frame.size.width*0.8,
                                height: self.view.frame.size.height*0.2)
  }
  
  @objc func networkPost(_ sender: UIBarButtonItem) {
    let indicateCGRect = CGRect(x: self.view.center.x, y: self.view.center.y, width: 100, height: 100)
    indicate = UIActivityIndicatorView(frame: indicateCGRect)
    view.addSubview(indicate)
    indicate.startAnimating()
    indicate.hidesWhenStopped = true
    
    guard let image = self.headerImageView.image else { return }
    let uploadimage = UIImageJPEGRepresentation(image, 0.3)
    let filename = NSUUID().uuidString
    Storage.storage().reference().child(uid!).child(filename).putData(uploadimage!, metadata: nil) { (metadata, error) in
      //storage 의 Path
      guard let profileImageUrl = metadata?.downloadURL()?.absoluteString else { return }
      guard let postText = self.postTextView.text else { return }
      // ref의 index 값을 불러온후. 저장해주려고함.
      self.ref.child(self.uid!).observeSingleEvent(of: .value, andPreviousSiblingKeyWith: { (dataSnapshot, string) in
        if let loadData = dataSnapshot.value as? NSDictionary {
          guard let postIndex = loadData["post"] as? NSArray, postIndex != nil else {
            self.dic = ["post": ["1": ["image": profileImageUrl, "contents": postText]]]
            Database.database().reference().child(self.uid!).updateChildValues(self.dic!, withCompletionBlock: { (error, data) in})
            
            return
          }
          self.dic = ["\(postIndex.count+1)": ["1": ["image": profileImageUrl, "contents": postText]]]
          let updateDic = ["\(postIndex.count)": ["image": profileImageUrl, "contents": postText]]
          //          self.dic = ["\(postIndex.count+1)": ["image": profileImageUrl, "contents": postText]]
          Database.database().reference().child(self.uid!).child("post").updateChildValues(updateDic, withCompletionBlock: { (error, data) in
            NotificationCenter.default.post(name: Notification.Name.init("netWorkData"),
                                            object: nil,
                                            userInfo: ["noti" : "info"])
            DispatchQueue.main.async {
              self.dismiss(animated: true, completion: nil)
              self.indicate.stopAnimating() 
            }
          })
        }
      })
    } 
  }
}

firebase 에 이미지를 저장하는 구조는

|--userUID
|----post
|------1
|--------["image":"Storage image Path", "contents":"작성 글 내용"]

```

---

## FireBase 에 저장되어있는 image, post 불러오기

```swift



import UIKit
import Firebase
import CoreData

class BrowsingViewController: UIViewController {
  
  var ref: DatabaseReference!
  let uid = Auth.auth().currentUser?.uid
  var postArray: [String]?
  var postImageArray: [String]?
  
  let tableView: UITableView = {
    let tv: UITableView = UITableView()
    return tv
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    ref = Database.database().reference()
    view.backgroundColor = .white
    view.addSubview(tableView)
    tableView.frame = CGRect(x: 0,
                             y: 0,
                             width: self.view.bounds.size.width,
                             height: self.view.bounds.size.height)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(BrowsingCustomCell.self, forCellReuseIdentifier: "Cell")
    tableView.rowHeight = UITableViewAutomaticDimension
    
    getNetworkData()
  }

  func getNetworkData() {
    ref.child(uid!).observeSingleEvent(of: .value) { (dataSnapshot) in
      if let loadData = dataSnapshot.value as? NSDictionary {
        DispatchQueue.main.async {
          self.postArray = []
          self.postImageArray = []
          if let postDataArrOfAny = loadData["post"] as? [Any] {
            let postDataArrOfAny = loadData["post"]! as? [Any]
            for item in postDataArrOfAny! {
              if item is NSNull {
                print("\(item) is null")
              }else {
                let temp = item as! [String:String]
                self.postArray!.append(temp["contents"]!)
                self.postImageArray!.append(temp["image"]!)
              }
            }
            self.tableView.reloadData()
          }
        }
      }
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    NotificationCenter.default.addObserver(forName: Notification.Name.init("netWorkData"), object: nil, queue: nil) { (noti) in
      self.postImageArray = []
      self.postArray = []
      self.getNetworkData()
      self.tableView.reloadData()
      
    }
  }
}

extension BrowsingViewController: UITableViewDelegate,UITableViewDataSource {
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.postImageArray?.count ?? 0
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BrowsingCustomCell
    guard let postData = self.postArray else {return cell}
    cell.bounds = CGRect(x: 0,
                         y: 0,
                         width: (cell.imageView?.bounds.width)!,
                         height: (cell.imageView?.bounds.height)!)
    cell.imageView?.bounds = CGRect(x: 0,
                                    y: 0,
                                    width: (cell.imageView?.bounds.width)!,
                                    height: (cell.imageView?.bounds.height)!)
    cell.imageView?.clipsToBounds = true
    cell.imageView?.contentMode = .scaleAspectFit
    cell.textLabel?.numberOfLines = 0
    cell.textLabel?.text = "\(postArray![indexPath.row])"
    let imagePath = postImageArray![indexPath.row]
    let data = try? Data(contentsOf: URL(string: imagePath)!)
    cell.imageView?.image = UIImage(data: data!)
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
}

class BrowsingCustomCell: UITableViewCell {
  
  let postImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.backgroundColor = .lightGray
    return iv
  }()
  
  let textLb: UILabel = {
    let lb = UILabel()
    lb.numberOfLines = 0
    lb.textAlignment = .center
    lb.textColor = .black
    
    return lb
  }()
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    // Customize imageView like you need
    self.addSubview(postImageView)
    self.addSubview(textLb)
    
    self.imageView?.frame = CGRect(x: 10, y: 0, width: 40, height: 40)
    self.imageView?.contentMode = UIViewContentMode.scaleAspectFit
    // Costomize other elements
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}

```

> firebase에 저장되어있는 값들을 가져오는 `시점`에 대한 고민이 필요한것 같습니다. singerton 으로 된 Data를 가져올때, 언제 load 해줄것인지에 대한 고민이 필요합니다. 데이터를 사용하려고하는 시점에 사용 되어지는 데이터가 담겨 있어야 원할때 사용할수 있습니다. 
> 
> 사실 Firebase에 imagePath 를 저장하고, app에서는 image를 Data로 가지고 있는 구조는 좋은 구조는 아닌걸 알게 되었습니다. 위에서 짜여진것은 image를 data로 가지고 있는 구조이지만, 결코 좋은 구조가 아니므로 수정이 필요합니다.

---

## Reference 


[rhammer님 블로그](http://rhammer.tistory.com/229) <br>
[collectionView 구조](https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/CollectionViewPGforIOS/CollectionViewBasics/CollectionViewBasics.html#//apple_ref/doc/uid/TP40012334-CH2-SW1)
