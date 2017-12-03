# 39_17-10-30

---

## AVAudioPlayer, UICollectionView, UIGestureRecognizer



---

## AVAudioPlayer 

#### - tip 

```swift

var playListIndex = (self.collectionView.contentOffset.x/self.collectionView.frame.size.width)+((self.collectionView.contentOffset.x/self.collectionView.frame.size.width)*0.5)-1
        playListIndex.round()
```

> 노래를 재생시키기 위해서, 해당 cell들의 Index값을 알아야 했는데, 위의 계산식 형태로 인덱스 값을 찾아 주었습니다. 

#### - AvAudioPlayer 

```swift

import AVFoundation

class PlayerViewController: UIViewController ,AVAudioPlayerDelegate, UIGestureRecognizerDelegate {


var bombSoundEffect: AVAudioPlayer?

@IBAction func playBtnAction(_ sender: UIButton) {

            do {
                self.bombSoundEffect = try AVAudioPlayer(contentsOf:PlayListDataModel.PlayListSingleton.urlArray[Int(playListIndex)])

                self.bombSoundEffect?.prepareToPlay()
                self.bombSoundEffect?.play()

            } catch {
                // couldn't load file :(
            }
}
```

> AVAudioPlayer(contentsOf: URL) 을 넣고, play() method로 실행을 시켜 주었습니다.재생 버턴을 누르게 되면, 음악이 Play 됩니다.

---


## UICollectionView 

![screen](/study/video-gif/UICollectionViewFlowLayout-1.gif)

#### - 재생 버튼 누르면 음악 재생

```swift
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

```
> Play 중이면, 버튼을 다시 한번 누르면, 음악이 `pause` 됩니다.

#### - next 버튼 

```swift

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


```

> next 버튼을 누르게되면, 다음 음악의 썸네일이 보여지게 하기 위해서, collectionView의 contentOffset 을 이동시켜 주었습니다. 
> 

#### - back 버튼

```swift

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
    
```

> 뒤로가기 버튼도, next 버튼과 동일하게 CollectionView의 OffSet 값을 조정해서 구현 했습니다. 

#### - 드레깅 시에 음악 자동 재생

```swift

extension PlayerViewController: UIScrollViewDelegate {
    
    // 스크롤이 되고 cell이 위치를 잡으면(?) 호출이 됩니다. 
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        
		  // scrollView의 ContentOffset 값과, targetCOntentOffset.pointee 의 값의 차이를 알기 위해 print를 찍어서 확인합니다.
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


```


---

## UIGestureRecognizer 

- 사용자의 입력을 전달 받을 수 있는 `터치방법`을 제공 합니다. <br>
- Tap, Pinch, Rotation, Swipe, Pan(drag), Edge Pan, Long Press 등을 인지하는 각각의 서브 클래스 존재 <br>
- View 위에 얹어 액션을 핸들링 합니다.


---

## UIGestureRecognizer 종류

![screen](/study/image/UIGesture.jpg)



---

## UIGestureRecognizer

#### - 코드로 UIGestureRecognizer 만들기

```swift

let tapGesture = UITapGestureRecognizer(target: self,action: #selector(ViewController.tapAction(_:))

//View에 제스쳐를 추가해주어야 한다.                                                           
self.view.addGestureRecognizer(tapGesture)


//ViewController내 존재 하는 함수
@objc func tapAction(_ sender:UITapGestureRecognizer) {
}

```

> 코드로 View에 Gesture 를 추가할때 주의해야 하는게, View에 gesture을 추가해서 사용할때, 어떤 시점에 gesture를 추가해서 사용할지에 대해서도 고민을 해야한다. 가령, 서로 다른 뷰에 서로 다른 제스쳐를 사용한다고 할때, gestrue가 add 되는 시점에 따라서, 이벤트를 받지 못할수도 있다. 
> 

#### - 예제 코드 

