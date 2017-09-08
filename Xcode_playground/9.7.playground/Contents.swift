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






// 1.  요일구하기 2017년도 1월1일은 일요일 입니다. 월과 데이를 받아서 그날의 요일을 구하는 함수 getWeekDay(달:Int, 날짜:Int)

 // - > 힌트는 30일, 31일 짜리인 달을 구함. 그 달을 먼저 찾게하고, 30일, 31에 따라서 요일을 구해줌. +1이 되면
 // - > 각각 달들이 28,30,31 인지 정의해놓고, 각각의 달들을 더해줌

func getWeekDay(_ Month:Int,_ Day:Int) -> String
{
    var Month:Int = Month
    var Day:Int = Day
    var MonthValue = 0
    var ofWeek:[String] = ["일", "월", "화", "수", "목", "금", "토"]
    var whileValue = 0
    
    // 달을 먼저 구해보자.
    
    //var day28:[Int] = [2]
    //var day30:[Int] = [4, 6, 9, 11]
    //var day31:[Int] = [1, 3, 5, 7, 8, 10 ,12]
    var dic:[Int:Int] = [1:31, 2:28, 3:31, 4:30, 5:31, 6:30, 7:31, 8:31, 9:30, 10:31, 11:30, 12:31] // 딕셔너리 벨류값 빼서 연산하는 방법알면 다시 만들자
    
    while Month != whileValue
    {
        if Month == 1
        {
            MonthValue = Day
            whileValue += 1
        }
        else if Month == 2
        {
            MonthValue = 31 + Day
            whileValue += 1
        }
        else if Month == 3
        {
            MonthValue = 31 + 28 + Day
            whileValue += 1
        }
        else if Month == 4
        {
            MonthValue = 31 + 28 + 31 + Day
            whileValue += 1
        }
        else if Month == 5
        {
            MonthValue = 31 + 28 + 31 + 30 + Day
            whileValue += 1
        }
        else if Month == 6
        {
            MonthValue = 31 + 28 + 31 + 30 + 31 + Day
            whileValue += 1
        }
        else if Month == 7
        {
            MonthValue = 31 + 28 + 31 + 30 + 31 + 30 + Day
            whileValue += 1
        }
        else if Month == 8
        {
            MonthValue = 31 + 28 + 31 + 30 + 31 + 30 + 31 + Day
            whileValue += 1
        }
        else if Month == 9
        {
            MonthValue = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + Day
            whileValue += 1
        }
        else if Month == 10
        {
            MonthValue = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + Day
            whileValue += 1
        }
        else if Month == 11
        {
            MonthValue = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + Day
            whileValue += 1
        }
        else if Month == 12
        {
            MonthValue = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30 + Day
            whileValue += 1
        }else {
            print("요일을 알수 없음")
            break
        }
        
    }
    // MonthValue = 총 날짜수가 들어가 있음
    MonthValue = MonthValue % 7
    var res:String = ofWeek[MonthValue-1]
    
    return res
}
print(getWeekDay(12, 31)) // 맨 마지막날 '일요일'


// 2. 중복 숫자 줄이기 : 연속으로 중복된 숫자를 없애는 함수

func shoter(num:Int) -> [Int]
{
    var number = num
    var list:[Int] = []
    var list1:[Int] = []
    
    while number >= 1 && number != 0
    {
        list.insert(number % 10, at: 0)
        number /= 10
    }
    print(list)
    // list = [순서대로 저장]
    for i in 1...(list.count-1)
    {
        if list[i-1] == list[i] // 리스트 값이 같으면, 리스트를 리스트1에 올림.
        {
            list1.append(list[i-1])
        }
    }
    return list1
}


print(shoter(num:11223344))
var dicc:[Int:Int] = [1:31, 2:28, 3:31, 4:30, 5:31, 6:30, 7:31, 8:31, 9:30, 10:31, 11:30, 12:31]

