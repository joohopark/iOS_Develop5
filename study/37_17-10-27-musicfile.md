# 37_17-10-27

---

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