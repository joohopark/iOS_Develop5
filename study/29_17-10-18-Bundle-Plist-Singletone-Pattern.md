# 29_17-10-18

---

## Bundle, Plist, Singletone Pattern

---


## Data 저장



![screen](/study/image/Plist.jpg)

- Property list(Plist) 사용하기! 
- 심플한 `파일` 저장 방법 중 하나
- key, Value 구조로 데이터를 저장한다
- file 형태로 저장되다 보니 외부에서 Access 가능(보안이 취약하다)

---

## 파일 위치 

- 파일이 저장되는곳 Bundle & Documents 폴더
- Bundle은 프로젝트에 추가된 Resorce가 모인 곳
- 프로그램이 실행되며 저장하는 파일은 Documents폴더에 저장 된다. 
- **즉, Plist파일의 데이터를 쓰고 불러오는 역할은 Documents폴더에 저장된 파일로 사용한다, 에초에 Bundle에 Plist를 저장하면, app load 이후 다시 write할수 없다.**


---

## Main Bundle

- `bundle.main` 을 통해서 인스턴스를 가져올수 있음.
- 하나의 app은 각자 독립적인 구조를 가지고 있다. 데이터를 불러올때 `샌드박스` 범위 안에 있는 데이터들을 불러 올수 있다.
- NSDictionary 는 class 의 오브젝트만 들어갈수 있고, Dictionary 는 스트럭트를 사용한다
- **실제 파일에 있는 데이터를 Swift에 있는 어떤 method 를 사용해서 Swift에서 사용할수 있는 데이터로 만들어 주어야 하는데, 아직 `Dictionary` 에는 그런 `method`가 없다. 그래서 `NSDictionary` 에 있는 method 를 사용해서 dictionary로 타입 케스팅해서 사용해야 한다.** 
- Bundle 은 실행코드, 이미지, 사운드, nib파일, 프레임 워크, 설정 파일 등 코드와 리소스가 모여 있는 file system 내의 Directory
	- 쉽게 생각해서, 내부의 프로퍼티라고 생각하자

---

## Bundle 데이터 사용하기

- bundle 리소스 확인

![screen](/study/image/Plist-1.jpg)

- Main Bundle 가져오기 -> 리소스 파일 주소 가져오기 -> 데이터 불러오기 -> Bundle 데이터 사용 하기 

```swift
1.
// Get the main bundle for the app. let mainBundle = Bundle.main
 
2.
// Get the main bundle for the app.let mainBundle = Bundle.mainlet filePaht = mainBundle.path(forResource: "rName", ofType:"rType")

3.
if let path = filePaht {     let image = UIImage(contentsOfFile: filePaht!)}

4.
if let filePaht = mainBundle.path(forResource: "rName", ofType: "rType"),   let dict = NSDictionary(contentsOfFile: filePaht) as? [String: Any]{
// use swift dictionary as normal}
```

> app 내부에 저장되어 있는 Plist 리소스 파일의 데이터는 번들을 통해 가져와서 사용할수 있다.

---

## Plist File In Document

1. Document folder Path 찾기
2. Document folder에 plist 파일이 있는지 확인
	- 만약 없다면 : bundle에 있는 파일 Document에 복사3. Path를 통해 객체로 변환, 데이터 불러오기 writeToFile 메소드로 파일 저장
4. writeTofile 메소드로 파일 저장 

> 4번의 경우 다른 방식으로 Document 파일에 접근해서, bundle에 있는 Plist의 값을 가져올수 있다. 위의 방식만 있다고 생각하지 말자


```swift

1. 파일 불러오기

let path:[String] =NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,true)
let basePath = path[0] + "/fileName.plist"

2. Document folder에 파일 있는지 확인

if !FileManager.default.fileExists(atPath: basePath){}

3. bundle에 있는 파일을 Documents에 복사, 
	-> 여기서는 do, try catch 문을 썻지만, 다른방법으로도 충분히 가능하다.

if let fileUrl = Bundle.main.path(forResource: "fileName", ofType: "plist"){    do {         try FileManager.default.copyItem(atPath: fileUrl, toPath: basePath)    } catch  {         print("fail")} }

4. Dictionary 인스턴스 불러오기. 

if let dict = NSDictionary(contentsOfFile: basePath) as? [String: Any]{   // use swift dictionary as normal
   // Plist의 값이 dict에 담겨 있고, 어떻게 사용할지 정의해주면된다.}

5. write(tofiled) 메소드를 통해서 파일 저장

if let dict = NSDictionary(contentsOfFile: basePath) as? [String: Any]{ var loadData = dictloadData.updateValue("addData", forKey: "key")let nsDic:NSDictionary =  NSDictionary(dictionary: loadData)nsDic.write(toFile: basePath, atomically: true)}

NSDictionary -> dictionary 로 수정해서 사용한다.
``` 
---

## Singleton Pattern 

singleton, delegate 도 하나의 디자인패턴의 방법론 이다..!

1. 어플리케이션 전 영역에 걸쳐 `하나의 클래스`의 `단하나의 인스턴스만(객체)`을 생성하는 것을 싱글톤 패턴이라고 한다. 이유는, 모든 인스턴스에서 쉽게 접근하고 프로퍼티나, 메서드를 하나의 싱글턴 패턴이라는 것을 통해서, 불러오고, 데이터를 사용, 가공하기 위해서 이다.

2. app의 구조와는 무관하게 어디서든 접근이 가능 하고 수정이 가능 해야한다(이때 하나만 존재해야될때가 존재한다. 그리고 하나의 값을 핸들링 해야하는 경우가 있을때 사용한다.)
 -> 예를 들면, 셋팅 파일 같이 한번 적용되면 모든 영역에 적용되는...?

3. `Singletone` 의 기술적인 특징으로 class의 `static` 의 프로퍼티를 사용하는 방식을 비슷하게 설명할수 있다`

4. Singleton 은 `정적` 영역 이다. 한번 인스턴스가 생성되면 app이 죽을때까지 인스턴스가 살아 있다. -> 많이 사용할 경우 메모리 부하가 생길 위험이 있다.


#### - sington 예제

```swift
struct test {
    var x: Int = 0

    // test의 shardSingleton 을 통해서 test에 정의한 모든 매서드, 변수들을 계속 사용할수 있다.
    static var shardSingleton: test = test()
    private init() {
    }
}

var y = test.shardSingleton
test.shardSingleton.x = 100
var a = test.shardSingleton.x
var b = test.shardSingleton.x

// 아래에서 test.shardSingleton.x 의 값이 변화하면, a,b 의 값 모두 변하게 된다.

싱글턴 패턴은 이런식으로 사용하는것 같다. test의 static 으로 test의 인스턴스를 생성해서, 그 인스턴스 내부에 있는 변수, 매서드들을 꺼내서 사용하고, 가공할수 있게 만들어 놓은것 같다.
print(a, b) // 100, 100 
```

- sington 구조 

![screen](/study/image/Plist-2.jpg)