// 3. 소수찾기 : 2부터 입력된 숫자까지의 모든 소수를 찾아서 반환 

//func allPrimNumber(_ num:Int)
//{
//    var number:Int = num
//    var list:[Int] = []
//    var list1:[Int] = []
//    for i in 1...number
//    {
//        list.append(i)
//    }
//    // list 에는 1~num 까지 담겨 있음
//    for i in 1...list.count
//    {
//        
//        for j in 1...i
//        {
//            if i % j == 0
//            {
//                print("\(i) 는 소수가 아닙니다.")
//            }
//            else if i % j != 0
//            {
//                print("\(i) 는 소수입니다.")
//            }else {
//                print(i)
//            }
//        }
//    }
//    print(list1)
//}
//
//print(allPrimNumber(10))

// 소수 찾기 알고리즘 -> 내가 찾고자 하는 소수가 10 -> 1~10 까지 리스트 만들고, for을 사용해서 index 하는데, index 하는 값 보다 작은 값들을 나누어서, 나머지가 0 이 나오는 경우면 소수 아님, 나머지 0 이 안나오면 소수 맞음. 알고리즘 짜다가 실패..





// 4. 시저암호 구현하기 ceasar(data:["a","B","C","d"], keyNum:4

func ceasar(_ data:String,_ data1:String,_ data2:String,_ data3:String,_ keynum:Int = 4)
{
    var list:[String] = ["a","b","c","d","e","f","g","h"]
    var list1:[String] = []
    var data:String = data
    
    
    for i in 1...list.count
    {
        if "\(data)" == list[i-1]
        {
            if "\(data)" == list[list.count-4] //list.count-1 은 index의 마지막 값 -> 인덱스 넘어가면 앞으로 돌려줌
            {
                list1.append(list[0])
            }
            else if "\(data)" == list[list.count-3]
            {
                list1.append(list[1])
            }
            else if "\(data)" == list[list.count-2]
            {
                list.append(list[2])
            }
            else if "\(data)" == list[list.count-1]
            {
                list1.append(list[3])
            }else {
                list1.append(list[i-1+keynum])
            }
            
            
        }
        
    }
    for i in 1...list.count
    {
        if "\(data1)" == list[i-1]
        {
            if "\(data1)" == list[list.count-4] //list.count-1 은 index의 마지막 값
            {
                list1.append(list[0])
            }
            else if "\(data1)" == list[list.count-3]
            {
                list1.append(list[1])
            }
            else if "\(data1)" == list[list.count-2]
            {
                list.append(list[2])
            }
            else if "\(data1)" == list[list.count-1]
            {
                list1.append(list[3])
            }else {
                list1.append(list[i-1+keynum])
            }
            
            
        }
        
    }
    
    for i in 1...list.count
    {
        if "\(data2)" == list[i-1]
        {
            if "\(data2)" == list[list.count-4] //list.count-1 은 index의 마지막 값
            {
                list1.append(list[0])
            }
            else if "\(data2)" == list[list.count-3]
            {
                list1.append(list[1])
            }
            else if "\(data2)" == list[list.count-2]
            {
                list.append(list[2])
            }
            else if "\(data2)" == list[list.count-1]
            {
                list1.append(list[3])
            }else {
                list1.append(list[i-1+keynum])
            }
            
            
        }
        
    }
    for i in 1...list.count
    {
        if "\(data3)" == list[i-1]
        {
            if "\(data3)" == list[list.count-4] //list.count-1 은 index의 마지막 값
            {
                list1.append(list[0])
            }
            else if "\(data3)" == list[list.count-3]
            {
                list1.append(list[1])
            }
            else if "\(data3)" == list[list.count-2]
            {
                list.append(list[2])
            }
            else if "\(data3)" == list[list.count-1]
            {
                list1.append(list[3])
            }else {
                list1.append(list[i-1+4])
            }
            
            
        }
    }
    print(list1)
    
    
}

ceasar("a","b","c","d",2)

