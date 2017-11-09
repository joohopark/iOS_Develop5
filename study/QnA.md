# QnA 해결 목록

---

## Q.1 UI. 에서 frame 과, bounds의 차이 가 무엇일까?

frame과 Bound 모두 View의 위치와 크기를 나타내줍니다. 즉 x,좌표와 y좌표, 가로길이와 세로길이 이렇게 4가지의 실수를 받아 View 사각형이 어디에 위치했는지와, 얼마나 큰지가 지정됩니다.

Frame과 Bounds는 상당히 비슷하지만 분명한 차이가 존재합니다. 이는 상위뷰(super view)가 있을때 명확히 드러나게 됩니다. Frame의 x,y 좌표들은 해당 View가 속해있는 super view 안에서의 좌표를 이야기 합니다. 하지만 Bounds의 좌표들은 superView와 무관합니다. 아래의 그림을 보면 더 자세하게 알수 있습니다.

<p align="center">

![screen](/study/image/QnA.jpg)

</p>




---
    

## Q.2 datasource, delegate의 workFlow 는 어떻게 될까?

[Delegate를 만들어보자!](https://github.com/devminjun/IOS-Develop5/blob/master/study/24_17-10-12.md)

---

## Q.3 시뮬레이터의 좌표 값을 마우스 클릭으로 가져와 보자!


```swift


import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {



		override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        // 더블탭 만들기, 델리게이트 사용
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(self.tapToZoom))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.numberOfTouchesRequired = 1
        
        scrollView.addGestureRecognizer(doubleTap)

        
        
        }

@objc func tapToZoom(_ gestureRecognizer: UIGestureRecognizer) {
        
        // 좌표추적
        gestureRecognizer.location(in: scrollView)
        
        }
        
        }


```

---

## Q.4 달력 만들기 부분에서, 날짜 변환... 뭔가 이상함;


```swift
let calendarIns = Calendar(identifier: .gregorian)
var components = calendarIns.dateComponents([.year, .month, .day], from: date)
print(components.year)

components.day = 1
print(components)
let firstDayDate = calendarIns.date(from: components) // 2017-10-31
print(firstDayDate)

var weekDayCompo = calendarIns.dateComponents([.weekday], from: firstDayDate!) // 11월달의 첫번째달의 요일을 출력하는 이유는??
//weekDayCompo = calendarIns.dateComponents([.], from: firstDayDate!)
print(weekDayCompo)

```