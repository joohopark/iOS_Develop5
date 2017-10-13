# 25_10-10

---

## Refrence

## [AutoLayOut PDF](/study/image/AutoLayOut.pdf)

---

## autoLayOut 

- apple에서 권고하는 autoLayOut은 6, 7, 사이즈 들을 고려하고, + 계열은  + 계열 끼리 고려해서 만들어 주는것을 권고한다.

- Device가, 가로,세로 모드일때 자동으로 변경되는것을 선택 하는것은 xcode.. 설정에 있음..

- notification 하는방법 찾아보자.

- addTaget 방식으로 하는 방식은 customView에서 addTaget 안에 그 파라미터를 그대로 받아서, 전달하려는 customView에서 controll 할 btn에 btn.addTaget.... 해서 받은 파라미터를 그대로 넘겨 주어서 실행해줌.. 약간 fake? 같은 느낌으로 만들수 잇다.

- autoLayOut에서 복붙이 안되는 이유는, constraints의 적용 되는 구조가 view 기준으로 적용되는것도 있고, superView 기준으로 적용되는것도 있어서, 복붙은 조금 위험한 생각이다.

- 픽셀과 포인트의 차이점 그리고 포인트 에서 1 포인트를 주는 이유는, 사실 디스플레이 되기 위해서는 한줄이 보여야 하는데, 그 겹치는 경계 구간에 갔을떄 보여줌.

- 4:3 비율은 전체 스크린을 쪼개서, 나누어준것으로 계산할수 있다.


---

## StackView

- 효율은 좋지만, 일반적인 경우보다 소스를 많이 먹어서, 조금 느리다

---

## 정리


![screen](/study/image/AutoLayOut.jpg)

> 왼쪽부터 1~6번까지, AutoLayOut 
> 
> 1번은 비율로 뷰의 크기를 결정
> 
> 2번은 크기와, 가운데에 고정해서 AutoLayOut
> 
> 3번은 stackView를 사용해서, 만들었다. stackView 사용 하는 방법을 찾아가보자.
> 
> 4번은 가운데를 기준으로 3등분 되는 지점을 기준 으로 만들었다.
> 
> 5번은 3번의 스텍뷰로 만들기 전에, autuLayOut 를 사용해서 만들었다.
> 





