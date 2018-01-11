

import UIKit

class MainTabbarController: UITabBarController{
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("MainTabbarController 호출")
    self.tabBar.backgroundColor = .clear
    self.delegate = self
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension MainTabbarController: UITabBarControllerDelegate {
  
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    
    if viewController is UINavigationController {
      print("뷰컨트롤러 확인")
      let nextVC = AddPostViewController()
      let nextNavigationView = UINavigationController(rootViewController: nextVC)
      
      present(nextNavigationView, animated: true, completion: nil)
      
      return false
      
    }
    print(tabBarController, viewController)
    
    return true
  }
  
}
