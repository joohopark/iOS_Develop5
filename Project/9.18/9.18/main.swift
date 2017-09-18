//
//  main.swift
//  9.18
//
//  Created by MIN JUN JU on 2017. 9. 18..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import Foundation

// 9.18 수업 필기

/*func getPoint(somePoint:(Int,Int))
{
    switch somePoint {
    case (0, 0):
        print("\(somePoint) is at the origin")
    case (_, 0):                                   // 튜플의 모든 y가 0일때 모든 x값이 들어온다.
        print("\(somePoint) is on the x-axis")
    case (0, _):                                   // 튜플의 x값이0 일때 모든 y값이 들어옴.
        print("\(somePoint) is on the y-axis")
    case (-2...2, -2...2):
        print("\(somePoint) is inside the box")
    default:
        print("\(somePoint) is outside of the box")
    }
}

getPoint(somePoint: (123, 0)) */

/*

func getPoint(somePoint:(Int,Int))
{
    switch somePoint {
    case (0, 0):
        print("\(somePoint) is at the origin")
    case (let x, 0):
        print("on the x-axis with an x value of \(x)")
    case (0, let y):
        print("on the y-axis with an y value of \(y)")
    case (-2...2, -2...2):
        print("\(somePoint) is inside the box")
    default:
        print("\(somePoint) is outside of the box")
    }
}


getPoint(somePoint: (10, 0))



func wherePoint(point:(Int,Int))
{
    switch point {
    case let (x, y) where x == y:
        print("(\(x), \(y)) is on the line x == y")
    case let (x, y) where x == -y:
        print("(\(x), \(y)) is on the line x == -y")
    case let (x, y):
        print("(\(x), \(y)) is just some arbitrary point")
    }
}

wherePoint(point: (10, 10 ))

*/

// switch 문으로 구구단 ?

func getGrade(with Point:Double) -> String {
    
    var grade:String = "F"
    switch Point {
    case let p where (p <= 100 && p > 90): // 아.. 바인딩 한다는게, 내가 switch 문으로 실행하기 위해서 받은 값은 let p로 정의해주고 그 조건을 변수를 가지고 조건을 주면서 그 값의 조건에 따라서 실행됨..... 아.. 이런식으로도 할수 있구나..
        grade = "A"
    case let p where (p <= 90 && p > 95): // 더블로 된 값을 연산하기 위해서 이렇게 함...?
        grade = "A+"
        
    case 90...95:
        grade = "A"
        
    case 85...90:
        grade = "B+"
    case 80...85:
        grade = "B"
   
    default: "F"
        
    }
    return grade
}

// 스위치문을 이런식으로 사용할수 있구나.. 앞으로 if문 말고 switch 문으로도 만들어서 사용하는 방법을 조금 익숙해져보자..

//print(getGrade(with: 85.11))

// 삼항 연산자 연습 해볼까

var x:Int = 20

var triple = x > 10 ? "10보다 크다" : "10보다 작다"


//print(triple)


// 함수를 인자로 전달이 가능하냐, 함수가 반환되냐, 함수가 변수에 저장이 되는지? 

// 함수로 인자로 전달이 가능한가.
func f(a:Int, b:Int) -> Int {
    
    return a+b
}

/*

class Point {
    
    var x:Double = 0.0
    var y:Double = 0.0
    
    init(x:Double, y:Double) {
        self.x = x
        self.y = y
    }
}

class Size {
    var width:Double = 0.0
    var height:Double = 0.0
    
    init(width:Double, height:Double) {
        self.width = width
        self.height = height
    }
}

class Rect {
    
    var startSpot: Point = Point(x: 0.0, y:0.0) //
    var size: Size = Size(width: 0.0, height: 0.0)
    
    
    var center: Point {  // type 가 Point 이고, 연산 프로퍼티가 됨
        
        get{
            let c:Point = Point(x: startSpot.x + size.width/2, y: startSpot.y + size.height/2)
            
            // c는 Point Class의 x,y값을 넣어줌..?
           // c.x = startSpot.x + size.width/2
            // c.y = startSpot.y + size.width/2
            return c
            
            
        }  // get은 어떤 값이 들어와서, 반환해줘야 하니까 return이 필요하다.
        // c 값이 newCenter로 들어감..
        
        set(newCenter) { // set은 어떤값이 들어가야하니까 명수명이 필요함    
            startSpot.x = newCenter.x - size.width/2
            startSpot.y = newCenter.y - size.width/2
            
        }
    }
    
    
    
    
}

let rect:Rect = Rect()


rect.startSpot = Point(x: 20, y: 20)
rect.size = Size(width: 100, height: 200)
print(rect.startSpot.x, rect.startSpot.y)
print(rect.center.x, rect.center.y)
/////////////////////////////////////////////////// 위는 get의 동작되는 방식..?


rect.center = Point(x: 200, y: 300)
print(rect.startSpot.x, rect.startSpot.y)

print(rect.center.x, rect.center.y)
////////////////////////////////////////////// 위는 set 을 사용하는 방식이다..

*/








/*  name을 넣으면 var 에 들어가는것 같지만, 실제로는 _name에 값이 들어감. 근데 사람들은 내부의 정보를 볼수는 없으니 착가할수 있음...
 
private var _name:String = ""

var name:String {
    get {
        return _name
        
    }
}*/


/*




class DoublingClass {
    var a = 0
    var b = 0
    var data: Int {
        get {
            return a + b
        }
        set(value) {
            self.a = value / 2
            self.b = value / 2
        }
    }
    
    
}
var test = DoublingClass()

test.data = 10 // -> 아 set을 이렇게 사용할수 있구나...!

print(test.a, test.b)

*/



class test {
    
    static let version: String = "ver.1.2"
    
    var y:Int = 0
    
    var x:Int = 0
}

//withUnsafePointer(to: &test.version) { pA in
 //   print(pA)
//}
withUnsafePointer(to: &x) { pA in
    print(pA)
}

//Property Observers 확인하기

var Observers:Int = 0 {
    didSet(oldV){
        print("변화 이전의 값은 \(oldV)")
    }
    willSet(newV) {
        print("변화 이후의 값은 \(newV)")
    }
}


for i in 0...10 {
    Observers = i
}
