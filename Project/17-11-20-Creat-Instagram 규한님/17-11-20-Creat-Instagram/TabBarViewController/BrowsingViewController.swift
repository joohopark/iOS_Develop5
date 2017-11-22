

import UIKit
import Firebase
import CoreData

class BrowsingViewController: UIViewController {
  
  var ref: DatabaseReference!
  let uid = Auth.auth().currentUser?.uid
  
  var storePostData: NSArray!
  
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
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    tableView.rowHeight = UITableViewAutomaticDimension
    
    ref.child(uid!).observeSingleEvent(of: .value) { (dataSnapshot) in
      if let loadData = dataSnapshot.value as? NSDictionary {
        
        DispatchQueue.main.async {
          self.storePostData = loadData["post"] as! NSArray
          print(self.storePostData)
          self.tableView.reloadData()
          
        }
        
        
      }
    }
    
    
    
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    tableView.reloadData()
  }
  
}



extension BrowsingViewController: UITableViewDelegate,UITableViewDataSource {
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.storePostData.count ?? 0
    
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    guard let postData = self.storePostData else {return cell}
    
    
    cell.textLabel?.numberOfLines = 0
    //let cellText = postData[indexPath.row] ["contents"] as! String
    
    cell.textLabel?.text = "\(indexPath.row)"
    //cell.imageView?.image =
    
    return cell
    
    
    
  }
}


//class BrowsingCustomCell: UITableViewCell {
//
//  let postImageView: UIImageView = {
//    let iv = UIImageView()
//    iv.contentMode = .scaleAspectFill
//    iv.clipsToBounds = true
//    iv.backgroundColor = .lightGray
//    return iv
//  }()
//
//  let textLb: UILabel = {
//    let lb = UILabel()
//    lb.numberOfLines = 0
//    lb.textColor = .black
//
//    return lb
//  }()
//
//  //  required init?(coder aDecoder: NSCoder) {
//  //    super.init(coder: aDecoder)
//  //    self.imageView?.addSubview(postImageView)
//  //    postImageView.translatesAutoresizingMaskIntoConstraints = false
//  //
//  //    postImageView.topAnchor.constraint(equalTo: (self.imageView?.topAnchor)!).isActive = true
//  //    postImageView.leftAnchor.constraint(equalTo: (self.imageView?.leftAnchor)!).isActive = true
//  //    postImageView.rightAnchor.constraint(equalTo: (self.imageView?.rightAnchor)!).isActive = true
//  //    postImageView.bottomAnchor.constraint(equalTo: (self.imageView?.bottomAnchor)!).isActive = true
//
//  //  }
//
//
//
//
//  override func awakeFromNib() {
//    super.awakeFromNib()
//    imageView?.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
//    textLb.frame = CGRect(x: 10, y: 10, width: 200, height: 200)
//    self.imageView?.addSubview(postImageView)
//    self.addSubview(textLb)
//
//    postImageView.translatesAutoresizingMaskIntoConstraints = false
//    postImageView.topAnchor.constraint(equalTo: (self.imageView?.topAnchor)!).isActive = true
//    postImageView.leftAnchor.constraint(equalTo: (self.imageView?.leftAnchor)!).isActive = true
//    postImageView.rightAnchor.constraint(equalTo: (self.imageView?.rightAnchor)!).isActive = true
//    postImageView.bottomAnchor.constraint(equalTo: (self.imageView?.bottomAnchor)!).isActive = true
//
//
//    textLb.translatesAutoresizingMaskIntoConstraints = false
//    textLb.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//    textLb.leftAnchor.constraint(equalTo: (self.imageView?.rightAnchor)!).isActive = true
//    textLb.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//    textLb.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//
//
//  }
//
//  override func setSelected(_ selected: Bool, animated: Bool) {
//    super.setSelected(selected, animated: animated)
//
//    // Configure the view for the selected state
//  }
//
//}


