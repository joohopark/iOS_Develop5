

import UIKit

class SetGesture: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var redView: UIView!
    
    
    @IBOutlet weak var pupleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        
        print("텝 체스쳐")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    @IBAction func longGesture(_ sender: UILongPressGestureRecognizer) {
        print("롱제스쳐 소환")
    }
    
    
    func gestureRecognizer(_ gestureRecognizer:
        UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        //터치된 포인트가 inView위치에 어느 좌표에 해당되는지 표시
        print("xposition", touch.location(in: touch.view).x)
        //터치가 일어난 시간 반환
        print("touch timeStamp",touch.timestamp)
            //연속적으로 일어난 터치의 횟수
            print("touch tapCount",touch.tapCount)
            return true
    }
}
