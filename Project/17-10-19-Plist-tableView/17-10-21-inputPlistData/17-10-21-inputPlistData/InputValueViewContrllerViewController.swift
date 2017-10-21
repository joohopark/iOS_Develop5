

import UIKit

class InputValueViewContrllerViewController: UIViewController {

    @IBOutlet weak var tf: UITextField!
    
    @IBOutlet weak var tv: UITextView!
    var documentDirectory: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 이전에 추가한 데이터 추가
        addBundleData()

        
    }

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
    

}
