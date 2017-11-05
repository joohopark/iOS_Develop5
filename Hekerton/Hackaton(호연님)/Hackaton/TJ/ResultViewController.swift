
import UIKit

class ResultViewController: UIViewController {

    //MARK: - Variable
    @IBOutlet weak var userNameLb: UILabel!
    @IBOutlet weak var resultTitle: UILabel!
    @IBOutlet weak var userResultTextView: UITextView!
    @IBOutlet weak var detailButton: UIButton!
    
    var resultCenter: ResultCenter?
    
    var dCount: Int = UserDefaults.standard.integer(forKey: "dCount")
    var iCount: Int = UserDefaults.standard.integer(forKey: "iCount")
    var sCount: Int = UserDefaults.standard.integer(forKey: "sCount")
    var cCount: Int = UserDefaults.standard.integer(forKey: "cCount")

    var countArray: [Int] = []
    var tempArray: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultCenter = ResultCenter()
        
        userNameLb.text = UserDefaults.standard.string(forKey: "name")! + "님"
        UserDefaults.standard.string(forKey: "email")
        
        countArray = [dCount, iCount, sCount, cCount]
        tempArray = countArray.sorted(by: { (num1, num2) -> Bool in
            num1 > num2
        })
        viewText()
        createUI()
    }
    
    //MARK: - Create UI
    func createUI() {
        detailButton.layer.cornerRadius = 10
        detailButton.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        detailButton.layer.shadowOpacity = 0.5
        detailButton.clipsToBounds = true
        
        userResultTextView.layer.cornerRadius = 10
        userResultTextView.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        userResultTextView.layer.borderWidth = 5
        
    }
    
    
    //MARK: - Method
    func compareCount() -> Int {
        for index in tempArray {
            for list in countArray {
                if list == index {
                    if let typeIndex = countArray.index(of: index) {
                        return typeIndex
                    }
                }
            }
        }
        return 0
    }
    
    func viewText() {
        switch compareCount() {
        case 0:
            resultTitle.text =  resultCenter?.result?.d?.title
            userResultTextView.text = resultCenter?.result?.d?.msg
        case 1:
            resultTitle.text =  resultCenter?.result?.i?.title
            userResultTextView.text = resultCenter?.result?.i?.msg
        case 2:
            resultTitle.text =  resultCenter?.result?.s?.title
            userResultTextView.text = resultCenter?.result?.s?.msg
        case 3:
            resultTitle.text =  resultCenter?.result?.c?.title
            userResultTextView.text = resultCenter?.result?.c?.msg
        default :
            print("안돼")
        }
    }
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let destinationViewController = segue.destination as! DetailViewController
            print(dCount)
            
            destinationViewController.dCount = CGFloat(dCount)
            destinationViewController.iCount = CGFloat(iCount)
            destinationViewController.sCount = CGFloat(sCount)
            destinationViewController.cCount = CGFloat(cCount)
        }
    }
    
    @IBAction func unwindAction(segue:UIStoryboardSegue) {
    
    }
    
}
