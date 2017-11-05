//
//  MultipleChoiceViewController.swift
//  SemiHackathon
//
//  Created by esung on 2017. 11. 2..
//  Copyright © 2017년 esung. All rights reserved.
//

import UIKit

class SD_MultipleChoiceViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ResultViewControllerDelegate{
    func dismissCalled() {
        dismiss(animated: false, completion: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataHandler.main.questions.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SD_QuestionCell
        let question = DataHandler.main.questions[indexPath.row]
        cell.q1Button.setTitle(question.options[0].0, for: .normal)
        cell.q2Button.setTitle(question.options[1].0, for: .normal)
        cell.q3Button.setTitle(question.options[2].0, for: .normal)
        cell.q4Button.setTitle(question.options[3].0, for: .normal)
        let randomNumbers = generateRandomArray(with: 4)
        
        cell.q1Button.setTitle(question.options[randomNumbers[0]].0, for: .normal)
        cell.q2Button.setTitle(question.options[randomNumbers[1]].0, for: .normal)
        cell.q3Button.setTitle(question.options[randomNumbers[2]].0, for: .normal)
        cell.q4Button.setTitle(question.options[randomNumbers[3]].0, for: .normal)
        
        cell.setClosure {(buttonTag:Int) in
            
            User.main.increaseScore(of: question.options[randomNumbers[buttonTag]].1)
            print(question.options[randomNumbers[buttonTag]].1)
            if indexPath.row < DataHandler.main.questions.count - 1{
                let offset = CGPoint(x: CGFloat(indexPath.row + 1) * cell.frame.width, y: 0)
                collectionView.setContentOffset(offset, animated: true)
            }else{
                let vc = ResultViewController()
                vc.delegate = self
                self.present(vc, animated: true, completion: nil)
            }

        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height - 20)
    }
    
    @IBOutlet weak var collectionView:UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
