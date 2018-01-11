# 48_17-11-16

---

## IOS NetWork, URL Load System, URLRequset, URLSession, URLSessionTask, URLSessionConfiguration, 네트워크 실행 순서(중요!)

---
 
## URL Load System

URL을 통해서 컨텐츠의 리소스를 받아올수 있는 가장 일반적인 방법으로 URLSeesion을 사용합니다. 

![screen](/study/image/iosNetwork.jpg)

---

## URLRequset 

URL Loading System에서 요청에 대한 추가 정보를 가지고 있고, URL 및 프로토콜 별 속성을 캡슐화한 Class 입니다. 요청하는 정보에 대해서만 캡슐화 하고 있고, 서버에 요청하는 역할을 URLSeesion을 통해서 합니다

```swift
public init(url: URL, cachePolicy: URLRequest.CachePolicy = default,timeoutInterval: TimeInterval = default)var cachePolicy: URLRequest.CachePolicyvar timeoutInterval: TimeIntervalvar networkServiceType: URLRequest.NetworkServiceTypevar httpMethod: String?var httpBody: Data?func addValue(_ value: String, forHTTPHeaderField field: String)func setValue(_ value: String?, forHTTPHeaderField field: String)
```

---


## URLSession 

URLSession 프로퍼트중 sheard 는 싱글턴 패턴으로 되어있고, Task 요청 하나하나가 closure 로 비동처리 됩니다. 

`Session` 과 `task` 의 차이는 Session이 Task 보다 큰 단위입니다.

#### - 지원 가능 URL

- File Transfer Protocol (ftp://) <br>
- Hypertext Transfer Protocol (http://) <br>
- Hypertext Transfer Protocol with encryption (https://)  <br>
- Local file URLs (file:///) <br>
- Data URLs (data://) <br>

```swift
class var shared: URLSession { get }
init(configuration: URLSessionConfiguration)
func dataTask(with request: URLRequest,completionHandler:@escaping(Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTaskfunc dataTask(with url: URL, completionHandler:@escaping(Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTaskfunc uploadTask(with request: URLRequest, from bodyData: Data?, completionHandler:@escaping(Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionUploadTask
func downloadTask(with request: URLRequest, completionHandler:@escaping(URL?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDownloadTask
```

---

## URLSessionTask 

URLSessionTask는 URLSession의 작업 하나(Task)를 나타내는 추상클래스로 URLSession을 통해서만 생성 가능합니다.

![screen](/study/image/iosNetwork-1.jpg)

- NSURLSessionDataTask: HTTP GET요청으로 서버로부터 데이터를 가져오는 작업을 수행합니다. <br>
- NSURLSessionUploadTask: 디스크로부터 웹서버로 파일을 업로드하는 작업을 수행합니다. 주로 HTTP POST, PUT 메소 드를 이용합니다 <br>
- NSURLSessionDownloadTask: 서버로부터 파일을 다운로드 하는 작업을 수행합니다. <br>

---

## URLSessionConfiguration

URLSessionConfiguration은 Session의 설정에 관련된 클래스.  다음 3가지 중 하나 값으로 생성되며, 타임아웃, 캐시 정책등의 프로퍼티를 설정가능 합니다

1. default: 디폴트 configuration 객체를 생성합니다. 디폴드 값으 로는 파일로 다운로드 될때를 제외하고는 Disk에 캐쉬를 저장하 며, 키체인에 자격을 저장합니다.<br>

2. ephemeral: 디폴트 configuration과 설정은 동일하다 session관 련 데이터가 메모리에 올라갑니다. <br>

3. background: Session이 백그라운드에서 다운로드 작업과 업로 드 작업을 마져 수행할 수 있도록 합니다. <br>

---

## 네트워크 실행 순서(중요)

1. URLRequest 인스턴스 생성. (요청생성) <br>
2. URLSession 인스턴스 생성.   (*URLConfiguration 설정은 옵션) <br>
3. URLSession의 메소드를 통해 URLSessionTask 생성 <br>
4. Task 실행 : 네트워크 요청 <br>
5. 요청한 task에 대한 응답(respond)처리 (Delegate or Closure) <br>
6. JSONSerialization or JSONDecoder(Swift 4)를 통해 알맞은 데 이터 인스턴스로 변환 <br>

```swift
let url = URL(string:"http://naver.com")!//request instansevar request = URLRequest(url: url)//config = defaultrequest.httpMethod = “POST"//request.httpMethod = “GET”//bodyDatalet dataStr = "{username:\(userID),password:\(pw)}"let data = dataStr.data(using: .utf8)request.httpBody = data
```

> URL 생성시, app crush 나는 부분을 명확하게 지정해주어야 합니다. 무조건 옵셔널 바인딩 처리후, 사용하는것이 능사가 아니라고 하는 부분이 딱 네트워크 부분인것 같습니다.

---

