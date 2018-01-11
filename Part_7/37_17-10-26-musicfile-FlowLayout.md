# 37_17-10-26

---

## TabbarController, UICollectionView, UICollectionViewDelegate

---

## TabbarController

#### [TabbarController tutorial](https://www.youtube.com/watch?v=nFw1yVhG4r8)

---

## tabBarController 구조

![scrren](/study/image/TabbarController.jpg)


---

## Tab Bar Item

![scrren](/study/image/TabbarController-1.jpg)

> 각각의 ViewController를 각 TabBar Item에 매칭 되어 있다.
>
> TabBarItem은 이미지와 텍스트를 넣을수 있다. 
> 
> 각 TabBar Item은 해당 ViewController의 tabBarItem 프로퍼티로 접근 가능하  

---

- The classes and protocols for implementing collection views <br>

	
#### - data 부분

| Manager |Protocol |Presentation | 
| :-----: | :-----: | :-----:|
| UICollectionView |UICollectionViewDataSource |  UICollectionReusableView|
| UICollectionViewController |  UICollectionViewDelegate | UICollectionViewCell|

#### - Layout 부분

| Layout | flow Layouy |
| :-----: | :-----: | 
| UICollectionViewLayout| UICollectionViewFlowLayout| 
|UICollectionViewLayoutAttributes | UICollectionViewDelegateFlowLayout|
| UICollectionViewUpdateItem | * |

---

## UICollectionView

<p align="center">

![screen](/study/image/UICollectionView.jpg)

</p>

> 계층구조가 특이하게, UICollectionView를 통해서 Data, Layout 분리해서 사용한다. Layout, Data를 각각 정의해서 유동적으로 사용할수 있게 만들어 진 계층구조 입니다. 잘 사용할수 있다면 유용하게 사용되는 도구가 될수 있을것 같습니다.

---

## Layout 

<p align="center">

![screen](/study/image/UICollectionView-1.jpg)

</p>

> flow Layout , Custom Layout 의 계층이 다르게 되어 있습니다... Flow Layout 은 템플릿 처럼 사용하기 편하게 만들어 놓은것 같고, Flow Layout 에 만족하지 못한다면 무조건 Custom 으로 만들어야 할것 같습니다.


---

## Section Layout 

<p align="center">

![screen](/study/image/UICollectionView-2.jpg)

</p>

> 하나의 Cell에 대한 Layout 입니다.


---

## Item Size, Item Spacing, Line Spacing, Section Inset 

#### - Item Size, Item Spacing, Line Spacing

| Item Size | Item Spacing | Line Spacing |
| :-------: | :-------: | :-------: |
|![screen](/study/image/UICollectionView-3.jpg) |![screen](/study/image/UICollectionView-4.jpg) | ![screen](/study/image/UICollectionView-5.jpg) |


> `UICollectionViewDataSource ` 채용해서 사용해야 한다. 

```swift
// collectionView의 section의 개수를 정해주는 methoe
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
// 각 cell을 재사용하기 위해서 사용하는 method     
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }

- UICollectionViewDelegateFlowLayout 
	-> Layout을 결정하기 위해서 사용하는 Delegate 
// 각 셀의 사이즈를 결정해준다.
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width/8
        let height = collectionView.bounds.size.width/8        
        return CGSize(width: width, height: height)
    }

// item Spacing 
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {        
		let itemSpacing: CGFloat = 30
        return itemspacing
    }
// line Spacing    
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		let lineSpacing: CGFloat = 100
        return lineSpacing
    }

 -> 조금 햇갈릴수 있는 두 개념인데, 기준을 collectionView의 `scroll direction` 방향에 따라서 생각하면 조금 편해진다..! 
``` 	

#### - Section Inset 

<p align="center">

![screen](/study/image/UICollectionView-7.jpg)

</p>


> Edge inset values are applied to a rectangle to shrink or expand the area represented by that rectangle. Typically, edge insets are used during view layout to modify the view’s frame. Positive values cause the frame to be inset (or shrunk) by the specified amount. Negative values cause the frame to be outset (or expanded) by the specified amount.
>
> Edge inset methow 에 대한 설명인데, 가장 자리에 값을 삽입하여, 프레임 값을 변경한다고 작성되어있다.
> 
> 


#### prefetching : 데이터를 미리 로드할수 있게 만들어 놓은공간, 테이블뷰에서 다음 cell을 로드할때, 네트워크를 갔다와서 데이터를 받아와야하는데, 그 과정 이전에 데이터를 prefetching 해서 사용할수 있다. 

---

## UICollectionViewDelegate 

```swift
optional public func collectionView(_ collectionView: UICollectionView,
shouldHighlightItemAt indexPath: IndexPath) -> Bool

optional public func collectionView(_ collectionView: UICollectionView,
didHighlightItemAt indexPath: IndexPath)

optional public func collectionView(_ collectionView: UICollectionView,
didUnhighlightItemAt indexPath: IndexPath)

optional public func collectionView(_ collectionView: UICollectionView,
shouldSelectItemAt indexPath: IndexPath) -> Bool

optional public func collectionView(_ collectionView: UICollectionView,
shouldDeselectItemAt indexPath: IndexPath) -> Bool // called when the user
taps on an already-selected item in multi-select mode

optional public func collectionView(_ collectionView: UICollectionView,
didSelectItemAt indexPath: IndexPath)

optional public func collectionView(_ collectionView: UICollectionView,
didDeselectItemAt indexPath: IndexPath)
```

> cell의 item을 터치 하면, 위의 Delegate가 불리게 되는데, 그 순서가 단어때문 모호하다. 그래서 명확하게 언제 불리는지 알아야 해서 print를 찍어 보았더니, 아래의 결과를 확인할수 있습니다.
>  
> high -> didHiht -> didUnHigh -> shouldSelect -> didSelect 순서로 불렸습니다..
> 
> high, should, did 의 시점 차이를 정확하게 이해하고 있어야 합니다.

---

