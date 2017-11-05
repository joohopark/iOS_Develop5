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
	- autoLayout 을 하나만 적용되면, 오류가 나옴.

- 정렬을 하기 전에, 크기를 지정해주고함. 이유는 원래의 이미지가 엄청 큰 것 이기때문에, 크기를 지정하고 -> 정렬을 하면, 지정한 크기에 정렬이됨.

- 이미지를 부모뷰의 끝에 걸쳐지게 하고싶은데, 정렬의 
- 부모뷰를 넘어가는 부분은 옵션에 따라서 짤리게됨.(clip to bounds)
- 문제가 생기는 이유는, View에 라운딩 처리를 하기 위해서는 clip to bounds 를 사용해야함. -> 라운딩을 포기하면, View를 넘어가게 하는 정렬은 소용없는 요소가됨.
- `부모View를 넘어가는 정렬은 일반적으로 사용하지 않음.`

- 동등한 레벨로 정렬
-  Edges 정렬 

```
item1.atrribute = 비율 * item2.atrribute + 간격 
```

**- 동등한 위치에서 정렬을 하는게, button 을 클릭하는것도 가능함. **
**- 부모뷰의 범위를 넘어가면 click 도 먹지 않음..**

---

## basic8_Hugging_Priority

- Lable
	- 레이블 사이즈를 키워즈는 명령어 `edit->size to fit`, `command + =`, 텍스트의 크기 만큼 사이즈가 지정이됨.
**- 레이블에 위치지정을 하면, 텍스트의 길이가 늘어남에 따라서, 자동으로 레이블의 크기가 증가함**

- 한쪽이 열려 있어야(Constraints) label의 사이즈가 변경됨.
- 레이블은 AutoLayout을 적용해주면, 현재 디바이스에서는 괜찮은데, 다른 디바이스가 되면 오류가남..? 
- 우선순위를 잡아놓지 않으면, 변하지 않는게 기본 셋팅이다...?
- 텍스트 크기에 따라서 레이블이 줄어들고, 늘어나고 해야하는데, 레이블은 이부분이 자동으로 되지 않음. 내가 셋팅을 해주어야함.

huggin, compression resistance 오류에 대한 설정을 해주어야함(우선순위)
-> 늘어날수도 있고, 줄어들수도 있는개념..

사이즈 인스펙터에 가면, Content Hugging Priority, Content Compression resistance Priority


Content Hugging Priority : 기본적인 자신의 사이즈를 유지 하겠느냐 안하겠느냐..?
Content Compression resistance Priority :

상대적으로 Hugging 이 높은 숫자가 우선권을 가지고 -> 우선적으로 그 View가 셋팅이됨. 그래서 의존적인 부분이 어느 부분인지가 결정이됨.

낮은 숫자의  Hugging Priority 는 의존적으로 늘어난다..?

Priority(우선순위) -> 우선순위를 낮추게 되면, 제일 높은 숫자가 먼저 사이즈대로 fit을 하고, 252가 내 사이즈대로 fit을 하고, 그 다음에 낮은 우선 순위의 priority의 

낮은 우선 순위는 늘어나거나, 줄어들수 있음..

레이 아웃을 잡을때 모든 View, 각 Constraints 들은 Priority 를 가지고 있는데, Priority 값이 높은 순서대로, 자신의 본연의 사이즈를 fit 하고, 그 다음 순위 별로 Priority의 Rect 값을 셋을 하고, 가장 낮은 priority 는 의존적으로 자신의 Rect가 늘어나고, 줄어들고 할수 있음.

---

## basic9_Compression_resistance_priority

우선 순위가 높으면, 정확하게 내 자신의 크기대로 유지를 하고, 우선순위가 낮으면, 내 크기보다 커지거나, 작아질수 있다. 

내 크기를 높이는데, 반대되는 경우가 `Compression_resistance_priority`

내 크기보다 작아지는 형태를 -> 반발하겠음 -> prioty 가 높으면 내 크기를 유지하는것이고, 작아지면 내 크기가 작아진다..?

서로가 딱 맞아 떨어지지 않는다면, 우선순위를 유지 해야함. 내 크기를 유지하지 못할때, 

같거나 커질때는 : hugging prioty
같거나 작아질때 : compression Resitance

레이블 속의 텍스트 크기를 늘렸을때, 나와 상대되는 레이블이 있을때, Compression의 값이 작은 쪽이 찌그러지게되고, 값이 큰쪽의 사이즈를 유지한다..?

