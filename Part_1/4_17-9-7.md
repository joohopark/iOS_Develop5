# 17.9.7(목)

---

## collection Type, Array, set, Dictionary 문법, quiz

---

## collection Type

하나의 값이 여러개가 모여 있는 타입을, Collection Type 라고 정의합니다 ex) Array, Set, Dictinary

---

## Array

#### - 정의

배열은 같은 종류의 데이터들이 순차적으로 저장되어 있습니다. 배열에 INDEX 번호를 부여해서, 값에 접근할수 있습니다.


#### - 문법

```swift
var someInts:[Int] = [Int]()
var someInts:Array<Int> = Array<Int>()

ex)
var someInts:[Int] = [1,2,3,4]
someInts = [1,2]
-> someInts 배열 값 변경됨.
```

---

## set

#### - 정의 	

여러개의 데이터들이 순서 없이 들어간 형태.

- 문법<br>
 
```swift
var some:Set<Int> = Set<Int>()
a.intersection(b) : 교집합
a.symmetricDifference(b) : 교집합을 제외한 합집합
a.union(b) : 합집합
a.subtraction(b) b의 교집합을 제외한 a
```

---

## Dictionary 

- 정의 <br>
	- key : value 값을 통해서 데이터 묶음을 만듬 key, value 값을 가지고 각각의 값들에 접근할수 있다.
- 문법 <br>

```swift
var someInts:[String:Int] = Dictionary<Any>()
```

---

## Quiz

- input 값으로 월과 날짜를 넣으면 요일 반환하는 함수 만들기 
 
```swift
func getWeek(_ month:Int,_ day:Int) -> String {
    var value:Int = 0
    var ofWeek:[String] = ["일", "월", "화", "수", "목", "금", "토"]
    var dic:[Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    if month == 1 {
        value = day
        value = value / 7
        var value1:String = ofWeek[value]
        return value1
    } else if month > 2 {
            for i in 0...(month-2) {
            value += dic[i]
        }
    }
    
    value = value / 7
    var value1:String = ofWeek[value]
    return value1
}
print(getWeek(1,2))
```


- 중복 숫자 줄이기 함수
 
```swift
func shoter(_ num:Int) -> [Int] {
	var number = num
   var list:[Int] = []
   var list1:[Int] = []
	var list2:[Int] = []
    
    while number >= 1 && number != 0 {
        list.insert(number % 10, at: 0)
        number /= 10
    }
    //list 에는 인풋값이 리스트로 만들어진상태
	
	for i in 0...(list.count-1) {
		if list1.contains(list[i]) == true {
			list2.append(list[i])
		}else {
			list1.append(list[i])
		}
	}
	return list1
}
print(shoter(100121333))

-> input 값을 [input value] 로 만들고 -> [빈 list] 에 [input value] 안에 있는 값이 있는지 검사하고, 값이 있으면 넣지않고, 없으면 넣어서 중복 값을 찾아줌. 여기서 문제는 숫자 '0' 이 맨 앞으로 오면 0을 리스트에 넣어주지 못함.. 이거는 문자열을 나중에 슬라이싱 하는 방법을 배우면 다시 풀어보자.
```


- 소수 찾기 함수 
 
```swift
func allPrimNumber(_ num:Int) -> [Int] {
    
    var num:Int = num
    var list:[Int] = []
    var list1:[Int] = []
    var list2:[Int] = []
    
    while num >= 2 {
        list.insert(num, at: 0)
        num -= 1
    }
    // list 에 2부터 num 까지의 값이 들어가 있음.
    
    
    for i in 0...list.count-1 // list.count-1( list의 인덱스 숫자 만큼 for 이 돌음) {
        var x:Int = 0
        
        if list1.contains(list[i]) == true // list1에 list에 있는 값이 있으면 넣지 않음. {
            print("\(list[i]) 는 소수가 아닙니다.")
        } else if list1.contains(list[i]) == false //list1 안에 list값이 들어있지않으면 > 소수 {
            list2.append(list[i])
            while x < list[list.count-1] // 소수인지 판별하는 대상값을 list의 마지막 값까지 배수하는것! {
                x += list[i]
                list1.append(x)
            }
        }
    }
    return list1
}
print(allPrimNumber(11))
```


- 시저 암호 구현(input 값이 a,b,c,d -> e,f,g,h)
 
```swift
func ceasar(_ data:String,_ data1:String,_ data2:String,_ data3:String,_ keynum:Int = 4) -> [String] {
    var list:[String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","j","u","v","w","x","y","z",]
    var list1:[String] = []
    
    var new_list:[String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","J","U","V","W","X","Y","Z"]
    var new_list1:[String] = []
    
    let data:String = data
    let allData:[String] = [data, data1, data2, data3]
    print(list.count)
    
    for j in allData // for 을 data 값을 기준으로 돌려줍니다 {
        for i in 1...list.count // 인풋값을 찾으면 list1에 +4 인덱스값을 해서 추가해주고, 맨뒤에 값들도 걸러내주게 변경해줍니다.
        {
            if "\(j)" == new_list[i-1]
            {
                if "\(j)" == new_list[list.count-4] //list.count-1 은 index의 마지막 값 -> 인덱스 넘어가면 앞으로 돌려줌
                {
                    list1.append(new_list[0])
                }
                else if "\(j)" == new_list[list.count-3]
                {
                    list1.append(new_list[1])
                }
                else if "\(j)" == new_list[list.count-2]
                {
                    list1.append(new_list[2])
                }
                else if "\(j)" == new_list[list.count-1]
                {
                    list1.append(list[3])
                }else {
                    list1.append(new_list[i-1+keynum])
                }
            }
            else if "\(j)" == list[i-1] {
                if "\(j)" == list[list.count-4] //list.count-1 은 index의 마지막 값 -> 인덱스 넘어가면 앞으로 돌려줌
                {
                    list1.append(list[0])
                }
                else if "\(j)" == list[list.count-3]
                {
                    list1.append(list[1])
                }
                else if "\(j)" == list[list.count-2]
                {
                    list1.append(list[2])
                }
                else if "\(j)" == list[list.count-1]
                {
                    list1.append(list[3])
                }else {
                    list1.append(list[i-1+keynum])
                }
            }
        }
    }
    return list1
}
print(ceasar("W","X","y","z"))
```


