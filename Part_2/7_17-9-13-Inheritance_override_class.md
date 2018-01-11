# 9.13(수)
---

## Class, Inheritance, Polymorphism, Override, Super, Overload
  
---

## Class Inheritance 

#### - Class 정의, 상속 하기

Class 를 정의하면, baseClass, instance 가 됩니다. Swift 에서는 Class 로 정의된 Name 자체가 하나의 Type 으로 사용되어 지기 때문입니다. 상속을 할때 최상위 Class는 **SuperClass**가 됩니다. 
그 구조를 살펴 보면 **SuperClass -> SubClass -> SubClass1....** 클레스 속에, 포험되어 지는 구조로 변경되어 부모를 상속은, 자식 클레스는, 부모의 프로퍼티, method 를 사용할수 있게 됩니다.

```swift
class Computer {
    var core = 0
    var description:String {
        return "My computer core is \(core)"
    }
    func calculator() {    
    }
}
class Cpu: Computer {   
    var cpu = 0
}
var man = Cpu()
man.core = 10
print(man.description)

class Memory: Cpu {
    var Memory = 4
}

var girl = Memory()
girl.Memory = 10
girl.cpu = 10
girl.core = 10
print(girl.Memory, girl.cpu, girl.core, girl.description)
```

#### - Override, Super 사용하기

서브클래스(subclass)는 인스턴스 메소드, 타입 메소드, 인스턴스 프로퍼티, 타입 프로퍼티 또는 서브스크립트를 슈퍼클래스로(superclass)부터 상속받은 것과 다르게 사용자정의 구현을 제공할 수 있고, 이것을 오버라이딩(overriding)이라고 합니다. <br>

오버라이드 하는것은 상속된 것과 다른 특성이 되며, override키워드를 접두사로 붙여 오버라이딩하는 것을 정의합니다. <br>
override 키워드는 Swift컴파일러가 오버라이딩 클래스의 슈퍼클래스(또는 부모)가 가지는 정의와 오버라이드에 제공된 것과 일치하는지 확인하도록 요청합니다. 이 검사는 오버라이딩 정의가 올바른지 확인합니다. <br>

```swift
** override  method ** 
class Computer {
    
    var core = 0
    var description:String {
        return "My computer core is \(core)"
    }
    func calculator() {
    }
}

class Cpu: Computer {
    var cpu = 0
    override func calculator() {
        print("계산기가 수정되었습니다..")
    }
}

var man = Cpu()
man.calculator() -> override method 된 계산기 기능이 실행됨.. 

** override propertise, override properitse getter and setter  **
class Computer {
    var core = 0
    var description:String {
        return "My computer core is \(core)"
    }
    func calculator() {
    }
}

class Cpu: Computer {
    var cpu = 0
    override var description: String {
        return super.description + " I`m Cpu \(cpu)"
    }
    
    override func calculator() {
        print("계산기가 수정되었습니다..")
    }
}

var man = Cpu()
man.cpu = 10
man.core = 20
print(man.description) --> 기본적으로 super. 사용하면, 해당 클레스의 super class 의 값을 가지고온다. 
```

---

## Class 가지고 놀기(예제)

 - Class Accout  
 
```swift
class Account {
    var bankName:String = ""
    var depositMoney:Int = 0
    init(bankName:String) {
        self.bankName = bankName
    }
}

class Who {
    var name:String = ""
    var address:String = ""
    var myAccount:[Account] = []  //타입을 지정할때, 햇갈리는경우가, class 에서 변수를 만들때, 내가 넣고자 하는 타입의 끝값을 명확하게 명시해줘여한다.
    
    init(name:String, address:String) {
        self.name = name
        self.address = address
    }
    
    func getAcount(get:Account) // 인스턴스들을 리스트에 myAccount 에 집에 넣음. {
        myAccount.append(get)
        print(myAccount) // 인스턴스들을 넣음. 인스턴스 안에는 은행의 이름과, 계좌를 만듬.
    }
    
    func totalAcount() -> Int // 계좌의 총합 구함 {
        var total:Int = 0
        for i in myAccount {
            total += i.depositMoney 
        }
        return total
    }
    func depositMony(bank:String, money:Int) // 한계는, 계좌 최대 2개 만 설정가능.. 이거 알고리즘 짜면 알수 있다. {  
        if bank == myAccount[0].bankName {
            self.myAccount[0].depositMoney += money
        }else {
            self.myAccount[1].depositMoney += money
        }        
    } 
}

 //한명은 계좌 2개, 한명은 계좌 1개.

var shinhan:Account = Account(bankName: "신한은행")
var kbBank:Account = Account(bankName: "국민은행")

var kakaobank:Account = Account(bankName: "카카오은행")

var minjun:Who = Who(name: "민준", address: "안산시")
var siri:Who = Who(name: "시리", address: "가상세계")

minjun.getAcount(get: shinhan)
minjun.getAcount(get: kbBank)

siri.getAcount(get: kakaobank)

minjun.depositMony(bank: "신한은행", money: 3000)
minjun.depositMony(bank: "국민은행", money: 8000)

minjun.depositMony(bank: "신한은행", money: 9000)
siri.depositMony(bank: "카카오은행", money: 20000)

print(minjun.myAccount[0].depositMoney)
print(minjun.myAccount[1].depositMoney)
print(siri.myAccount[0].depositMoney)
```