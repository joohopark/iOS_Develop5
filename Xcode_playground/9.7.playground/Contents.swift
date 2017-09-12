//: Playground - noun: a place where people can play

// import Foundation
import UIKit


var list:[Int] = []
var count:Int = list.count // 색깔만 가지고도 인트인지 아니지 알수있음.
print(count)

list.append(3)
list.append(contentsOf: [1,2]) // 두개의 append의 사용방식이 차이가 있음.

count = list.count
print(count)
print(list[0])

list.insert(1, at: 0)
print(list)

list.remove(at: 0)


print(list)

//////////////////set 

var setList:Set<Int> = [1,2,3,4]
setList = []

print(setList)

setList = [1,2,3,4,5]

var oddDigits : Set = [ 1, 3, 5, 7, 9 ]

var dic:[String:String] = ["ICH" : "인천", "CJU" : "제주공항"]
print(dic)

var dic1 = oddDigits.sorted()
print(dic1)
///////////////////////////////////////////////////////

// 1. month 와 day를 받아서 요일 구하기

func getWeek(_ month:Int,_ day:Int) -> String
{
    
    var value:Int = 0
    
    var ofWeek:[String] = ["일", "월", "화", "수", "목", "금", "토"]
    var dic:[Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    if month == 1
    {
        value = day
        value = value / 7
        var value1:String = ofWeek[value]
        return value1
        
    }
    else if month > 2
    {
        
        
        for i in 0...(month-2)
        {
            value += dic[i]
        }
    }
    
    value = value / 7
    var value1:String = ofWeek[value]
    
    return value1
}


print(getWeek(1,2))
   // - > 총 day 를 7로 나누어서 요일 인덱스 값으로 받아서 처리함!


// 2. 인풋값을 받아서 중복 숫자를 줄이기!


func shoter(_ num:Int) -> [Int]
    
{
    var number = num
    var list:[Int] = []
    var list1:[Int] = []
    var list2:[Int] = []
    
    while number >= 1 && number != 0
    {
        list.insert(number % 10, at: 0)
        number /= 10
    }
    //list 에는 인풋값이 리스트로 만들어진상태
    
    for i in 0...(list.count-1)
    {
        if list1.contains(list[i]) == true
        {
            list2.append(list[i])
        }else {
            list1.append(list[i])
        }
    }
    return list1
}

print(shoter(100121333))
    
//    -> input 값을 [input value] 로 만들고 -> [빈 list] 에 [input value] 안에 있는 값이 있는지 검사하고, 값이 있으면 넣지않고, 없으면 넣어서 중복 값을 찾아줌. 여기서 문제는 숫자 '0' 이 맨 앞으로 오면 0을 리스트에 넣어주지 못함.. 이거는 문자열을 나중에 슬라이싱 하는 방법을 배우면 다시 풀어보자.

// 3. 소수를 찾는 함수 

func allPrimNumber(_ num:Int) -> [Int]
{
    
    var num:Int = num
    var list:[Int] = []
    var list1:[Int] = []
    var list2:[Int] = []
    
    while num >= 2
    {
        list.insert(num, at: 0)
        num -= 1
    }
    
    // list 에 2부터 num 까지의 값이 들어가 있음.
    
    
    for i in 0...list.count-1 // list.count-1( list의 인덱스 숫자 만큼 for 이 돌음)
    {
        var x:Int = 0
        
        if list1.contains(list[i]) == true // list1에 list에 있는 값이 있으면 넣지 않음.
        {
            print("\(list[i]) 는 소수가 아닙니다.")
        }
            
        else if list1.contains(list[i]) == false //list1 안에 list값이 들어있지않으면 > 소수
        {
            list2.append(list[i])
            
            while x < list[list.count-1] // 소수인지 판별하는 대상값을 list의 마지막 값까지 배수하는것!
            {
                x += list[i]
                list1.append(x)
                
            }
        }
    }
    return list1
    
}


print(allPrimNumber(11))


// 4. 시저암호 -> 대, 소문자 구분 완려ㅛ

func ceasar(_ data:String,_ data1:String,_ data2:String,_ data3:String,_ keynum:Int = 4) -> [String]
{
    var list:[String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","j","u","v","w","x","y","z",]
    var list1:[String] = []
    
    
    var new_list:[String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","J","U","V","W","X","Y","Z"]
    var new_list1:[String] = []
    
    let data:String = data
    let allData:[String] = [data, data1, data2, data3]
    print(list.count)
    
    for j in allData // for 을 data 값을 기준으로 돌려줍니다
    {
        
        
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
            else if "\(j)" == list[i-1]
            {
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







