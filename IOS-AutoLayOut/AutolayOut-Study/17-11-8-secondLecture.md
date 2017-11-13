# 17-11-8

---

# Calc_1_StackView

계산기를 StackView로 만들기 

상황에 따라서 크기가 변하는거라면, Priority 값을 주어야 하지만, 그렇지 않은 경우는 Priority 값을 주지 않아도 됩니다.

stackView로 묶어놓으면, witdh 를 잡을때, 멀리플라이어로 잡아주고, height 를 잡아줄때는 `Aspect Ratio` 로 잡아주면 편하게 잡아줄수 있음..!

StakcView는 4개의 버튼이 있어도, 한개의 높이만 지정해주면 모두 같이 높이가 늘어나기때문에, StackView안에 있는 한개의 button의 높이를 Aspect Ratio 로 잡아주게되면, 편하게 사용할수 있다.

| StackView | Aspect Ratio |
| :---: | :---: |
| ![screen](/study/image/StackView.jpg)] | ![screen](/study/image/StackView-1.jpg)] |

> Aspect Ratio 는, 그냥 선택하면 바로 변하지 않고, 일단 Aspect Ratio 추가후, 따로 Multiplier 를 조정해서 설정해주어야 합니다..!
> 
> 일반적으로, 위치나 크기가 균등하다면 StackView가 편하다..! 

---

# Calc_2_rotate

LandScape 에서 보여지는 부분만 따로 표시하는 방법.

상황에 따라서 `instalied` 하여 portarit, landScape 일때 화면 구성을 다르게 해줄수 있습니다.

---

## Dynamic_Text
























