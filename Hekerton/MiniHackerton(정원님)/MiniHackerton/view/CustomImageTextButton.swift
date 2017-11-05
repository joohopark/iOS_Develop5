//
//  CustomImageTextView.swift
//  MiniHackerton
//
//  Created by 김정원 on 2017. 11. 2..
//  Copyright © 2017년 김정원. All rights reserved.
//

import UIKit

@IBDesignable
class CustomImageTextButton: UIView {
    private(set) weak var imageView: UIImageView?
    private(set) weak var label: UILabel?
    private(set) weak var button: UIButton?
    var touchUpInsideClosure: ((CustomImageTextButton) -> Void)?
    @IBInspectable var image: UIImage? = nil {
        didSet {
            imageView?.image = image
        }
    }
    
    @IBInspectable var text: String? = nil {
        didSet {
            label?.text = text
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /*override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        var myFrame = self.bounds
        context?.setFillColor(red: 0, green: 0, blue: 0, alpha: 0)
        context?.makeImage().
        UIRectFrame(myFrame)
    }*/
    
    @objc private func handleBtn(_ sender: UIButton){
        touchUpInsideClosure?(self)
    }
    
    override func awakeFromNib() {
        translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView = imageView
        let label = UILabel()
        self.label = label
        
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        addSubview(stackView)
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        self.button = button
        button.addTarget(self, action: #selector(handleBtn(_:)), for: .touchUpInside)
        addSubview(button)
        
        imageView.contentMode = .scaleAspectFit
        label.textAlignment = .center
        label.textColor = .white
        
        imageView.image = image
        label.text = text
        
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: widthAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            button.widthAnchor.constraint(equalTo: widthAnchor),
            button.heightAnchor.constraint(equalTo: heightAnchor),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    

}
