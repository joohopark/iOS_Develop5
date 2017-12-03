class Account {
    var bankName:String = ""
    var depositMoney:Int = 0
    
    init(bankName:String){
        self.bankName = bankName
    }
}

class Who{
    
    var name:String = ""
    var address:String = ""
    //타입을 지정할때, 햇갈리는경우가, class 에서 변수를 만들때, 내가 넣고자 하는 타입의 끝값을 명확하게 명시해줘여한다.
    var myAccount:[Account] = []
    
    init(name:String, address:String){
        self.name = name
        self.address = address
    }
    
    // 인스턴스들을 리스트에 myAccount 에 집에 넣음.
    func getAcount(get:Account){
        myAccount.append(get)
        // 인스턴스들을 넣음. 인스턴스 안에는 은행의 이름과, 계좌를 만듬.
        print(myAccount)
    }
    
    // 계좌의 총합 구함
    func totalAcount() -> Int{
        var total:Int = 0
        for i in myAccount{
            total += i.depositMoney
        }
        return total
    }
    
    // 한계는, 계좌 최대 2개 만 설정가능.. 이거 알고리즘 짜면 알수 있다.
    func depositMony(bank:String, money:Int) {
        if bank == myAccount[0].bankName{
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
