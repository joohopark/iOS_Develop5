# 31_17-10-19

---

## Bundle, Plist, Singleton 연습하기 
  
- Plist에 저장된값 불러오고, 수정하기 

1. <br>

Plist 값을 저장할곳을 찾는다.

2. <br>

복사하려고 하는 곳에 Plist데이터가 없다면, 만들어주는데, 이때 두가지 방법이 존재 한다.
*bundle 에 있는 값을 복사해서, 내가 저장하려고 하는 Documents에 복사해서 생성 해준다.

3. <br>

NSDictionary로 변경시킨후, 값을 추가, 수정 하고,......


```swift
** singleton 데이터 모델 
import Foundation
struct SingleTonDataCenter {    
    var documentsPath: String?
    var dic: Any {
        let dicdic = NSDictionary(contentsOfFile: documentsPath!) as? [String:Any]
            return dicdic
        }
        
    // 싱글톤 변수 생성
    static var singerTonValue: SingleTonDataCenter = SingleTonDataCenter()
    private init() {
        loadData()
    }
    
    mutating func loadData() {        
        documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/UserPlist.plist"
        // 현재 위치의 값이 있음.
        print(documentsPath)
        // 존재하지 않다면, path의 위치에 plist를 복사해서 넣어준다..!
        if !FileManager.default.fileExists(atPath: documentsPath!) {
            // 1-1 값이 없다면 복사.
            // 번들에 있는 값을 가져와야하기때문에 번들에 있는 주소를 가져와야함
            if let bundlePath = Bundle.main.path(forResource: "UserPlist", ofType: "plist") {
                // 복사는 fileManager
                // throw 가 있어서, try를 붙여줌...?
                // do -> try -> catch 문을 사용해준다.
                //
                do {
                    try FileManager.default.copyItem(atPath: bundlePath, toPath: documentsPath!)
                    print("복사성공")
                }catch {
                    print("복사 실패 두둥")
                }
            }
        }
        // 여기에선 무조건 파일이 존재 한다. -> print를 사용해서 경로에 plist가 생성 되었는지 확인할수 있다.
        print(documentsPath)
        // 파일을 불러올것임.. 그래서 NSDictionary 를 사용해서 변환 -> print 를 통해서 눈으로 확인 가능
        // 여기에서 NSDictionary 를 만들면, 그 안에 plist의 값이 담겨 있는것을 확인할수 잇다.
        if let dic = NSDictionary(contentsOfFile: documentsPath!) as? [String:Any] {
            print(dic)
            // 딕셔너리를 다시 쓰려고함..?
            // 여기에서 dic의 key값에 value 값을 넣어 준것임.
            //update는 새로운값을 추가한다기보다는 덮어 쓰기의 느낌으로 하면 될꺼같다,
            var dictionary = dic
            dictionary.updateValue("haha", forKey: "user_id")
            dictionary.updateValue("123", forKey: "pw")
            dictionary.updateValue("91-07-13", forKey: "birthday")
            
            // 새로운 키값을 추가해보자
            dictionary.updateValue("new", forKey: "newKeyValue")
            dictionary.updateValue(["dickey":"newValue"], forKey: "NewDicValue")
            
            // NSDictionary를 가지고, NSDictionary를 만들어서, documentsPath로 값을 복사해줌
            // 원리는 위에서 dic을 NSDictionary로 만들고, 거기에 key, value 값을 추가해준다음, nsDic변수를 NSDictionary 를 가지고 NSDictionary로 만들고, nsDic.write로 애초에 DocumetnsPath에 값을 넣어서 붙여줌..!
            let nsDic = NSDictionary(dictionary: dictionary)
            nsDic.write(toFile: documentsPath!, atomically: true)
            print(nsDic)
            
            // plist의 값을 긁어 오는게 아니라, plist에 있는 xml파일의 key, value 값을 가져와서 사용할수 있을것 같다...!
        }
        // 현재 plist의 파일에 복사가 되었다고 가정하고, 수정, 추가 해보자
        // 1. documentsPath 에 파일이 있는지 없는지 먼저 검사해보자
        // NSDictionary 로 선언이 된 이유는 애초에 맨처음 root Plist 의 Value 타입이 dictionary이기 떄문이다. 만약 Array라면, NSArray로 정의 해서 사용할수 있다.
    }
    
    func modifiedPlistValue(anyValue value:Any, keyValue forKey: String) {
        var newDic = NSDictionary(contentsOfFile: documentsPath!) as? [String:Any]        
        newDic?.updateValue(value, forKey: forKey)
        let newDicDic = NSDictionary(dictionary: newDic!)
        newDicDic.write(toFile: documentsPath!, atomically: true)   
    }
}
```

