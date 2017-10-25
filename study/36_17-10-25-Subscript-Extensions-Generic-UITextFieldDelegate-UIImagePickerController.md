# 36_17-10-25

---

## Subscript, Extensions, Generic, UITextFieldDelegate, UIImagePickerController  

---

## subscript

subscript를 통해서 연산 프로퍼티를 실행하는 용도로 사용할수 있다. subscript 문법 자체가 class, struct에서 정의 되어 사용되어 질때 인덱스의 `형태`로 사용되어 질수 있고, 조금더 사람이 생각하는 의미를 전달할수 있게 되어진다.

```swift

class TestSubscript {
        subscript(x: Int, y: Int) -> (Int, Int){
            
            return (x, y)
            
        }
        
    }


var variable = TestSubscript()

print(variable[0,10]) // (0, 10)

**응용**

**subscript 를 사용해보자**

class test {
        subscript(section: Int, row: Int) -> Int {
            if section == 0 {
                if row == 0 {
                    return 0
                }else if row == 1 {
                    return 1
                }else if row == 2 {
                    return 2
                }
                
            }
            return 0
        }
        
        
    }

var x: test() 

x[0,0] // 0 반환 

이런식으로 반환형식을 만들어서 사용할수 있다.


```

---


## Extensions


**Extentsion에서는 저장프로퍼티는 사용할수 없다.**

**Extension**을 통해서, class 내부에 있는 함수들을 기능 별로 나누어서 정리해서 사용하면 조금더 유의미하게 사용할수 있을것 같음..!

#### - 예제

```swift

delegate, datasource 를 Extension 으로 정리해주어서 사용해도 좋다. 

class SettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    

}

extension SettingViewController {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return RawData.singletonRawData.rawData![0].accountData.count
        }else if section == 1 {
            return RawData.singletonRawData.rawData![1].informatinData.count
        }else if section == 2 {
            return RawData.singletonRawData.rawData![2].serviceData.count
        }
        
        return 0
    }
    
	func numberOfSections(in tableView: UITableView) -> Int {
        return (RawData.singletonRawData.rawData?.count)!
    }

}

```

> 함수 내부에 정의 하나, `Extension`을 통해서 정의 하는것 이나 기능상의 차이는 없다. `확장`의 개념으로서 생각해볼수 있다.

#### - 예제 코드

```swift

extension Double {
      var km: Double { return self * 1_000.0 }
      var m: Double { return self }
      var cm: Double { return self / 100.0 }
      var mm: Double { return self / 1_000.0 }
      var ft: Double { return self / 3.28084 }
}
  let oneInch = 25.4.mm
  print("One inch is \(oneInch) meters")
  // Prints "One inch is 0.0254 meters"
  let threeFeet = 3.ft
  print("Three feet is \(threeFeet) meters")
  // Prints "Three feet is 0.914399970739201 meters"


```

> 연산 프로퍼티로 정의 하여 사용이 가능하다 



---

## Generic 

모든 타입을 대응 가능하게 해주는 `문법` 이다.(Array 도 Generic으로 되어있다.)

```swift

Array<Float> = Array()
 	-> Float 부분에 다른 Type을 넣어서 사용할수 있다.

```

#### - Generic을 이용해서 Stack, Queue 만들기


```swift

import Foundation

 아래의 스텍은 Int 형 밖에 사용이 불가능하다.
struct Stack {

    private var stackTemp: [Int] = []
    mutating func push(_ data:Int) {

        self.stackTemp.append(data)

    }

    mutating func pop() -> Int {

        return self.stackTemp.removeLast()

    }
}


// 제네릭은 하나의 타입처럼 사용이 가능한것 같다. 제네릭자체가 그 후나의 타입으로 정의 되어서 어떤 자료값이든 대응이 가능하게 해놓은것 같음..

struct Stack<j> {
    
    private var stackTemp: [j] = []
    mutating func push(_ data:j) {
        
        self.stackTemp.append(data)
        
    }
    
    mutating func pop() -> j {
        
        return self.stackTemp.removeLast()
        
    }
}


struct Queue<j> {
    private var queueTemp: [j] = []
    
    mutating func inqueue(_ data:j) {
        
        self.queueTemp.append(data)
    }
    
    mutating func dequeue() -> j {
        
        return self.queueTemp.remove(at: 0)
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 이렇게 사용이되면, Int타입을 넣어서 사용할수 있고.
        let stack = Stack<Int>()
        
        // 이렇게 사용하면, 스트링 으로 사용이 가능하다.
        let stack1 = Stack<String>()
        
      
        var qu = Queue<Int>()
        
        qu.inqueue(1) // [1]
        qu.inqueue(2) // [1,2]
        qu.inqueue(3) // [1,2,3]
        qu.inqueue(4) // [1,2,3,4]
        
        print(qu.dequeue()) // 1
     
    }
}




```

