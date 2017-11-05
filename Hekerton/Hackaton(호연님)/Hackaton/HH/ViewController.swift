//
//  ViewController.swift
//  Hackaton
//
//  Created by moonhohyeon on 2017. 11. 2..
//  Copyright © 2017년 FC. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!    
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var labelCurrent: UILabel!
    
    var selectedLB: UILabel!
    var array: [String] = []
    var arrayTemp: [String] = []
    
    var dCount = 0
    var iCount = 0
    var sCount = 0
    var cCount = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        labelCurrent.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        labelCurrent.layer.shadowOpacity = 1.0
        labelCurrent.layer.shadowRadius = 10
        labelCurrent.layer.masksToBounds = false
        
        loadData()
    }
    
    func loadData()
    {
        let dataItem = DataCenter.main.dataModel?.dataItem
        
        array = [dataItem!.d, dataItem!.i, dataItem!.s, dataItem!.c]
        arrayTemp = array
        arrayTemp.shuffle()
        
        label1.text = arrayTemp[0]
        label2.text = arrayTemp[1]
        label3.text = arrayTemp[2]
        label4.text = arrayTemp[3]
        
        labelCurrent.text = "Question : \((DataCenter.main.dataModel?.currentPage)! + 1)"
    }
    
    func compare(_ label: String?)
    {
        switch label!
        {
        case array[0]:
            dCount = UserDefaults.standard.integer(forKey: "dCount")
            dCount += 1
            UserDefaults.standard.set(dCount, forKey: "dCount")
        case array[1]:
            iCount = UserDefaults.standard.integer(forKey: "iCount")
            iCount += 1
            UserDefaults.standard.set(iCount, forKey: "iCount")
        case array[2]:
            sCount = UserDefaults.standard.integer(forKey: "sCount")
            sCount += 1
            UserDefaults.standard.set(sCount, forKey: "sCount")
        case array[3]:
            cCount = UserDefaults.standard.integer(forKey: "cCount")
            cCount += 1
            UserDefaults.standard.set(cCount, forKey: "cCount")
        default:
            print("buttonClick")
        }
    }
    
    func noSelectionAlert()
    {
        let alert = UIAlertController(title: "보기를 선택해주세요", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func button1Action(_ sender: UIButton)
    {
        button2.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        button3.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        button4.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        
        button2.isSelected = false
        button3.isSelected = false
        button4.isSelected = false
        
        sender.isSelected = true
        
        sender.layer.borderColor = sender.isSelected ? #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        sender.layer.borderWidth = 5
        
        selectedLB = label1
    }
    
    @IBAction func button2Action(_ sender: UIButton)
    {
        button1.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        button3.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        button4.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        
        button1.isSelected = false
        button3.isSelected = false
        button4.isSelected = false
        
        sender.isSelected = true
        
        sender.layer.borderColor = sender.isSelected ? #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        sender.layer.borderWidth = 5
        
        selectedLB = label2
    }
    
    @IBAction func button3Action(_ sender: UIButton)
    {
        button1.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        button2.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        button4.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        
        button1.isSelected = false
        button2.isSelected = false
        button4.isSelected = false
        
        sender.isSelected = true
        
        sender.layer.borderColor = sender.isSelected ? #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        sender.layer.borderWidth = 5
        
        selectedLB = label3
    }
    
    @IBAction func button4Action(_ sender: UIButton)
    {
        button1.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        button2.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        button3.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        
        button1.isSelected = false
        button2.isSelected = false
        button3.isSelected = false
        
        sender.isSelected = true
        
        sender.layer.borderColor = sender.isSelected ? #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        sender.layer.borderWidth = 5
        
        selectedLB = label4
    }
    
    @IBAction func nextAction(_ sender: UIButton)
    {
        guard let realSelectedLB = self.selectedLB else
        {
            return noSelectionAlert()
        }
        
        compare(realSelectedLB.text)
        
        DataCenter.main.dataModel?.currentPage += 1
        
        loadData()
        
        if let filePath = Bundle.main.path(forResource: "exampleList", ofType: "plist"),
            let dic = NSDictionary(contentsOfFile: filePath) as? [String:Any]
        {
            DataCenter.main.dataModel?.load(dic)
        }
        
        if labelCurrent.text == "Question : 25"
        {
            performSegue(withIdentifier: "result", sender: self)
        }
        
        let next = storyboard?.instantiateViewController(withIdentifier: "selection")
        present(next!, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "result"
        {
            DataCenter.main.dataModel?.currentPage = 0
        }
    }
}

extension Array
{
    mutating func shuffle()
    {
        for _ in 0..<count
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}

