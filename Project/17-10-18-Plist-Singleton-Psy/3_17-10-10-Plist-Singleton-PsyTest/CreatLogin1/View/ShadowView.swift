import UIKit

class ShadowView: UIView {
    
    // 그라데이션 만들기
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // 여기서 self 는 View이다.
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        
        // 쉐도우가 얼만큼 보이게 할건지 설정 해줄수도 있다..?
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        self.layer.shadowOpacity = 0.5
    }
}


