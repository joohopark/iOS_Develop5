# 46_17-11-11

---

## UISearchController, CAGradientLayer

---

## UISearchController

| 검색전 | 검색후 |
| :---: | :---: |
| ![screen](/study/image/searchController.png) |![screen](/study/image/searchController-1.png) |

`UISearchController` 생성시 cell 재사용에 따라서 고려해야 하는 부분들이 생긴다. cell의 `numberOfRowsInSection`, `cellForRowAt` 부분을 검색창이 활성화 되어있는 검색창에서 사용되는 cell의 데이터와, 검색창이 비활성화 되어있을때 사용되어 지는 cell의 데이터를 나누어서 사용해야합니다..!

```swift
class ViewController: UIViewController {
var searchController: UISearchController?
    
    // 원본 데이터와, 검색시 사용되어지는 데이터 를 나누어서 정의합니다.
    var dataOrigin: [String]? = Data.singerTon.data
    var dataSource: [String]? = []
    let identifier = "Cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.dataSource = self
        tv.delegate = self        
        // SearchBarController
        searchController = UISearchController(searchResultsController: nil)
        // searchController 를 navigationItem에 넣습니다.
        self.navigationItem.searchController = searchController
        searchController?.searchResultsUpdater = self
        searchController?.obscuresBackgroundDuringPresentation = false
        searchController?.searchBar.placeholder = "searchBar Placeholder"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    // tableView를 정의 합니다
    extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController?.isActive == false {
            return (Data.singerTon.data?.count)!
        }else {
            return dataSource!.count
        }   
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CustomCell
        if searchController?.isActive == false {
            cell?.textLabel?.text = "\(Data.singerTon.data![indexPath.row])"
            cell?.centerLB.text = "centerLB"
            return cell!
        }else {
            cell?.textLabel?.text = dataSource![indexPath.row]
            return cell!
        }        
    }
}
}

//searchbarController 부분을 정의 합니다.
extension ViewController: UISearchResultsUpdating {   
    func updateSearchResults(for searchController: UISearchController) {
        let searchBarText = searchController.searchBar
        if searchBarText.text != nil && (searchBarText.text?.count)! > 0 {            
            dataSource = dataOrigin!.filter({
                $0.contains(searchBarText.text!)
            })
            print(dataSource)
        }else {
            print("검색 비활성화")
            dataSource?.removeAll()
            dataSource = dataOrigin
        }
        tv.reloadData()
    }
}


// data를 따로 정의합니다
struct Data {
    static var singerTon: Data = Data()
    var data: [String]?
    private init() {
        addData()
    }
    mutating func addData() {
        self.data = []
        for item in 0..<10 {
            self.data?.append("\(item)")
        }   
    }
}
```

---

## CAGradientLayer


![screen](/study/image/searchController-2.png)

```swift
let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor(red:0.12, green:0.11, blue:0.25, alpha:1.00).cgColor,
                           UIColor(red:0.79, green:0.53, blue:0.62, alpha:1.00).cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
        UIView.animate(withDuration: 1, delay: 1, options: .curveEaseIn, animations: {
        })
```

#### - 응용


```swift
func gradient(frame:CGRect) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = frame
        layer.startPoint = CGPoint(x: 2, y: 0.5)
        layer.endPoint = CGPoint(x: 0, y: 1)
        layer.colors = [ UIColor(red:0.12, green:0.11, blue:0.25, alpha:1.00).cgColor ,
                         UIColor(red:0.79, green:0.53, blue:0.62, alpha:1.00).cgColor]
        return layer
    }
    cell.layer.insertSublayer(gradient(frame: cell.bounds), at: 0)
```

위와같은 방식으로 사용이 가능합니다. tableView의 cell 마다 그라데이션을 적용하기 위해서 함수를 만들어서 사용했습니다.

