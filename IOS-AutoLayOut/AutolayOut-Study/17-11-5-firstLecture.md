# 17-11-5
---

## AutoLay Out 강의 정리 내용 - ## basic1_Start

View의 특성 
 - View와 ViewController 가 스토리보드에는 같이 잡혀 있음.

AutoLayOut 

왼,오른,위,아래 간의 간격의 위치를 따라서 간격을 잡음 
Constraints
align(정렬) : 정렬은 하나만으로는 정렬이 안됨(그래서 회색으로 선택할수 없음) 

Reset to Suggested Constraints -> Xcode 자체에서 제안하는 AutoLayout 값을 설정하는데, 거의 사용하지 않는다고 생각하면됨.

autoLayOut 기본적으로 마진 값을 주지 않고 시작?

---

## basic2_Constraints

기본적으로 autoLayOut 을 적용 시키는 방법 

Leading(왼쪽), trailing(오른쪽)

마우스로 움직여도 변경이 되는데, 문제점이 생김 -> 이럴떄는 워닝(에러임)-> 지금 보이는 View랑은 다르게 나온다는 의미임.

`editer` -> `update Frames`: 내가 변경한값의 이전으로 지정하고 싶을때 `option +Command + =`
`update constraints` : 내가 변경한 Constraints의 값을 변경 시킨다는의미 

---

## basic3_Constraints

View가 여러개일때, 여러개의 뷰를 동시에 작업할때, 하나만 표시됨. 

레이블은, 기본 크기가 잡혀있음(텍스트에 따라서) 
일반 View는 기본적은 크기가 잡혀 있지 않기 때문에, 크기를 지정해주라고 에러가 생김

- 아이폰 사이즈에 따라서, 고정 사이즈에 따라서, 상대적으로 변함..

빨간뷰와, 녹색뷰가 같은 크기 여야 할경우.

---

## basic4 _Constraints
- 오른쪽 마우스를 누르면, 타겟팅을 지정 해줄수 있음.

- View에 대한 값들을 같이 움직이게 하고싶으면, 하나의 기준뷰를 기준으로, 각각에 대한 제약들을 수정해가면서, 원하는 autoLayOut 을 적용시켜 줄수 있다.


---

## basic5_Constraints_Multiplier

- 비율의 변화

first Item 은 적용될 대상 View, SecondView는 현재 자신의 View

multiplier 를 적용 시킬때 1:2, 1:3... 등등 정수가 아닌 값으로 조건을 줄수 있음.

오토레이아웃을 줄때, 적용될 대상과, 현재의 대상에 차이에 따라서 비율을 다시 주어야함..

---

## basic6_Constraints_Multiplier

- 정렬 Align
	- 하나만 선택했을때는 ,가로 정렬, 새로정렬을 할수 있음.	- 비율 정렬시, `0`은 작성할수 없음. -> 0과 비슷한 값 0.001.. 값을 입력해주면, piexle 의 오차가 조금 있을수 있지만, 거의 사용하지 않음. 

---

## basic7_Constraints_Multiplier

- View의 반쯤 걸쳐져 있는