---

## Bundle, Plist 응용 하기

Bundle의 데이터를 핸들링 하는 방법 2가지

1. bundle의 있는 값을 가져와서 -> documents 파일에 저장 -> bundle의 값을 가져와서 수정후 -> documnets파일에 저장 -> 다음의 값을 핸들링시 documents의 값을 사용할수 있다.


```swift
import UIKit
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Data.plist 의 실제 주소!, path 의 차이 한번 확인하자
        // 1. bundle에서 값을 불러오기!
        var y = Bundle.main.path(forResource: "Data", ofType: "plist")
        
        // 딕셔너리가 담긴 어레이! // 값을 뽑아서 사용할수 있다, 여기서 주의해야할점은 url, path 는 서로다름!
        guard let arr = NSArray(contentsOfFile: y!) as? [[String:String]] else {return}
        
        // arr의 값을 변경할수 없으니까 arr1에 arr값을 넣고 데이터를 핸들링 하기 위한 변수로 사용한다.
        var arr1 = arr
        
        // 2. 번들에서 불러온값 사용 -> 저장 하기
        // 현재 arr1에는 bundle에서 불러온 값이 저장되어 있다.
        // 가공후, 다시 Data.Plist 에 값을 넣어보자.
        arr1.append(["newValue":"new"])
        
        // documentc 파일의 디폴츠 URL 위치
        // documnetc 파일을 수정할수 없게, 연산 프로퍼티로 정의 했습니다.
        var documentDirectory: URL {
            return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        }
        
        // dataURL 은 현재 값이 없음, 주소를 추가함.. 엄밀하게는 파일에 생성될 데이터 Path 생성 
        let dataURL = documentDirectory.appendingPathComponent("Data.plist")
        
        // 사용하기 위해 스트링으로 바꿈
        let dataStringPath = dataURL.path
        
        // dataStringPath 에 파일이 없으면, plist의 값을 복사하고 생성한다.
        if !FileManager.default.fileExists(atPath: dataStringPath) {    
            //bundle에 있는 UserData라는 Plist의 값을 찾아서, plist에 복사해서 넣는다.
            guard let plistURL = Bundle.main.url(forResource: "Data", withExtension: "plist") else { return }
            // plistURL 에 bundle에 있는 Plist를 복사하고,dataURL의 위치에 넣어준다.
            //  bundel 데이터 -> documnets로 이동.
            try! FileManager.default.copyItem(at: plistURL, to: dataURL)
        }
        
        // 현재 dataURL 에 데이터가 생성 되어 있는 상태이다. 이 데이터를 어떻게 핸들링 해서 데이터를 추가 해보자.
        // documnetsArr 에는 Bundle 의 값이 들어가 있다.
        guard let documentsArr = NSArray(contentsOfFile: dataStringPath) as? [[String:String]] else {return}
        
			// 수정할 값을 핸들링 할 변수를 추가하자.
        var loadData = documentsArr
        loadData.append(["id":"newMinjun", "password": "new", "email":"abc@gmail.com"])
        //NSArray 로 만들고 -> 데이터 추가 완료..!
        let nsArr: NSArray = NSArray(array: loadData)
        nsArr.write(toFile: dataStringPath, atomically: true)
        // 데이터 추가 & 수정 하는 방법 완료....!
        // plist 의 값 변경 확인!
```

유의 해야 하는것은 데이터를 추가, 수정을 분리해서 생각 해야 한다. Plist가 딕셔너리나, 어레이로 만들어 졌을때, 접근시, 내가 새롭게 만들 변수의 데이터를 덮어 씌운다고 생각하고 접근 해야한다.
 
원래 있는 키 값에 접근후, 다른 값으로 변경 했다면, 수정이 아니라, 엄밀하게는 데이터를 덮어 씌운다고 생각하고 접근해야한다.. 데이터 구조를 잘못 모델링 했을경우 아무런 데이터가 안들어가 있는것을 확인할수 있다. 
 
