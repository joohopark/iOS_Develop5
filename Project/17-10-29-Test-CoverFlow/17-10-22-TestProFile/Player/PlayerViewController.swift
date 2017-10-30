
import UIKit
import AVFoundation


class PlayerViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource,AVAudioPlayerDelegate {

    
    
    
    @IBOutlet weak var musicTitle: UILabel!
    
    @IBOutlet weak var singerTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
//    var imgeArray: [UIImage] = []
//
//    var musicTitleArray: [String] = []
//    var singerTitleArray: [String] = []
//
//    var mp3List: [String] = []
    
    var btnNumber = 0
    var offSetBtn = 0
    var bombSoundEffect: AVAudioPlayer?
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PlayListDataModel.PlayListSingleton.imgeArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MusicCell
        
        
        
        cell.imageView.image = PlayListDataModel.PlayListSingleton.imgeArray[indexPath.item]
        
        musicTitle.text = PlayListDataModel.PlayListSingleton.musicTitleArray[indexPath.row]
        singerTitle.text = PlayListDataModel.PlayListSingleton.singerTitleArray[indexPath.row]

        
        return cell
        
        
    }
    
    // 각셀의 사이즈를 결정하고
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.size.width*0.6)
        
        return CGSize(width: width, height: collectionView.bounds.size.width)
    }
    
    // 그 셀의 초기 위치 값을 지정해줄수 있다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        
        let sideInset = collectionView.frame.size.width * 0.25
        
        return UIEdgeInsets(top: collectionView.frame.size.height*0.5, left: sideInset, bottom: 0, right: sideInset)
    }
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //collectionView.isPagingEnabled = true
        
        collectionView.delegate = self
        
        bombSoundEffect?.delegate = self
        bombSoundEffect?.enableRate = true
        
        
        // background 에서 실행 가능하게 만들기
//        do {
//
//            bombSoundEffect = try AVAudioPlayer(contentsOf: PlayListDataModel.PlayListSingleton.urlArray[0])
//            bombSoundEffect?.numberOfLoops = -1
//            bombSoundEffect?.prepareToPlay()
//            bombSoundEffect?.play()
//        } catch {
//
//        }
//
        }
    

        
        

        
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // next 노래 버튼
    @IBAction func previousBtnAction(_ sender: UIButton) {
        
        var playListIndex = (self.collectionView.contentOffset.x/self.collectionView.frame.size.width)+((self.collectionView.contentOffset.x/self.collectionView.frame.size.width)*0.5)+1
        playListIndex.round()
        
        
        
        if collectionView.contentOffset.x == 0 {
            collectionView.contentOffset = CGPoint(x: 269, y: 0)
            do {
                self.bombSoundEffect = try AVAudioPlayer(contentsOf:PlayListDataModel.PlayListSingleton.urlArray[Int(playListIndex)])
                
                self.bombSoundEffect?.prepareToPlay()
                self.bombSoundEffect?.play()
                
            } catch {
                // couldn't load file :(
            }
            
        }else if collectionView.contentOffset.x == 7269{
            print("contentOffset.x 가 7269")
            
        }else if !(collectionView.contentOffset.x == 0) && playListIndex <= 30 {
            collectionView.contentOffset = CGPoint(x: 250+collectionView.contentOffset.x, y: 0)
            
            print(collectionView.contentOffset.x)
            
            do {
                self.bombSoundEffect = try AVAudioPlayer(contentsOf:PlayListDataModel.PlayListSingleton.urlArray[Int(playListIndex)])
                
                self.bombSoundEffect?.prepareToPlay()
                self.bombSoundEffect?.play()
                
            } catch {
                // couldn't load file :(
            }
            
        }
        
    }
        
    
    
    // 뒤로가기 노래 버튼
    @IBAction func backBtnAction(_ sender: UIButton) {
        
        var playListIndex = (self.collectionView.contentOffset.x/self.collectionView.frame.size.width)+((self.collectionView.contentOffset.x/self.collectionView.frame.size.width)*0.5)-1
        playListIndex.round()

    
        if collectionView.contentOffset.x == 0 {
            
        }else if collectionView.contentOffset.x == 269 {
            collectionView.contentOffset = CGPoint(x: collectionView.contentOffset.x-269, y: 0)
            
            do {
                self.bombSoundEffect = try AVAudioPlayer(contentsOf:PlayListDataModel.PlayListSingleton.urlArray[Int(playListIndex)])
                
                self.bombSoundEffect?.prepareToPlay()
                self.bombSoundEffect?.play()
                
            } catch {
                // couldn't load file :(
            }

            
        }else {
            collectionView.contentOffset = CGPoint(x: collectionView.contentOffset.x-250, y: 0)
            do {
                self.bombSoundEffect = try AVAudioPlayer(contentsOf:PlayListDataModel.PlayListSingleton.urlArray[Int(playListIndex)])
                
                self.bombSoundEffect?.prepareToPlay()
                self.bombSoundEffect?.play()
                
            } catch {
                // couldn't load file :(
            }

            
        }
        

        
        
    }
    
    
    

    // 재생 버튼
    @IBAction func playBtnAction(_ sender: UIButton) {
        var playListIndex = (self.collectionView.contentOffset.x/self.collectionView.frame.size.width)+((self.collectionView.contentOffset.x/self.collectionView.frame.size.width)*0.5)
        playListIndex.round()
        
        print(playListIndex)
        
        
        if self.bombSoundEffect?.isPlaying == true {
            self.bombSoundEffect?.pause()

        }else {
            do {
                self.bombSoundEffect = try AVAudioPlayer(contentsOf:PlayListDataModel.PlayListSingleton.urlArray[Int(playListIndex)])

                self.bombSoundEffect?.prepareToPlay()
                self.bombSoundEffect?.play()

            } catch {
                // couldn't load file :(
            }

        }
        
    }

}


extension PlayerViewController: UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print("스크롤이될떄마다 불리는건가?")
        
        // 여기에서 targetContentOffset 은 CollectionView의 cell안에 offSet 값을 받아옴.
        print(scrollView.contentOffset.x, targetContentOffset.pointee.x, collectionView.contentOffset.x)
        
        var playListIndex = (self.collectionView.contentOffset.x/self.collectionView.frame.size.width)+((self.collectionView.contentOffset.x/self.collectionView.frame.size.width)*0.5)
        playListIndex.round()

        do {
            self.bombSoundEffect = try AVAudioPlayer(contentsOf:PlayListDataModel.PlayListSingleton.urlArray[Int(playListIndex)])
            
            self.bombSoundEffect?.prepareToPlay()
            self.bombSoundEffect?.play()
            
        } catch {
            // couldn't load file :(
        }

    }
    
    
}

