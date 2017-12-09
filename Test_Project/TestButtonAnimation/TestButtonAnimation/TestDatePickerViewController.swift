

import UIKit

class TestDatePickerViewController: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        dateTextField.inputView = datePickerView
        datePickerView.addTarget(self,
                                 action: #selector(self.datePickerValueChanged),
                                 for: UIControlEvents.valueChanged)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc func datePickerValueChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateTextField.text = dateFormatter.string(from: sender.date)
        print("""
            sender.date is \(sender.date)
            dateFormatter.string is \(dateFormatter.string(from: sender.date))
            """)
    }
    
}
