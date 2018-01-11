

import UIKit
import CoreFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    
    var countNumber: Int = 0
    
    override func viewDidLoad() {
        
        
        
        
//          if let data = try? Data(contentsOf: URL(string: "http://4k.com/wp-content/uploads/2014/06/4k-image-santiago.jpg")!) {
//            print(data)
//            print(URL(string: "http://4k.com/wp-content/uploads/2014/06/4k-image-santiago.jpg")!)
//
//            let imageList: [UIImageView] = [imageView, imageView1, imageView2, imageView3, imageView4]
//            for item in imageList {
//                item.image = UIImage(data: data)
//
//            }
//        }
        
        
        
        
        let t = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (t) in
            self.countNumber += 1
            print(self.countNumber)
        }
        
        
        
    }
    
    func loadImage() {
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: URL(string: "http://4k.com/wp-content/uploads/2014/06/4k-image-santiago.jpg")!) {
                DispatchQueue.main.async {
                    
                }
            }
        }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: URL(string: "http://4k.com/wp-content/uploads/2014/06/4k-image-santiago.jpg")!) {
                DispatchQueue.main.async {
                    self.imageView1.image = UIImage(data: data)
                }
            }
        }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: URL(string: "http://4k.com/wp-content/uploads/2014/06/4k-image-santiago.jpg")!) {
                DispatchQueue.main.async {
                    self.imageView2.image = UIImage(data: data)
                }
            }
        }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: URL(string: "http://4k.com/wp-content/uploads/2014/06/4k-image-santiago.jpg")!) {
                DispatchQueue.main.async {
                    self.imageView3.image = UIImage(data: data)
                }
            }
        }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: URL(string: "http://4k.com/wp-content/uploads/2014/06/4k-image-santiago.jpg")!) {
                DispatchQueue.main.async {
                    self.imageView4.image = UIImage(data: data)
                }
            }
        }
    }


    // Thred의 예시
    @IBAction func btnAction(_ sender: UIButton) {
        let q = DispatchQueue.global().async {
            if let data = try? Data(contentsOf: URL(string: "http://4k.com/wp-content/uploads/2014/06/4k-image-santiago.jpg")!) {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
                
            }
        }
        let q1 = DispatchQueue.global().async {
            if let data = try? Data(contentsOf: URL(string: "http://4k.com/wp-content/uploads/2014/06/4k-image-santiago.jpg")!) {
                DispatchQueue.main.async {
                    self.imageView1.image = UIImage(data: data)
                }
            }
        }
        let q2 = DispatchQueue.global().async {
            if let data = try? Data(contentsOf: URL(string: "http://4k.com/wp-content/uploads/2014/06/4k-image-santiago.jpg")!) {
                DispatchQueue.main.sync {
                    self.imageView2.image = UIImage(data: data)
                }
            }
        }
        let q3 = DispatchQueue.global().async {
            if let data = try? Data(contentsOf: URL(string: "http://4k.com/wp-content/uploads/2014/06/4k-image-santiago.jpg")!) {
                DispatchQueue.main.sync {
                    self.imageView3.image = UIImage(data: data)
                }
            }
        }
        let q4 = DispatchQueue.global().async {
            if let data = try? Data(contentsOf: URL(string: "http://4k.com/wp-content/uploads/2014/06/4k-image-santiago.jpg")!) {
                DispatchQueue.main.sync {
                    self.imageView4.image = UIImage(data: data)
                }
            }
        }
    }
}
        
    

        
        
        
        
        
        
        
        
//        let queueA = DispatchQueue(label: "custom_queue-A")
//        let queueB = DispatchQueue(label: "custom_queue-B")
//
//
//        queueA.async {
//            for i in 0..<100 {
//                print("#\(i) This is task on the Queue A")
//                print("\(Thread.current), \(i)")
//            }
//        }
//
//        queueB.async {
//            for i in 0..<100 {
//                print("#\(i) This is task on the Queue B")
//                print("\(Thread.current), \(i)")
//            }
//        }
//
//        print(queueA)
//        print(queueB)
        
//        processTime {
//            let q1 = DispatchQueue(label: "com.q1", qos: .userInteractive, attributes: .concurrent)
//            let q2 = DispatchQueue(label: "com.q2", qos: .default, attributes: .concurrent)
//            let q3 = DispatchQueue(label: "com.q3", qos: .background, attributes: .concurrent)
//
//
//            q1.async {
//                for i in 0..<100 {
//                    print("#\(i) This is task on the Queue A")
//                    if i == 99 {
//                        print("////////end Q1/////////")
//                    }
//                }
//            }
//            q2.async {
//                for i in 0..<100 {
//                    print("#\(i) This is task on the Queue B")
//                    if i == 99 {
//                        print("////////end Q2/////////")
//                    }
//                }
//            }
//            q3.async {
//                for i in 0..<100 {
//                    print("#\(i) This is task on the Queue C")
//                    if i == 99 {
//                        print("////////end Q3/////////")
//                    }
//                }
//            }
//        }
    
    
    func processTime(blockFunction: () -> ()){
        let startTime = CFAbsoluteTimeGetCurrent()
        
        blockFunction()
        let processTime = CFAbsoluteTimeGetCurrent() - startTime
        print("수행 시간 = \(processTime)")
    }
    

    
    
    
    func longTimeAction() {
        var total = 0
        
//        let t = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (t) in
//            total += 1
//            self.LB.text = String(total)
//        }
        
//        if total == 10 {
//            t.invalidate()
//
//        }
//
//        let t = Timer.scheduledTimer(withTimeInterval: 1.0, repeats:true) { (t) in
//            for n in 1...100000 {
//
//                total += 1
//                if total == 12345 {
//                    self.LB.text = String(total)
//                }else {
//                    t.invalidate()
//                    self.LB.text = String(total)
//                }
//                print(total)
//
//            }
//            t
        
        
        
    }



