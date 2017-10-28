# 37_17-10-26

---

## UICollectionView

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

## Item Size, Item Spacing, Line Spacing 

| Item Size | Item Spacing | Line Spacing |
| :-------: | :-------: | :-------: |
|![screen](/study/image/UICollectionView-3.jpg) |![screen](/study/image/UICollectionView-4.jpg) | ![screen](/study/image/UICollectionView-5.jpg) |
















> 채용해야 하는 프로토콜들이 있다.


- UICollectionViewDataSource
 	-> DataSource 를 사용하는것..!
 	
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
        
        return 30
    }
// line Spacing    
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 100
    }

 -> 조금 햇갈릴수 있는 두 개념인데, 기준을 collectionView의 `scroll direction` 방향에 따라서 생각하면 조금 편해진다..! 
 
 

 





// CustomCell 사용시 현재 Cell을 각 indexPath에 따라서 인스턴스로 만들어서 사용할수 있는 프로퍼티
let cell = collectionView.cellForItem(at: indexPath) as? CustomCell




## collectionView

z 축을 통해서 lay의 앞뒤를 구분할수 있게 됨..

델리게이트 프로토콜은 3개 

Presentation 
	- UICollectionResuableView
	- UICollectionViewCell

	두개를 사용해야함..
	
**테이블뷰에서는 현재 색션은 reuseable하지 않았는데 사실은 가능하다는 이야기..? 이거 한번 찾아봐야 겠당**

View를 재사용하는 아이들의 모음 -> CollectionView 라고 생각해보자.

`cell` 과 `layOut` 을 통해서, View의 모습을 뿌려주는 순서와, View가 뿌려질때 `LayOut` 을 통해서 그 모습을 정의 할수 있다. 

 -> 자유도가 엄청 높은 녀석이다.
 
 
 #### - Section Layout 
 
 **Layout**에 따라서 한 화면에 보이는 것임. section의 크기는 ViewController 의 총 길이가 아니라. Cell과, cell 사이의 스페이싱에 따라서 ViewController 의 화면 전환 간의 간격이 정해지게된다. 
 
 해더와, 풋터를 `reuseable` 하기때문에 `reuseable` 이라고 부른다..? 
 
 해더와 풋터가 decorationView, supplementary View 역활을 함..?



#### prefetching : 데이터를 미리 로드할수 있게 만들어 놓은공간, 테이블뷰에서 다음 cell을 로드할때, 네트워크를 갔다와서 데이터를 받아와야하는데, 그 과정 이전에 데이터를 prefetching 해서 사용할수 있다. 

우리가 만들려고하는 quora 에서 적용해봐도 재미있을것 같다..


private 을 class 

하나의 노래의 metadata를 가져오면, 그 안에 있는 여러가지 아이템들을 가져올수 있음. 그 데이터들의 타입은 metadataItem 이다.


lyric => 가사를 가져올수 있음.


---

UItabBarController 

ViewController 들이 Array안에 들어가져 있다.

tintiColor 는 png 에만 적용 됨, jpg 에는 적용 안됨.

시스템 색상 이다...?