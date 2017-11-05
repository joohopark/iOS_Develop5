//
//  FirstUseViewController.swift
//  MiniHackerton
//
//  Created by 김정원 on 2017. 11. 2..
//  Copyright © 2017년 김정원. All rights reserved.
//

import UIKit

class FirstUseViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView?
    @IBOutlet weak var pageControl: UIPageControl?
    let SEGUE_TO_MAIN = "segueFirstUseToMain"
    
    static let isNotFirst = "isNotFirst"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vcIdentifiers = ["vc1","vc2","vc3"]
        let stackView = UIStackView(frame: CGRect(
            x: 0, y: 0,
            width: view.bounds.width * CGFloat(vcIdentifiers.count),
            height: view.bounds.height))
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        scrollView?.addSubview(stackView)
        
        for identifier in vcIdentifiers {
            if let vc = storyboard?.instantiateViewController(withIdentifier: identifier) {
                addChildViewController(vc)
                vc.view.frame.size.width = view.bounds.width
                vc.view.frame.size.height = view.bounds.height
                vc.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
                stackView.addArrangedSubview(vc.view)
            }
        }
        
        if let scrollView = scrollView {
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            ])
        }
        
        if let lastPageView = stackView.arrangedSubviews.last {
            for view in lastPageView.subviews.reversed(){
                if let button = view as? UIButton {
                    button.addTarget(self, action: #selector(handleBtn(_:)), for: .touchUpInside)
                    break
                }
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl?.currentPage = Int(scrollView.contentOffset.x / view.bounds.width)
    }
    
    @objc func handleBtn(_ button: UIButton){
        UserDefaults.standard.set(true, forKey: FirstUseViewController.isNotFirst)
        performSegue(withIdentifier: SEGUE_TO_MAIN, sender: self)
    }

}
