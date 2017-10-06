# 지하철 노선도 만들기(10.2~

---


## 고려해야 할사항

 1. 대중교통 노선도는 사용하게 되면, 자주 사용하므로 직관적인 UI, 그리고 아름다워야함
 2. 노선도 이미지는 확대했을때, 깨지지 않아야한다
 3. 핀치 핑거 기능, 더블 탭 했을때 확대 기능
 4. 지하철 노선도 탐색 기능.(출발 -> 도착 정했을때, 환승역 등등 고려해야 하는데, 아마 알고리즘을 사용해야 할 것 같다) 

 
 ---
 

## Work Log 

1. 이미지와, 스크롤뷰 생성 

```swift

import UIKit { 

class ViewController: UIViewController, UIScrollViewDelegate {
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 이미지, 스크롤뷰 생성 
        let frameSize = view.bounds.size
        scrollView = UIScrollView(frame: CGRect(origin: CGPoint.zero, size: frameSize))
        
        // 이미지 생성, 스크롤뷰의 컨텐츠 사이즈는, 이미지뷰의 사이즈로 정함
        let image = UIImage(named: "deagu.jpeg")
        imageView = UIImageView(image: image)
        scrollView.contentSize = imageView.bounds.size
        
        
        //view 에 뿌려주기
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        

       // Hierarchy 현재 구조         
        UIView
        |-- UiScrollview
        |-- UIImageView 
 }



```

2. Pinch, doubleTap Gesture(이미지 벡터로 변경)


```swift

// scrollViewDelegate 체텍
class ViewController: UIViewController, UIScrollViewDelegate {
 
    
    var pinchGesture = UIPinchGestureRecognizer()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        // zoomscale 설정
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 3.0
        
        
        // scrollView 에 델리게이트 할당
        scrollView.delegate = self
        
        // 텝 횟수에 따라서 동작 결정 
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(self.tapToZoom))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.numberOfTouchesRequired = 1
        
        // 더블텝 제스쳐를 scrllView 상위로 올렷다, 컨테이너 밖으로 벗어나면 터치가 안됨 ㅠㅠ
        scrollView.addGestureRecognizer(doubleTap)
        
    
    
    // 더블탭 기능, delegate 사용해서, addTaget 으로 사용함, 엄밀하게 더블텝을 위한것보다는, 델리게이트를 이용해서, 불려 오는 함수에 조건을 넣어서 기능을 구현했다.
    
    @objc func tapToZoom(_ gestureRecognizer: UIGestureRecognizer) {
        
        
        print("줌..")
        
        // 더블탭 간단 하게 구현
        if scrollView.zoomScale == CGFloat(1) {
            scrollView.setZoomScale(3, animated: true)
        }else {
            scrollView.setZoomScale(1, animated: true)
        }
        
    }
    
    // Pinch Gesture 줌 인, 아웃 가능, 사실상 핵심 기능. 이미지뷰를 반환할때, 하이라키 구조와 컨테이너 개념을 알고 있어야 한다. Forzooming 하려는 대상에 따라서 여러가지 방법으로 구현이 가능함.
    @objc func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        //print("viewFor")
        
        
        return imageView
    }
        
        
        
        


```


3. 각 역마다 버튼 넣고 터치시, 정해놓은 기능 구현(미완성)


```swift

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var btn: UIButton!

    

    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //btn 만들기
        
        btn = UIButton()
        btn = UIButton(frame: CGRect(x: 45, y: 20, width: 50, height: 50))
        btn.titleLabel?.text = "역버튼"
        btn.setTitle("역버튼", for: .normal)
        btn.setTitleColor(UIColor(red: 25/255, green: 10/255, blue: 100/255, alpha: 200/255 ), for: .normal)
        
        btn.setTitle("역버튼", for: .highlighted)
        btn.setTitleColor(UIColor.blue, for: .highlighted)
        
        
        btn.addTarget(self, action: #selector(trackBtnOffSetXY(_:)) , for: .touchUpInside)
        btn.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        // 버튼을 이미지뷰에 넣었다. 이때 문제가 생긴게, 이미지뷰는 기본적으로 인터렉션을 지원하지 않아서, 인터렉션이 가능하게 해주어야 한다.
        imageView.isUserInteractionEnabled = true
        imageView.addSubview(btn)
        
        
        // 버튼 현재 위치 추적
    @objc func trackBtnOffSetXY(_ sender: UIButton) {
        
        아직 미구현부, 지하철 역을 찾는 알고리즘을 사용해야 하는데. 
        
        지금 생각은 링크드 리스트를 사용해서, 환승역마다 Tree형식으로 넓혀가서 찾아갈까 생각중인데, 그렇게 하게되면 환승역이 늘어나면 너무 복잡해질것 같아서 아직 손을 못대고 있다..ㅠ.ㅠ
        
                
        
        
    }

        


```

4. 앞으로 해주어야 하는것 

	- 출발 -> 도착역 어떻게 구현할것인지 찾아야 한다
	- 아직 pop창 띄우는것을 배우지 않아서, 알럿으로 대체 할것임

	- 지하철역을 처음 클릭하면 -> 출발 지하쳘 이름 과 선택한 지하철이 맞느냐 yes or no -> yes 다음 지하철역 선택 가능 no -> 다시 선택

	- yes 선택 이후, 지하철역 선택하면, 자동 탐색 -> 탐색 후 어느정도 시간걸린다 반환

	- 실시간으로 각 역마다 지하철 시간표 테이블을 얻으면, 그것에 마추어서 다시 작성해보자 
	
---

## 현재까지 구현 완료 한것 

1. 스크롤뷰 

<p align="center">

![screensh](/study/image/CreatSubway.jpg) ![screensh](/study/image/CreatSubway1.jpg)

</p>

2. Zoom, Doubletap, Pinch Gesture


<p align="center">

![screensh](/study/image/CreatSubway2.jpg) 

</p>

3. 확대, 축소후 기능 버튼 위치 그대로

<p align="center">

![screensh](/study/image/CreatSubway3.jpg) 

</p>