---

## UITextFieldDelegate

텍스트 필드를 사용할때, Keyboard 에 대한 이벤트 처리를 해줄수 있다. 이때 Notification 을 사용하기도 하고, Delegate를 사용하기도 한다.!


| *  | * | 
| :------------: | :-----------: | 
| ![screen](/study/imagePicker-1.jpg) | ![screen](/study/imagePicker-2.jpg) |   


#### - Notification 을 사용해서 텍스트 필드에서 사용되는 키보드 이벤트 처리 하기 

```swift

override func viewDidLoad() {
        super.viewDidLoad()
        
   
        // 키보드가 올라오기 직전에 노티피케이션을 사용해서 컨트롤하려고 함.
        // 키보드가 올라오기 직전에 observer가 keyboard에 대한 이벤트를 처리 한다..
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: nil) { (noti) in
            //print(noti.userInfo)
            
            // noti.userInfo 를 프린트한후, 추측해서 키보드 위치를 내려주려고 함..
            if let keyboardFrame = noti.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect {
                // 스크롤뷰의 오프셋을, 키보드가가 올라온 크기 만큼 이동시켜주어서 처리한다.
                self.mainSc.contentOffset = CGPoint(x: 0, y: keyboardFrame.height)
        }
            
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardDidHide, object: nil, queue: nil) { (noti) in
            
            if let keyboardFrame = noti.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect {
                // 스크롤뷰를, 키보드가가 올라온 크기 만큼 스크롤을 올릴것임
                self.mainSc.contentOffset = CGPoint(x: 0, y: keyboardFrame.height/keyboardFrame.height)
            
        }
    }

```

#### - Delegate 사용하기!

```swift


func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // textFieldShouldReturn 은 return 키를 누르게되면, 키보드가 내려가게 되는것인데, 그 명령어중 하나가,
        // resignFirstResponder 매소드가 첫번째로 이녀석이 받음.
        // 위의 녀석들을 사용하기 위해서는 델리게이트를 연결해주어서 사용해야 한다.
        
        // 최초의 응답자를 결정해준다...? 이벤트를 받아서 첫번쨰로 처리해주는 녀석이라고 생각하자..
        textField.resignFirstResponder()
        
        return true
    }

```





---


## UIImagePickerController

**다양한 소스로부터 사진을 가져오는 기능이 구현되어 있는 클래스**

> 사진, 어떤 위치에 대해서 접근해야 할때, 접근권한을 넘겨주는것을 설정해야한다. 설정 하는 방법은 `Info.Plist`에서 설정이 가능하다.
> 

![scrren](/study/image/imagePicker.jpg)

> `privacy` 키워드를 통해서 어떤것에 접근할때, 권한 설정시 출력할 메세지들을 설정해줄수 있다.


#### - 대표적인 항목들 


| 접근내용  | 설정 변수(?) | 
| :------------: | :-----------: | 
| 미디어 라이브러리 접근 | Privacy - Music Usage Description |   
| 블루투스 인터페이스 접근 | Privacy - Bluetooth Peripheral Usage |
| Description 달력 접근 | Privacy - Calendars Usage Description |
|. 카메라 접근 | Privacy - Camera Usage Description |
| 위치정보 접근 (사용할경우만) | Privacy - Location Always and When In...| 
| 사진 라이브러리 접근 | Privacy - Photo Library Additions Usage Description |


