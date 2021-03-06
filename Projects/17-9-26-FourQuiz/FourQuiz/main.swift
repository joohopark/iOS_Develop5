//
//  main.swift
//  FourQuiz
//
//  Created by MIN JUN JU on 2017. 9. 24..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import Foundation



 //9.12(화)

var someInts:Array<Int> = Array<Int>()

someInts = [1,2,3,4]

var myfriendNameList:[String] = []

func addFriendName(name:String)

{
    myfriendNameList.append((name))
}

addFriendName(name: "친구1")
addFriendName(name: "친구2")
addFriendName(name: "친구3")

//print(myfriendNameList)

func findFriend(name:String, tagetList:[String]) -> Bool
{
    var isFind:Bool = false

    for fName in tagetList
    {
     if name == fName
     {
        isFind = true
        return isFind

        }

    }
    return false


}

// print(findFriend(name: "친구1", tagetList: myfriendNameList))




func removeFriend(name:String)
{
    if myfriendNameList.contains(name)
    {
        var index:Int = myfriendNameList.index(of: name)! // ! 는 아무것도 안나올수 있으니까 ! 를 넣어라 라는 의미임!

        myfriendNameList.remove(at: index)



    }



}

removeFriend(name: "친구1") // list 삭제되는것까지 확인이 가능함.
//print(myfriendNameList)



var test:[String] = []



// 1. 요일 구하기



func getWeek(_ month:Int,_ day:Int) -> String
{

    var value:Int = 0

    var ofWeek:[String] = ["일", "월", "화", "수", "목", "금", "토"]
    var dic:[Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

    
    if month == 1 // 1월인경우 day 합 -> 나누기 7 해서 ofweek 의 index값을 찾아서 반환
    {
        
        value = value / 7
        var value1:String = ofWeek[value]
        return value1

    }
    else if month > 2
    {


        for i in 0...(month-2) // ex) 2월이면 1번만 돌게 해서 dic 의 값들을 더해줌.
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
        if list1.contains(list[i]) == true // list1은 빈리스트, 여기에 list에 담긴 값을 하나씩 넣을건데, 넣기 전에 list에서 가져올 값이 list1에 들어있나 검사, 있으면 넣지 않고, 없으면 값을 넣음.
        {
            list2.append(list[i]) // list2 에는 list에 중복된 숫자들이 들어감.
        }else {
            list1.append(list[i]) // list1 안에 list[i] 값이 들어있지 않으면 list1(중복된값을 제외하고 넣는곳)에 값을 넣음.
        }
    }
    return list1
}

print(shoter(100121333))

// 2-1 인풋값을 받아서, 중복 숫자 제거하기

func shorterVer1(_ num:Int) -> [Int] {
    
    // String 변환 상태
    var changeValue:String = String(num)
    
    var checkOverlep:[Int] = []
    
    for i in changeValue.characters {
        
        // i = characters
        var stringValue = String(i)
        var intValue = Int(stringValue)
        
        if !checkOverlep.contains(intValue!) {
            
            checkOverlep.append(intValue!)
            
            
        }else {
            
        }
    }
    
    return checkOverlep
    
    
}

print(shorterVer1(1100001234))


// 3. 소수를 반환 하는 함수

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
    return list2 // list1에는 소수가 아닌것들이, list2에는 소수들이 담겨져서 list2를 반환함.

}


print(allPrimNumber(11))


 // 4. 시저암호


func ceasar(_ data:String,_ data1:String,_ data2:String,_ data3:String,_ keynum:Int = 4) -> [String]
{
    var list:[String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","j","u","v","w","x","y","z",]
    var list1:[String] = []


    var new_list:[String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","J","U","V","W","X","Y","Z"]
    var _:[String] = []

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