```swift

override func viewDidLoad() {
        super.viewDidLoad()
                
        self.textView = UITextView()
        textView?.isEditable = false
        
        // gesture 만들기
        
        //target 의 self는 target method가 존재할 self다...?
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapOnalbumCover(_:)))
        
        let otherGesture = UITapGestureRecognizer(target: self, action: #selector(self.        
        
        
        collectionView.addGestureRecognizer(gesture)
        
        UITextView.addGestureRecognizer(dismissTextView)
      
        }
        
        
@objc func tapOnalbumCover(_ sender: UITapGestureRecognizer) {
	print("tapOnalbumCover")
	
	self.textView?.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
            
            self.textView?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
            self.textView?.textColor = UIColor.white

	}
	
@objc func dismissTextView(_ sender: UITapGestureRecognizer
	print(dissmissTextView)

}


-> 이렇게 작성후, dissmissTextView에서 gesture을 하게되면, dismissTextView가 호출이 되지 않는다. 이유는 애초에 UITextView에 addGestureRecognizer 할때의 TextView의 프로퍼티(?)들이 dismissTextView가 호출되는 시점에서는 달라져 있어서 호출이 안된다(?) 라고만 이해하고 있다. 엄밀하게 정확한지는 판단이 잘 되지 않지만, 

위의 증상을 해결하기위해서는, tapOnalbumCover 안에서 textView에 addGesture을 넣어주면, 정상 작동하게된다. 

```

#### - storyBoard 로 UIGestureRecogniazer 만들기

| * |  * |
| :---: | :---: | 
| ![screen](/study/image/UIGesture-2.jpg) | ![screen](/study/image/UIGesture-3.jpg) | 

> View에 Drage and Drop을 해서 gesture 을 먹여(?) 주고, Delegate를 사용한다면, 해당 ViewController 에 Delegate를 연결해서 사용해준다.

```swift

*가장 많이 사용하는 Delegate메소드

 func gestureRecognizer(_ gestureRecognizer:UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
	// 터치된 포인트가 inView위치에 어느 좌표에 해당되는지 표시	print("xposition", touch.location(in: touch.view).x)
		// 터치가 일어난 시간 반환	print("touch timeStamp”,touch.timestamp)
		// 연속적으로 일어난 터치의 횟수	print("touch tapCount",touch.tapCount)
		return true}

```

---

## Gesture 적용 

![screenc](/study/video-gif/UIGesture-1.gif)


```swift

class PlayerViewController: UIViewController , UIGestureRecognizerDelegate {


	override func viewDidLoad() {
   	     super.viewDidLoad()

	let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapOnalbumCover(_:)))
        
        
        
        gesture.delegate = self
        collectionView.addGestureRecognizer(gesture)
      
        }
    
            
@objc func taptextView(_ sender: UITapGestureRecognizer) {
 			
 			// textView에 superView에서 textView를 떨어뜨려내서 인스턴스를 삭제합니다.       
        textView?.removeFromSuperview()
        }
 
 
        
@objc func tapOnalbumCover(_ sender: UITapGestureRecognizer) {
        
        var playListIndex = (self.collectionView.contentOffset.x/self.collectionView.frame.size.width)+((self.collectionView.contentOffset.x/self.collectionView.frame.size.width)*0.5)
        playListIndex.round()

        
        // 앨범커버 선택시 가사 뷰 띄우기
        textView = UITextView(frame: CGRect(x: self.view.frame.size.width/2 - 5, y: self.view.frame.size.height/2 - 5, width: self.view.frame.size.width, height: self.view.frame.size.height))
        
        textView?.isEditable = false
        
        let textViewGesture = UITapGestureRecognizer(target: self, action: #selector(self.taptextView(_:)))
        textView?.addGestureRecognizer(textViewGesture)
        textViewGesture.numberOfTapsRequired = 2
        
        
        에니메이션 적용 방법 
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
```

---

## Reference 

[avaudioplayer Reference](https://developer.apple.com/documentation/avfoundation/avaudioplayer) <br>

[Manage Life Cycle Events](https://developer.apple.com/documentation/uikit/core_app/managing_your_app_s_life_cycle)<br>

[UIGestureRecognizer Reference ](https://developer.apple.com/documentation/uikit/uigesturerecognizer)