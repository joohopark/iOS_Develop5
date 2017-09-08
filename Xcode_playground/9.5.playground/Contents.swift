//: Playground - noun: a place where people can play

func all(kind:String, type:String, x:Double, y:Double, r:Double, h:Double) -> Double
{
    var returnValue: Double = 0
    
    if kind == "Square" && type == "area" {
        
        returnValue = x * x
        return returnValue
    }
    else if kind == "Square" && type == "circum" {
        returnValue = x * 4
        return returnValue
    }
    else if kind == "Rectangle" && type == "area" {
        returnValue = x * y
        return returnValue
    }
    else if kind == "Rectangle" && type == "circum" {
        returnValue = (2 * x) + (2 * y)
        return returnValue
    }
    else if kind == "Circle" && type == "area" {
        returnValue = 3.14 * (r * r)
        return returnValue
    }
    else if kind == "Circle" && type == "circum" {
        returnValue = 2 * 3.14 * r
        return returnValue
    }
    else if kind == "Triangle" && type == "area" {
        returnValue = 0.5 * x * h
        return returnValue
    }
    else if kind == "Trapezoid" && type == "circum" {
        returnValue = (1/2) * h * (x + y)
        return returnValue
    }else {
        returnValue = 0
        return returnValue
    }
    
    
    //return 0

    
    
}
var res: Double = all(kind:"Circle", type:"circum", x:5, y:10, r:3, h:5)
print(res)
