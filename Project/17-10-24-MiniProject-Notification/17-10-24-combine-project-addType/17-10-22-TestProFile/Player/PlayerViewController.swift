
import UIKit
import AVFoundation

class PlayerViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    @IBOutlet weak var musicTitle: UILabel!
    
    @IBOutlet weak var singerTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imgeArray: [UIImage] = []
    
    var musicTitleArray: [String] = []
    var singerTitleArray: [String] = []
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgeArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MusicCell
        //cell.imageView.image = imgeArray[indexPath]
       
        //cell.imageView.image = imgeArray[indexPath]
        cell.imageView.image = imgeArray[indexPath.row]
        musicTitle.text = musicTitleArray[indexPath.row]
        singerTitle.text = singerTitleArray[indexPath.row]
        return cell
        
        
    }
    
    // 각셀의 사이즈를 결정하고
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.size.width / 2)
        
        return CGSize(width: width, height: collectionView.bounds.size.width)
    }
    
    // 그 셀의 초기 위치 값을 지정해줄수 있다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        
        let sideInset = collectionView.frame.size.width * 0.25
        
        return UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
    }
    
    // 라인 스페이싱,
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return collectionView.frame.size.width * 0.5
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.isPagingEnabled = true
        loadData()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {

        // Song 파일에 있는 25번 녀석을 가져옴
        
        for idx in 0...29 {
            
            
            var forResourceName:String = "Song/" + "\(idx)"
            // 메타 데이터를 꺼내오기 위해서 이렇게 작업을함. metadata의 구조가 좋은 편이 아니라서, 모델링을 해주어야 하는데, 그 모델링 해주는 과정을 생략하고 직접 접근해서 사용함.
            if let url = Bundle.main.url(forResource: forResourceName, withExtension: "mp3") {
                
                // 애셋에 접근한것..!
                let asset = AVURLAsset(url: url)
                // 이런 asset에 있는 녀석의 데이터가 메타 데이터임
                
                let metaData:[AVMetadataItem] = asset.metadata
                print(asset, metaData)
                for item in metaData {
                    //print(item.commonKey)
                    
                    if let key = item.commonKey?.rawValue {
                        switch key {
                        case "title":
                            var musicTitletext = item.value as? String
                            musicTitleArray.append(musicTitletext!)
                        case "artist":
                            var singerTitletext = item.value as? String
                            singerTitleArray.append(singerTitletext!)
                        case "artwork":
                            let data = item.dataValue
                            let image = UIImage(data: data!)
                            imgeArray.append(image!)
                        default:
                            print("default")
                            
                        }
                        
                    }
                }
            }
            
            
        }
        

    }


}


// 선생님은 이미지뷰와, 레이블이 뷰컨트롤
//extension PlayerViewController: UIScrollViewDelegate {
//
//    // 드래그가 되는곳의 OffSet값을 알수 있음. 그 offSet의 값을 가지고, paging 단위의 idx 값을 가져올수 있다.
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        <#code#>
//    }
//}

