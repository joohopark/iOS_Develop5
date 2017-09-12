

// 9.12(화)

/*var someInts:Array<Int> = Array<Int>()

print(someInts)

someInts = [1,2,3,4]

print(someInts) */

//var myfriendNameList:[String] = []
//
//func addFriendName(name:String)
//
//{
//    myfriendNameList.append((name))
//}
//
//addFriendName(name: "친구1")
//addFriendName(name: "친구2")
//addFriendName(name: "친구3")
//
////print(myfriendNameList)
//
//func findFriend(name:String, tagetList:[String]) -> Bool
//{
//    var isFind:Bool = false
//    
//    for fName in tagetList
//    {
//     if name == fName
//     {
//        isFind = true
//        return isFind
//        
//        }
//        
//    }
//    return false
//    
//    
//}
//
//// print(findFriend(name: "친구1", tagetList: myfriendNameList))
//
//
//
//
//func removeFriend(name:String)
//{
//    if myfriendNameList.contains(name)
//    {
//        var index:Int = myfriendNameList.index(of: name)! // ! 는 아무것도 안나올수 있으니까 ! 를 넣어라 라는 의미임!
//        
//        myfriendNameList.remove(at: index)
//        
//        
//        
//    }
//    
//    
//    
//}
//
//removeFriend(name: "친구1") // list 삭제되는것까지 확인이 가능함.
//print(myfriendNameList)
//
//
//
//var test:[String] = []



// 1. 요일 구하기



func getWeek(_ month:Int,_ day:Int) -> String
{
    
    var value:Int = 0
    
    var ofWeek:[String] = ["일", "월", "화", "수", "목", "금", "토"]
    var dic:[Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    if month == 1 // 1월인경우 day 합 -> 나누기 7 해서 ofweek 의 index값을 찾아서 반환
    {
        value = day
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



    
    
    
    
    
    
