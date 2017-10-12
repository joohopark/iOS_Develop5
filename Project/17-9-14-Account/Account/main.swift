class Account
{
    var bankName:String = ""
    var depositMoney:Int = 0
    
    init(bankName:String)
    {
        
        self.bankName = bankName
        
    }
    
}

class Who
{
    
    var name:String = ""
    var address:String = ""
    var myAccount:[Account] = []  //타입을 지정할때, 햇갈리는경우가, class 에서 변수를 만들때, 내가 넣고자 하는 타입의 끝값을 명확하게 명시해줘여한다.
    
    init(name:String, address:String)
    {
        self.name = name
        self.address = address
        
    }
    
    func getAcount(get:Account) // 인스턴스들을 리스트에 myAccount 에 집에 넣음.
    {
        myAccount.append(get)

        
        print(myAccount) // 인스턴스들을 넣음. 인스턴스 안에는 은행의 이름과, 계좌를 만듬.
    }
    
    func totalAcount() -> Int // 계좌의 총합 구함
    {
        
        var total:Int = 0
        
        for i in myAccount
        {
            total += i.depositMoney
            
        }
        return total
    }
    func depositMony(bank:String, money:Int) // 한계는, 계좌 최대 2개 만 설정가능.. 이거 알고리즘 짜면 알수 있다.
    {
        
        
        if bank == myAccount[0].bankName
        {
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






//
//class Account {
//    
//    let bankName: String // 디폴트값을 아무것도 안넣어줌
//    var ammount: Int
//    
//    init(bankName: String, ammount: Int)
//    {
//        self.bankName = bankName
//        self.ammount = ammount
//        
//        
//    }
//}
//
//class Customer {
//    
//    var name: String
//    var address: String
//    
//    var accounts: [Account] = []
//    
//    init(name: String, address: String)
//    {
//        self.name = name
//        self.address = address
//    }
//    
//    func totalAmount() -> Int { // 금액의 총합을 구하는것을 구하는것이기때문에, 반환 타입을 Int 로 만든다.
//        
//        var total: Int = 0
//        
//        for account in accounts {
//            total += account.ammount
//        }
//        return total
//        
//        
//    }
//    
//    
//}
//
//
//let account1: Account = Account(bankName: "우리은행", ammount: 3000)
//let account2: Account = Account(bankName: "카카오뱅크", ammount: 5000)
//
//var Customer1: Customer = Customer(name: "라이언", address: "강남")
//
//Customer1.accounts = [account1, account2] // 아.. 이런식으로 바로 넣어줄수도 있구나..
//
//print(Customer1.totalAmount())
