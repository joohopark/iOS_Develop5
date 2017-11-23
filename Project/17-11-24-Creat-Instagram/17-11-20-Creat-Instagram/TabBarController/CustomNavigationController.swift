

import UIKit

class CustomNavigationController: UINavigationController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    
    let startViewController = StartViewController()
    self.pushViewController(startViewController, animated: true)
  }
  
}
