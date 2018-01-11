
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(WeatherDataModel.Main.setData { (data, response, error) in
          print(data, response, error)
          
    })
  }



}

