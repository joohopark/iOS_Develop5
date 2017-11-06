
import UIKit
import AVFoundation


class PlayerViewController: UIViewController , UIGestureRecognizerDelegate {

    @IBOutlet weak var musicTitle: UILabel!
    @IBOutlet weak var singerTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var btnNumber = 0
    var offSetBtn = 0
    var bombSoundEffect: AVAudioPlayer?
    var textView: UITextView?

  
    /*==========
     viewDidLoad
     ==========*/
    override func viewDidLoad() {
        super.viewDidLoad()
        //collectionView.isPagingEnabled = true
        
        
        collectionView.delegate = self
        
        
        self.textView = UITextView()
        textView?.isEditable = false
        
        // gesture 만들기
        
        //target 의 self는 target method가 존재할 self다...?
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapOnalbumCover(_:)))
        
        
        
        gesture.delegate = self
        collectionView.addGestureRecognizer(gesture)
      
        }
    
    @objc func taptextView(_ sender: UITapGestureRecognizer) {
        
        textView?.removeFromSuperview()
        
    }
    
    
    /*==========
      제스쳐 정의
     ==========*/
    @objc func tapOnalbumCover(_ sender: UITapGestureRecognizer) {
        
        var playListIndex = (self.collectionView.contentOffset.x/self.collectionView.frame.size.width)+((self.collectionView.contentOffset.x/self.collectionView.frame.size.width)*0.5)
        playListIndex.round()

        
        // 앨범커버 선택시 가사 뷰 띄우기
        textView = UITextView(frame: CGRect(x: self.view.frame.size.width/2 - 5, y: self.view.frame.size.height/2 - 5, width: self.view.frame.size.width, height: self.view.frame.size.height))
        
        textView?.isEditable = false
        
        let textViewGesture = UITapGestureRecognizer(target: self, action: #selector(self.taptextView(_:)))
        textView?.addGestureRecognizer(textViewGesture)
        textViewGesture.numberOfTapsRequired = 2
        
//        lyricsView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        
        // 애니메이션 사용 하는 방법은 이렇게 하는거구나... 오...!
        UIView.animate(withDuration: 1) {
            
            self.textView?.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
            
            self.textView?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
            self.textView?.textColor = UIColor.white
            self.textView?.font = UIFont.boldSystemFont(ofSize: 15)
            self.textView?.textAlignment = .center
    
        }
        
        textView?.text = PlayListDataModel.PlayListSingleton.lyricsArray[Int(playListIndex)]
        
        
        
        self.view.addSubview(self.textView!)
        
        
        
    }
    
    
    /*==========
     제스쳐 델리게이트
     ==========*/
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("touchCount 1")
        if touch.tapCount == 2 {
            dismiss(animated: true, completion: nil)
            
            print("touchCount2")
        }
        
        
        return true
    }
    

        
        

        
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    /*==========
     next 버튼
     ==========*/
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
        
    
    
    /*==========
     뒤로가기 버튼
     ==========*/
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
    
    
    

    /*==========
       재생 버튼
     ==========*/
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


extension PlayerViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PlayListDataModel.PlayListSingleton.imgeArray.count
    }
    
    /*==========
     cell 정의
     ==========*/
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(Thread.current)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MusicCell
        
        
        
        cell.imageView.image = PlayListDataModel.PlayListSingleton.imgeArray[indexPath.item]
        
        musicTitle.text = PlayListDataModel.PlayListSingleton.musicTitleArray[indexPath.row]
        singerTitle.text = PlayListDataModel.PlayListSingleton.singerTitleArray[indexPath.row]
        
        
        return cell
        
        
    }
    
}

extension PlayerViewController: UICollectionViewDelegateFlowLayout {
    /*==========
     각 cell 사이즈 결정
     ==========*/
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.size.width*0.6)
        
        return CGSize(width: width, height: collectionView.bounds.size.width)
    }
    
    /*==========
     cell 의 초기 위치값 설정
     ==========*/
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        
        let sideInset = collectionView.frame.size.width * 0.25
        
        return UIEdgeInsets(top: collectionView.frame.size.height*0.5, left: sideInset, bottom: 0, right: sideInset)
    }
    
}

    /*==========
  스크롤시 노래 자동 재생
     ==========*/
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

