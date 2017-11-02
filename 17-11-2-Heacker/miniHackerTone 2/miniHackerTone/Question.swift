//enum Type {
//  case d
//  case i
//  case s
//  case c
//}

import Foundation

struct Question {
  let dMsg : String
  let iMsg : String
  let sMsg : String
  let cMsg : String
  
  init?(data: [String:Any]) {
  
    guard let dMsg = data["d"] as? String else { return nil }
    self.dMsg = dMsg
    guard let iMsg = data["i"] as? String else { return nil }
    self.iMsg = iMsg
    guard let sMsg = data["s"] as? String else { return nil }
    self.sMsg = sMsg
    guard let cMsg = data["c"] as? String else { return nil }
    self.cMsg = cMsg
  }
}

struct QuestionCenter {
  
  static var main = QuestionCenter()
  
  var questionDictionary = [Int:Question]()
  private init() {
    loadData()
  }
  
  mutating func loadData () {
    let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/exampleList.plist"
    
    if !FileManager.default.fileExists(atPath: documentsPath){
      if let bundlePath = Bundle.main.path(forResource: "exampleList", ofType: "plist"){
        do {
          try FileManager.default.copyItem(atPath: bundlePath, toPath: documentsPath)
        }
        catch{
          print("copy fail")
        }
      }
    }
    
    guard let data = NSDictionary(contentsOfFile: documentsPath) as? [Int:[String:String]] else { return }
    
    for i in 1...24 {
      self.questionDictionary[i] =  Question(data: data[i]!)
    }
    
    
  }
  
}
