//
//  ViewController.swift
//  17-10-22-testTableView
//
//  Created by MIN JUN JU on 2017. 10. 22..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tv: UITableView!
    
    var x: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    
        
        
        guard let nextVC = segue.destination as? OtherViewController else { return }
        
        nextVC.y = self.x
        

    }
    
    
    @IBAction func btnAction(_ sender: UIButton) {
        
        self.x = 10
        
        print(self.x)
        
    }
    
    
    
}




