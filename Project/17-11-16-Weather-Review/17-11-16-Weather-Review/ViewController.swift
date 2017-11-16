
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        WeatherDataModel.Main.setData { (data, response, error) in
          print(data, response, error)
            
        }
    }




}

