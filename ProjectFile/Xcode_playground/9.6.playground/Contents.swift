//: Playground - noun: a place where people can play


// 1. 윤년을 구하는 문제. 100으로 나누어 떨어지는 해는 윤년 아님, 400으로 나누어 떨어지는것은 윤년

func check(leapYear:Int) -> String {
    
    if leapYear % 400 == 0 && leapYear % 100 == 0 {
        return ("\(leapYear) 는 윤년 입니다.")
    }
    else if leapYear % 100 == 0 && !(leapYear % 400 == 0)
    {
        return ("\(leapYear) 는 윤년이 아닙니다.")
    }else {
        return ("\(leapYear) 는 윤년이 아닙니다.")

    }
    //return 0
    
    
}
print(check(leapYear:4000))
//
//
// 2. 각 자리수 더하는 함수

func addAllDigit(num:Int) -> Int
{
    var returnValue:Int = 0
    
    if num < 10 {
        return num
    }
    else if num < 100 {
        var x:Int = 0
        var y:Int = 0
        x = num % 10 // 일의 자리
        y = (num - x) / 10 // 십의자리
        returnValue = x + y
        return returnValue
    }
    else if num < 1000 {
        var x:Int = 0
        var y:Int = 0
        var z:Int = 0
        var r:Int = 0
        
        x = num % 10 // 일의 자리
        y = (num % 100 - x) / 10 // 십의자리
        z = (num % 1000 - y - x) / 100 // 백의자리
        r = (num - x - y - z) / 1000 // 천의자리
        returnValue = x + y + z + r
        return returnValue
    }else {
        return returnValue
    }
    
    
}
print(addAllDigit(num:123))  // 4 자리 까지만 구현 가능함.


//  숫자 리버스
//


func reverse(num:Int) -> String
{
    var str: String = ""
    var number = num
    
    
    while number >= 1 && number != 0
    {
        str = str + "\(number % 10)"
        number = number / 10
    }
    
    return str
}

print(reverse(num:123))

// 123 의 숫자를 거꾸로 출력한다는 발상을 새롭게, 남은값의 일,십,백의자리를 뽑아주는 방식으로 구현함.


// 별그리기

func drawStar(line:Int) {
    
    var str:String = ""
    var str1:String = " "
    var str2:String = ""
    
    for i in 1...line
    {
        str1 = " "
        str2 = ""

        for j in 1...(line+1 - i)  // 빈칸
        {
            
            str1 = str1 + " "
        }
        for k in 1...(2*i-1) //별
        {
            
            
            str2 = "*" + str2
        }
    str = str1 + str2
    print(str)
        
    }
}

var a:String = " "
var b:String = "*"
var c:Int = 1



var res = drawStar(line:3)
print(res)
var li:[Int] = [1,1,3,3,4,4]
var li1:[Int] = []
var li2:[Int] = []


for i in li {
    li1.append(i)
    
}
print(li1)
for i in 1...(li1.count-1) {
    
    if li1[i] == li1[i+1] {
        print(li1[i])
    }	
}





