# 41_17-11-1

---

## Closure, Map, Filter, Reduce

---

---

## Closure 응용(Map, Filter, Reduce)

#### - Map

![screen](/study/image/Delegate-3.jpg)


> Map 은 어떤 정의역(x) 값을 받아서 y값으로 인풋을 해주느 는 함수가 있다면, 여기에서 `함수` 의 부분이 Map 의 역활이다..! 
> 

```swift
var digitNumber = 0...10
// Closure 의 타입 생략을 사용했습니다. 
let y = digitNumber.map {
    $0*10
}
print(y) // [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
```

#### - filter

``` swift
var digitNumber = 1...10
let y = digitNumber.filter { (X) -> Bool in
    return X % 2 == 0
}
print(y) // [2, 4, 6, 8, 10]
```

> filter 은 Bool값을 return 하는데, 이때 true인 값을 내부적으로 어떻게 어떻게 동작 시켜서, return 값이 true 인 값들만 filter 해서 값을 돌려줍니다
> 

#### - reduce 

![screen](/study/image/Delegate-4.jpg)

```swift
var digitNumber = 1...10
let y = digitNumber.reduce(0) { (x, y) -> Int in
    return x+y
}
print(y) // 55
let y = digitNumber.reduce(1) { (x, y) -> Int in
    return x+y
}
print(y) // 56
let y = digitNumber.reduce(2) { (x, y) -> Int in
    return x+y
}
print(y) // 57
	-> 조금 했갈릴수 있는게 reduce(X) 여기에서 X는 인자의 파라미터의 첫번째 값이 아니라 그냥 초기 값이다.
var digitNumber = 1...10
let y = digitNumber.reduce(0) { (x, y) -> Int in
    return x*y
print(y) // 0
let y = digitNumber.reduce(1) { (x, y) -> Int in
    return x*y
print(y) // 3628800
}	
```

> reduce는 피보나치 수열처럼, 받는 파라미터의 값을 이터레이터로 하나씩 하나씩 파라미터의 모든 값을 연산해줍니다.
> 

#### - map, filter, reduce 사용하기

```swift
let y = digitNumber.map {
    $0 * 1000
    }.filter({
        $0 % 2000 == 0
    }).reduce(0) {
        $0 + $1
}
print(y) // 30000
```

---

