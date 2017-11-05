//
//  SegueAnimateFadeIn.swift
//  mybuil
//
//  Created by 김정원 on 2016. 10. 31..
//  Copyright © 2016년 김정원. All rights reserved.
//

import UIKit

class SegueAnimateFadeIn: UIStoryboardSegue {
    
    override func perform()
    {
        let src = self.source as UIViewController
        let dst = self.destination as UIViewController
        
        src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
        dst.view.alpha = 0
        
        UIView.animate( withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveLinear,
                        animations: {
                            dst.view.alpha = 1
            },
                        completion: { finished in src.present(dst, animated: false, completion: nil) }
        )
    }
    
}

class SegueAnimateFadeOut: UIStoryboardSegue {
    
    override func perform()
    {
        let src = self.source as UIViewController
        let dst = self.destination as UIViewController
        
        src.view.superview?.insertSubview(dst.view, belowSubview: src.view)
        src.view.alpha = 1

        UIView.animate( withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveLinear,
                        animations: {
                            src.view.alpha = 0
                        },
                        completion: { finished in src.dismiss(animated: false, completion: nil) }
        )
    }
    
}