#### - 사용순서

1. UIImagePickerController 인스턴스 생성 <br>
2. Delegate 설정 (UIImagePickerControllerDelegate,UINavigationControllerD elegate 두개의!! 프로토콜 채택) <br>
3. UIImagePicker의 sourceType 설정 Present! <br>

| *  | * | 
| :------------: | :-----------: | 
| ![screen](/study/imagePicker-3.jpg) | ![screen](/study/imagePicker-4.jpg) |   

```swift

func showImagePicker(_ sender: Any) {
	// 1.	let cameraController = UIImagePickerController()	// 2. 	UIImagePickerControllerDelegate, UINavigationControllerDelegate 두개 모두 채택!	cameraController.delegate = self	// 3. sourceType설정	cameraController.sourceType = .photoLibrary	// 4. present	present(cameraController, animated: true, completion: nil)}

-> UIImshrPivkrtVonytollrtDoutvrType 를 살펴보면, enum으로 되어있는데, 

enum UIImagePickerControllerSourceType : Int {	case photoLibrary	case camera	case savedPhotosAlbum}

위의 구조로 되어있다.


```

#### - 사용 예시

```swift

let actionSheet = UIAlertController(title: "골라", message: "초이스", preferredStyle: .actionSheet)
        
        // 카메라가 달려있는지 없는지에 대해서 검사하고,
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction: UIAlertAction = UIAlertAction(title: "카메라", style: .default, handler: { (action) in
                let cameraController = UIImagePickerController()
                cameraController.delegate = self
                cameraController.sourceType = .camera
                self.present(cameraController, animated: true, completion: nil)
            })
            // 알럿에 액션 추가
            actionSheet.addAction(cameraAction)
        }
        
        let photoAction: UIAlertAction = UIAlertAction(title: "사진", style: .default, handler: { (action) in
            let cameraController = UIImagePickerController()
            cameraController.delegate = self
            cameraController.sourceType = .photoLibrary
            self.present(cameraController, animated: true, completion: nil)
        })
        actionSheet.addAction(photoAction)
        
        present(actionSheet, animated: true, completion: nil)
    }


-> 알럿을 통해서, UIImagePickerController 의 사용 유무를 검사한후, 사용한다(예를 들어서, 카메라가 없는 디바이스에서 사용시 app이 cursh가 발생하기 때문이다.)



```



#### - 대표적인 메소드

```swift

	/사진을 선택 후 불리는 델리게이트 메소드func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : Any]) {	print(info)
	
	// picker 이후 사진첩을 나가는..	picker.dismiss(animated: true, completion: nil)}
	//취소했을때 불리는 델리게이트 메소드
func imagePickerControllerDidCancel(_ picker:UIImagePickerController) {	picker.dismiss(animated: true, completion: nil)}

```


#### - 메서드 응용

```swift


func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
        
        // info를 통해서 이미지 정보값을 가져온다.
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            //detailImageView.image = img
            picker.dismiss(animated: true, completion: nil)
            
        }
        
        // image의 URL 값을 어떤 Data 타입으로 변환후 -> UserDefaults에 `profileImgData` 키값으로 저장해놓고, 선택한 이미지를 Defaults 이미지로서 사용한다.
        // 현재 설정한 이미지를 저장하고 싶으면,
        if let url = info[UIImagePickerControllerImageURL] as? URL {
            
            if let data = try? Data(contentsOf: url) {
                
                print(data)
                detailImageView.image = UIImage(data: data)
                
                //유저 디폴트에 저장하고
                UserDefaults.standard.set(data, forKey: "profileImgData")
                // image 를 userDefault로 저장해서 사용하는 방식을 채택함.. 오..
                
            }
            
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
``` 


---

## Reference 

[UIImagePickerControllerDelegate](https://developer.apple.com/documentation/uikit/uiimagepickercontrollerdelegate) <br>

[UIImagePickerController](https://developer.apple.com/documentation/uikit/uiimagepickercontroller)
