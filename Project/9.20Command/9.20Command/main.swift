// 우리가 일반적으로 사용하고 있는 func은 사실은 closure의 일종이다. 근데 이름이 있는 closure이다...


// closure는 이름이 없는 익명 함수 인데, 이것을 사용할때 사실을 일반적인 python의 lambda의 사용 처럼 간단하게 사용할수 있는데, 기본적으로, 

// first class function의 조건 3가지 1. 함수를 인자로 전달할수 있느냐, 2. 함수를 반환할수 있느냐ㅐ, 3. 함수를 변수에 저장이 가능하느냐 이 3가지를 가지고, closure를 어떻게 사용하는지 찾아갈수있다. 

// 함수를 인자로 전달이 가능한지를 정의 할때, 같은 type를 내가 사용하고자 하는 함수와 같은 타입으로 인자를 반환할수 있게 설계 해놓으면, 그것 그대로 사용할수 있다.



// 함수를 변수에 저장할수 있다.

func f(a: Int, b: Int) -> Int {
    return a+b
}

var deliveryfunt = f

// 함수를 인자로 전달할수 있고, 함수를 반환할수 있다. : 내가 설계한 함수의 반환이 같으면 인자로 전달이가능함.

func g(funt: (Int, Int) -> Int, a: Int, b: Int) -> Int {
    
    return funt(a, b) // 함수를 반환함.
}

print(g(funt: f, a: 10, b: 20))


// 위의 3가지 조건이 충족되면 frist Class 충족해서 closure 를 사용할수 있다. 


var m = 1000000

func testClosure(name:String, m:inout Int) -> String  {
    
    func add(money: Int) -> String {
        m += money
        
        return name
    }
    return add(money: m)
}


var f1 = testClosure(name: "min", m: &1000)