연산 프로퍼티를 유용하게 사용할수 있는데, 싱글톤으로 사용되었을경우, 수정되면 곤란한 값을 연산프로퍼티의 get 만 가능하게 정의 해주면, 유용하게 사용할수 있다.
 
자주 사용되는데, 값이 바뀌면 곤란한 경우의 프로퍼티들을 연산 프로퍼티를 사용해서 원하는 값으로 핸들링하면서 사용할수 있다.

---

## 데이터의 저장 기점

app를 종료하게 되면, app 를 사용할때 추가, 삭제, 생성 되는 데이터를 어떻게 저장하고 사용할것인지에 대한 고민을 해야하는데, **app을 종료하면 어떻게든 background에 가게된다.** 이때, 보통 데이터의 저장은 **applicationDidEnterBackground에서(Delegate)** 한다고 한다...!

---

## Plist

- 실시간 데이터 추가 하기, app이 사망하고 다시 런쳐 해도 데이터 그대로 유지.

| *  | * | 
| :------------ | -----------: | 
| ![screen](/study/image/DataModelPlst.jpg)     | ![screen](/study/image/DataModelPlst-1.jpg) |


#### - applunch 후, 기존 데이터 로드하기


```swift
func addBundleData() {
        var bundlePath = Bundle.main.path(forResource: "Data", ofType: "plist")
        guard let arr = NSArray(contentsOfFile: bundlePath!) as? [String] else {return}
        
        // dataURL 은 현재 값이 없음
        let dataURL = documentDirectory.appendingPathComponent("Data.plist")
        
        // 사용하기 위해 스트링으로 바꿈
        let dataStringPath = dataURL.path
        
        // dataStringPath 에 파일이 없으면, plist의 값을 복사하고 생성한다.
        if !FileManager.default.fileExists(atPath: dataStringPath) {    
            //bundle에 있는 UserData라는 Plist의 값을 찾아서, plist에 복사해서 넣는다.
            guard let plistURL = Bundle.main.url(forResource: "Data", withExtension: "plist") else { return }
            // plistURL 에 bundle에 있는 Plist를 복사하고,dataURL의 위치에 넣어준다.
            try! FileManager.default.copyItem(at: plistURL, to: dataURL)
        }
        
        // 현재 dataURL 에 데이터가 생성 되어 있는 상태이다. 이 데이터를 어떻게 핸들링 해서 수정할건지....?
        guard let documentsArr = NSArray(contentsOfFile: dataStringPath) as? [String] else {return}
        var loadData = documentsArr
        
        //NSArray 로 만들고 -> 데이터 추가 완료..!
        let nsArr: NSArray = NSArray(array: loadData)
        
        // Documents data load
        nsArr.write(toFile: dataStringPath, atomically: true)
        
        // 데이터 추가 & 수정 하는 방법 완료....!        
        var throwTextView: String = ""
        for i in loadData {
            throwTextView += i + "\n"
        }
        tv.text = throwTextView
    }
```

#### - 데이터 추가하기

```swift
@IBAction func btnAction(_ sender: UIButton) {
        //1. 텍스트 필드 비어있는지 확인후 -> documnet 데이터 불러오기
        if !tf.text!.isEmpty {
            // Documnets의 주소(현재 데이터는 load 상태)
            let dataURL = documentDirectory.appendingPathComponent("Data.plist")
            let dataStringPath = dataURL.path
            print(dataURL)
            guard let documentsArr = NSArray(contentsOfFile: dataStringPath) as? [String] else {return}
            //현재 가지고 있는 데이터 추가후,
            var loadData = documentsArr
            loadData.append(tf.text!)
            //NSArray 로 만들고 -> 데이터 추가 완료..! ->
            let nsArr: NSArray = NSArray(array: loadData)
            nsArr.write(toFile: dataStringPath, atomically: true)
            var throwTextView: String = ""
            for i in loadData {
                throwTextView += i + "\n"
            }
            tv.text = throwTextView
            tf.text = ""
        }
    }
```

---



## Reference 

[apple guide: About the iOS File System](https://developer.apple.com/library/content/documentation/FileManagement/Conceptual/FileSystemProgrammingGuide/FileSystemOverview/FileSystemOverview.html#//apple_ref/doc/uid/TP40010672-CH2-SW2)
	


