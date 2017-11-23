

import UIKit
import Firebase
import CoreData

class BrowsingViewController: UIViewController {
  
  var ref: DatabaseReference!
  let uid = Auth.auth().currentUser?.uid
  var postArray: [String]?
  var postImageArray: [String]? = []
  
  let tableView: UITableView = {
    let tv: UITableView = UITableView()
    return tv
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    ref = Database.database().reference()
    view.backgroundColor = .white
    view.addSubview(tableView)
    tableView.frame = CGRect(x: 0,
                             y: 0,
                             width: self.view.bounds.size.width,
                             height: self.view.bounds.size.height)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(BrowsingCustomCell.self, forCellReuseIdentifier: "Cell")
    tableView.rowHeight = UITableViewAutomaticDimension
    
    getNetworkData()
  }
  
  func getNetworkData() {
    ref.child(uid!).observeSingleEvent(of: .value) { (dataSnapshot) in
      if let loadData = dataSnapshot.value as? NSDictionary {
        DispatchQueue.main.async {
          self.postArray = []
          if let postDataArrOfAny = loadData["post"] as? [Any] {
            let postDataArrOfAny = loadData["post"]! as? [Any]
            
            for item in postDataArrOfAny! {
              if item is NSNull {
                print("\(item) is null")
              }else {
                let temp = item as! [String:String]
                self.postArray!.append(temp["contents"]!)
                self.postImageArray!.append(temp["image"]!)
              }
            }
            self.tableView.reloadData()
          }
        }
      }
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    NotificationCenter.default.addObserver(forName: Notification.Name.init("netWorkData"), object: nil, queue: nil) { (noti) in
      self.postImageArray = []
      self.postArray = []
      self.getNetworkData()
    
    }
    tableView.reloadData()
  }
  
}



extension BrowsingViewController: UITableViewDelegate,UITableViewDataSource {
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return self.postImageArray!.count ?? 0
    
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BrowsingCustomCell
    guard let postData = self.postArray else {return cell}
    
    cell.bounds = CGRect(x: 0, y: 0, width: 45, height: 45)
    cell.imageView?.bounds = CGRect(x: 0, y: 0, width: 45, height: 45)
    
    cell.textLabel?.numberOfLines = 0
    cell.textLabel?.text = "\(postArray![indexPath.row])"
    cell.imageView?.clipsToBounds = true
    cell.imageView?.contentMode = .scaleAspectFit
    let imagePath = postImageArray![indexPath.row]
    let data = try? Data(contentsOf: URL(string: imagePath)!)
    cell.imageView?.image = UIImage(data: data!)
    
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  
  
}


class BrowsingCustomCell: UITableViewCell {
  
  let postImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.backgroundColor = .lightGray
    return iv
  }()
  
  let textLb: UILabel = {
    let lb = UILabel()
    lb.numberOfLines = 0
    lb.textAlignment = .center
    lb.textColor = .black
    
    return lb
  }()
  
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    // Customize imageView like you need
    
    self.imageView?.frame = CGRect(x: 10, y: 0, width: 40, height: 40)
    self.imageView?.contentMode = UIViewContentMode.scaleAspectFit
    // Costomize other elements
    CGRect(x: 60, y: 0, width: self.frame.width-45, height: 20)
    
    
    
  }
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    
    
    
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}


