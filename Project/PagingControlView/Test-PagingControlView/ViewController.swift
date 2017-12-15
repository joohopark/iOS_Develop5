//
//  ViewController.swift
//  Test-PagingControlView
//
//  Created by MIN JUN JU on 2017. 12. 15..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate  {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        let slides: [Slider] = creatSlider()
        setSliderScrollView(sliders: slides)
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
    }

    func creatSlider() -> [Slider] {
        let slider1: Slider = Bundle.main.loadNibNamed("Slider", owner: self, options: nil)?.first as! Slider
        slider1.label.text = "첫번쨰?"
        let slider2: Slider = Bundle.main.loadNibNamed("Slider", owner: self, options: nil)?.first as! Slider
        slider1.label.text = "두번째?"
        return [slider1, slider2]
    }
    func setSliderScrollView(sliders: [Slider]) {
        scrollView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: view.frame.width,
                                  height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(sliders.count),
                                        height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for item in 0..<sliders.count {
            sliders[item].frame = CGRect(x: view.frame.width * CGFloat(item),
                                         y: 0,
                                         width: view.frame.width,
                                         height: view.frame.height)
            scrollView.addSubview(sliders[item])
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIDX = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIDX)
    }


}

