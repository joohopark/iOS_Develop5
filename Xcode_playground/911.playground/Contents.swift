
/* func hello(name: String, time: Int) -> String {
 var string = ""
 for _ in 0..<time {
 string += "\(name)님 안녕하세요!\n"
 }
 return string
 }
 
 print(hello(name: "민준", time: 5)) */

// 1. inch to cm, cm to inch (2개)

func inchToCm(n:Double) -> Double
{
    
    var returnValue:Double = 0
    returnValue = n * 2.54
    return returnValue
}

print(inchToCm(n: 3))

func cmToInch(n:Double) -> Double
{
    
    var returnValue:Double = 0
    returnValue = n * 0.39
    return returnValue
    
}

print(cmToInch(n: 2.5))


//2. m2 to평 평 to m2(2개)

func mToP(n:Double) -> Double
{
    
    var returnValue:Double = 0
    returnValue = n * 0.325
    return returnValue
    
}
print(mToP(n:2))

func pToM(n:Double) -> Double
{
    
    var returnValue:Double = 0
    returnValue = n * 3.30
    return returnValue
    
}
print(pToM(n:2))


// 화씨 to 섭씨, 섭씨 to 화씨

func fahrenheitToCelsius (n:Double) -> Double
{
    
    var returnValue:Double = 0
    
    
    
    if n > 0
    {
        returnValue = n + (-18.222222)
        return returnValue
    }else if n < 0 {
        returnValue = n + (-17.222222)
        return returnValue
    }else if n == 0
    {
        returnValue = -17.222222
        return returnValue
    }
    
    return returnValue
    
}

print(fahrenheitToCelsius(n: 1))

func celsiusToFahrenheit(n:Double) -> Double
{
    
    var returnValue:Double = 0
    
    if n == 0
    {
        returnValue = 32
        return returnValue
    }
    else if n > 0
    {
        returnValue = (n*1.8) + 32
        return returnValue
    }
    else if n < 0
    {
        returnValue = (n*1.8) + 32
        return returnValue
    }
    return returnValue
}


print(celsiusToFahrenheit(n: 0))

//데이터 kb > to mb, mb to gb

func kbToMb(n:Double) -> Int
{
    
    var returnValue:Double = 0
    returnValue = n*0.000977
    return Int(returnValue)
    
}

print(kbToMb(n: 2))

func mbToKb(n:Double) -> Int
{
    
    var returnValue:Double = 0
    returnValue = n*1024
    return Int(returnValue)
    
}

print(mbToKb(n: 2))

// 시간을 -> 초단위 , 초단위 -> 시간

func hToS(h:Int, m:Int, s:Int) -> Int
{
    var returnValue:Int = 0
    returnValue = (h*3600) + (m*60) + s
    return returnValue
    
    
}

print(hToS(h:1, m:1, s:1))


func sToH(hhmmss:Int) -> Int // 6자리 시간,분,초를 받으면 초 단위로 반환하기.
{
    
    var returnValue:Int = 0
    var list:[Int] = []
    var n:Int = hhmmss
    
    print(n%100)
    
    while n > 1 && n != 0
    {
        list.insert(n%100, at: 0)
        n /= 100
        
    }
    // list에 시간, 분, 초 가 담겨 있음.
    print(list)
    
    var len_list:Int = list.count
    
    if len_list == 1
    {
        returnValue = list[0] // 초값만 들어왔을때 반환
        return returnValue
    }
    else if len_list == 2
    {
        returnValue = list[0]*60 + list[1] // 분, 초값 반환
        return returnValue
    }
    else if len_list == 3
    {
        returnValue = list[0]*3600 + list[1]*60 + list[2] // 시, 분, 초 값 반환
        return returnValue
        
    }
    return returnValue
    
}
print(sToH(hhmmss:112233))


func sToH1(second:Int) -> Int
{
    var tempSecond:Int = second
    var h:Int = tempSecond/3600
    tempSecond = tempSecond%3600
    var m:Int = tempSecond/60
    tempSecond = tempSecond%60
    var s:Int = tempSecond
    
    return (h*10000 + m*100 + s)
}

print(sToH1(second: 3600))

// collatz 추측

func collatz(n:Int) -> Int
{
    var n:Int = n
    var count:Int = 0
    
    while n > 1 //# n이 1보다 작아지거나, 1이되면 빠져나가서 값을 return 함. n이 1이 되는 경우는 n이 2일때, n이 1일때.
        
    {
        if count == 500
        {
            n = -1
            break
            
        }
            
        else if n % 2 == 0
        {
            n /= 2
            count += 1
        }
        else if n % 2 != 0
        {
            n = (n*3) + 1
            count += 1
            
        }
        else if count == 100
        {
            n = -1
            break
            
        }
        else if n == 0
        {
            n = 1
        }
    }
    return n
    
    
    
    
}

print(collatz(n:123286325789578297))





func harhad(_ n:Int) -> Bool
{
    var number:Int = n
    var list:[Int] = []
    
    while number >= 1 && number != 0
    {
        list.insert(number % 10, at: 0)
        number /= 10
    }
    // list 에 각 자리수들이 들어있음
    
    
    var value:Int = 0
    var returnBool:Bool = false
    for i in list
    {
        value += i
        
    }
    // value에 각 자리수값의 합 저장
    
    
    if n % value == 0
    {
        returnBool = true
        return returnBool
        
    }else{
        
        returnBool = false
        return returnBool
        
    }
    return returnBool
}

print(harhad(13))









/* 프로그래밍 패러 다임
 
 - 절차 지향형 프로그래밍
 : 모든것을 절차에 따라서 실행됨.
 
 - 객체 지향형 프로그래밍
 : ex) java
 :
 
 - 함수형 프로그래밍
 : 모든것을 함수로 만들어서 사용함. 함수를 짜서 만든다...  ex) swift는 함수형도, 객체 지향형도 가능함..? 기본적으로 IOS 는 객체 지향형이다..
 
 
 
 
 */