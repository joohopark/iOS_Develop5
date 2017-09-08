let list:[String] = ["0","1","2","3","4","5","6","7","8","9","10"]

func test2(num:Int) -> [String]
{
    var subList:[String] = []
    
    for numStr in list
    {
        var number = Int(numStr)!
        if num<number
        {
            subList.append(numStr)
        }
    }
    return subList
}
