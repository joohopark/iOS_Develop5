

import UIKit
import Firebase
import CoreData

class BrowsingViewController: UIViewController {
  
  var ref: DatabaseReference!
  let uid = Auth.auth().currentUser?.uid
  
  
  var postArray: [String]?
  var postImageArray: [String] = []
  
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
    
    NotificationCenter.default.addObserver(forName: Notification.Name.init("throwData"), object: nil, queue: nil, using: { (noti) in
      self.ref.child(self.uid!).observeSingleEvent(of: .value) { (dataSnapshot) in
        if let loadData = dataSnapshot.value as? NSDictionary {
          DispatchQueue.main.async {
            self.postArray = []
            let postDataArrOfAny = loadData["post"]! as! [Any]
            
            for item in postDataArrOfAny {
              if item is NSNull {
                print("\(item) is null")
              }else {
                let temp = item as! [String:String]
                self.postArray!.append(temp["contents"] as! String)
                self.postImageArray.append(temp["image"] as! String)
              }
            }
            self.tableView.reloadData()
          }
          
          
        }
      }
    })
    
    ref.child(uid!).observeSingleEvent(of: .value) { (dataSnapshot) in
      
      
      
      
      if let loadData = dataSnapshot.value as? NSDictionary {
        DispatchQueue.main.async {
          self.postArray = []
          let postDataArrOfAny = loadData["post"]! as! [Any]
          
          for item in postDataArrOfAny {
            if item is NSNull {
              print("\(item) is null")
            }else {
              let temp = item as! [String:String]
              self.postArray!.append(temp["contents"] as! String)
              self.postImageArray.append(temp["image"] as! String)
            }
          }
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
    
    return self.postImageArray.count ?? 0
    
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
    let imagePath = postImageArray[indexPath.row]
    let data = try? Data(contentsOf: URL(string: imagePath)!)
    cell.imageView?.image = UIImage(data: data!)
    
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  
  
}

//
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

  //  required init?(coder aDecoder: NSCoder) {
  //    super.init(coder: aDecoder)
  //    self.imageView?.addSubview(postImageView)
  //    postImageView.translatesAutoresizingMaskIntoConstraints = false
  //
  //    postImageView.topAnchor.constraint(equalTo: (self.imageView?.topAnchor)!).isActive = true
  //    postImageView.leftAnchor.constraint(equalTo: (self.imageView?.leftAnchor)!).isActive = true
  //    postImageView.rightAnchor.constraint(equalTo: (self.imageView?.rightAnchor)!).isActive = true
  //    postImageView.bottomAnchor.constraint(equalTo: (self.imageView?.bottomAnchor)!).isActive = true

  //  }


  override func layoutSubviews() {
    super.layoutSubviews()
    super.layoutSubviews()
    // Customize imageView like you need
    
    self.imageView?.frame = CGRect(x: 10, y: 0, width: 40, height: 40)
    self.imageView?.contentMode = UIViewContentMode.scaleAspectFit
    // Costomize other elements
    CGRect(x: 60, y: 0, width: self.frame.width-45, height: 20)
    
//    imageView?.frame = CGRect(x: (self.imageView?.center.x)!,
//                              y: (self.imageView?.center.y)!,
//                              width: 50,
//                              height: 50)
//    textLb.frame = CGRect(x: ((self.imageView?.center.x)! + 50),
//                          y: (self.imageView?.center.y)!, width: 200, height: 200)
//    self.imageView?.addSubview(postImageView)
//    self.addSubview(textLb)

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


  }


  override func awakeFromNib() {
    super.awakeFromNib()





  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

}