위의 두개의 값이 어떤 차이가 있는지... 확실하게 이해하고 정리하자.

---

## basic10_image_resolution

- button에 이미지가 추가 됬을경우, 오른쪽이나, 왼쪽에 추가 되었을 경우.. 버튼 타이틀은 오른쪽으로 밀려서 정렬이됨...?

- imageView 의 특성에 대해서 설명하기 위해서, 이미지별로 다른 해상도..
300 짜리 픽셀.. 
- 디바이스에 이미지, 픽셀에 대해서 확실하게 알고 있어야한다...?

`이미지뷰에 command + =`하게되면, 이미지의 원래 사이즈로 변환시켜주게됨..!

@2x, @3x 가 없으면, 이미지의 원래 픽셀 사이즈로 나오게함.
@2x 들은 아이폰 시리즈에서 사용이됨. 
@3x 는 아이폰 플러스 같은 디바이스에서 사용되고 

---

## basic11_align 

버튼의 타이틀 정렬을 주어야함.

inset 이라는 간격을 줄수 있는 
기본적으로 버튼은 타이틀과, 이미지로 구성을 할수 있음. 

`Content Insets` 은 타이틀과 이미지 인셋을 같이 주겠다는 이야기.

준 값 만큼, 가운데 정렬..?

---

## basic12_align 

정렬 부분에서 x,y 의 값에 따라서 정수값, 음수값을 지정해줄수 있는데, 이것은 autolayOut 의 공식에 따라서 atrribute를 주는 것을 생각하자.

- 이미지를 줄여서 살아서 사용하라고 하는 경우가 많이 있음.
- 이미지를 내가 알아서 줄여서 사용해야함..

여러가지 이미지를 내가 원하는 이미지의 autuLayout 으로 사용하려면, 내가 사이즈를 애초에 지정해놓고 사용하면 됨..! 아항..?

---

## basic13_Rotate

- 화면의 회전에 따라 변화율 

기본 postirate

`Vary For traits` -> 상황에 따라서 달라진다라는 버튼..?

어떤 상황이냐에 따라서 설정을 해주어야 함
Width -> 디바이스 제일큰 `Landscape`만 빠진상태로 적용된 상태임. 
Height : -> 모든 landscape 믄 적용되지않고, fortratite만적용됨..?

파란 상태일때, 적용을 하면, 해당 디바이스에 적용이된다고 생각하면됨.

각각 회전 되었을때, 어떻게 적용할지에 대해서 적용 놓는 방법을 작성해서 정리 해놓자..! 

회전 되었을때마다 각각의 view들의 autoLayOut을 모두 다시 잡아줘야하는구나..하핳..

---

## basic14_ScrollView

contents가 많을 경우 autoLayout 이 적용되는 경우를 보는것..

ScrollView 안에 View는 사이즈를 지정해주어야함, 그래야지 에러가 나지않음.

ScrollView의 조정하려고 하는 ContentsView의 간격을 늘어나거나 줄어들게 하기 위해서 priotiry 값을 낮춰준다.

핵심은 ContentsView의 bottom 값의 priority 를 낮추어 주어서 ContentsView의 값을 늘어나고, 줄어나고 변화는것을 유동적으로 확인할수 있음.

---

## basic15_margin

autoLayout 에서 margin 은 조금 애매한 기능인데..

위의 system 적인 값으로 statusBar 

margin 을 

`option 누르고 객체 누르면 autoLayOut 값을 볼수 있음.`

가장 상위뷰를 기준으로 margin이 왼쪽, 오른쪽만 잡힘.

margin 이라고 하는것은, 최상단뷰를 기준으로, 맨 왼쪽 오른쪽만 간격이 잡히고, 그 아래쪽에 있는 object(왼쪽, 오른쪽, 위, 아래) 들은 8이라고 하는 숫자들만 간격이 잡힘

작은 아이폰의 margin 은 최상단 뷰를 기준으로 제일큰 아이폰은 margin이 20 잡히고, 작은 아이폰들은 margin이 16이 잡힘. 

`landscape` 되었을때, 작은 아이폰일때 margin이 20이되고, 
큰 아이폰 일때 `landscape` 가 16이됨..?

magin이 애매한 이유는, 아이폰 크기에 따라서, 회전되어있는 상황에 따라서 값이 다르다.. 사용하기 조금 애매함...

`아이템` 끼리는 마진이 지정이 되지 않음(레이블 9개 넣고 마진 확인하는것) 레이블의 가운데 부분들은 마진이 지정이 안됨..


