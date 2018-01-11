import UIKit


class ViewController: UIViewController {

  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var keytextField: UITextField!
  @IBOutlet weak var valueTextfield: UITextField!
  
  // firebase를 사용하기위해서 DatabaseReference 프로퍼티를 사용해주어야함
  // var rootRef: DatabaseReference!
  var ref: DatabaseReference!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // read google info.plist
    ref = Database.database().reference()
    
    
    ref.observe(.childAdded) { (dataSnapshot) in
      print("childAdded value: \(dataSnapshot)")
      
    }
    
    ref.observe(.childChanged) { (dataSnapshot) in
      print("childchanged value: \(dataSnapshot)")
    }
    
    ref.observe(.childRemoved) { (dataSnapshot) in
      print("childRemoved value: \(dataSnapshot)")
    }
  
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
  }
  
  
  
  @IBAction func insertBtnAction(_ sender: UIButton) {
    //node name
    let itemRef = ref.child(nameTextField.text!)
    
    if keytextField.text?.isEmpty == false && valueTextfield.text?.isEmpty == false {
      let key = keytextField.text
      let value = valueTextfield.text
      let addDic:[String:String] = [key!:value!]
      itemRef.setValue(addDic)
      
    }

  }
  @IBAction func deleteBtnAction(_ sender: UIButton) {
    
    let itemRef = ref.child(nameTextField.text!)
    itemRef.removeAllObservers()
    itemRef.removeValue()
    
    
  }
  @IBAction func selectBtnAction(_ sender: UIButton) {
    
    let itemRef = ref.child(nameTextField.text!)

    
    
    
//    itemRef.updateChildValues(x)
  }
  
  
  
  
  
  

}

