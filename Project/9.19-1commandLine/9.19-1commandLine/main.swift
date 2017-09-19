//
//  main.swift
//  9.19-1commandLine
//
//  Created by MIN JUN JU on 2017. 9. 19..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import Foundation
/*
enum CompassPoint {
    case north
    case south
    case east
    case west
}

//print(CompassPoint.east)

enum Planet:Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune }


let possiblePlanet = Planet(rawValue: 2)

let positionToFind = 11
if let somePlanet = Planet(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default: print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
*/

func test(num:Int) -> Int {
    var total:Int = num
    //var num = num
    
    print(total)
    print(num)
    
    if num == 0 {
        return 1
    }
    total *= test(num: num-1)
    return total
    
}



func fibo(n:Int) -> Int {
    
    //var n = n
    //var total = 0
    
    if n == 1 || n == 2 { // 아.. n==2 일때로 설정해주면, 내가 원하는 값에서 리턴이 일어나는구나... 나는 n을 무조건 0을 넣어야 된다고 생각하니까.. 다르내
        return 1
        
    }else {
        return fibo(n: n-2) + fibo(n: n-1)
        
    }
    
    
}

//print(fibo(n: 5))



/*for i in 1...5 {
    
    print(fibo(n: i))
    
}*/


/*
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression,
        ArithmeticExpression)
}





enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}


var product:Barcode = Barcode.upc(8, 85909, 51226, 3)

product = .qrCode("asdb")




switch product {
    case .upc(let a, let b, let c, let d): // 각 값들을 a,b,c,d로 바인딩.
        print("product Barcode is \(a), \(b),\(c), \(d) ")
    case .qrCode:
        print("this productQr \(product), \(product)")
}


*/
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

enum Planet: Int {
    case mercury=1, venus, earth, mars, jupiter, saturn, uranus, neptune
}


enum CompassPoint: String {
    case north, south, east, west
}

/*
var checkPlanet = Planet.venus.rawValue
print(checkPlanet)

var checkASCII = ASCIIControlCharacter.lineFeed.rawValue
print(checkASCII)

var checkCompass = CompassPoint.east.rawValue
print(checkCompass)
*/

/*
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
    
}*/


indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)

let four = ArithmeticExpression.number(4)

let sum = ArithmeticExpression.addition(five, four)

let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

//print(five, four, sum, product)



func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        print(value)
        return value
        
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
        
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
        
    }
}
//print(evaluate(product))




enum Wearable {
    enum Weight: Int {
        case Light = 1
        case Mid = 4
        case Heavy = 10
    }
    enum Armor: Int {
        case Light = 2
        case Strong = 8
        case Heavy = 20
    }
    case Helmet(weight: Weight, armor: Armor)
    case Breastplate(weight: Weight, armor: Armor)
    case Shield(weight: Weight, armor: Armor)
}


let num:Int = 10
let num1:Int? = 10

//print(num, num1)


let shortForm: Int? = Int("30")
let longForm: Optional<Int> = Int("42")

// 옵셔널 값으로 저장하는 형식이구나..

print(shortForm, longForm)

let num3: Int? = Optional.none
let num2: Int? = Optional.some(10)

print(num3, num2)

