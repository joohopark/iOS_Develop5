//
//  Extensions.swift
//  SemiHackathon
//
//  Created by Sangjun Lee on 02/11/2017.
//  Copyright © 2017 esung. All rights reserved.
//

import UIKit

extension UIColor{
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
}

extension UIView{
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, topSpacing: CGFloat?, leftSpacing: CGFloat?, bottomSpacing: CGFloat?, rightSpacing: CGFloat?, width: CGFloat?, height: CGFloat?){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            if let topSpacing = topSpacing{
                topAnchor.constraint(equalTo: top, constant: topSpacing).isActive = true
            }
        }
        if let left = left{
            if let leftSpacing = leftSpacing{
                leftAnchor.constraint(equalTo: left, constant: leftSpacing).isActive = true
            }
        }
        if let bottom = bottom{
            if let bottomSpacing = bottomSpacing{
                bottomAnchor.constraint(equalTo: bottom, constant: -bottomSpacing).isActive = true
            }
        }
        if let right = right{
            if let rightSpacing = rightSpacing{
                rightAnchor.constraint(equalTo: right, constant: -rightSpacing).isActive = true
            }
        }
        if let width = width{
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height{
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func anchor(to container: UIView, topSpacing: CGFloat?, leftSpacing: CGFloat?, bottomSpacing: CGFloat?, rightSpacing: CGFloat?, width: CGFloat?, height: CGFloat?){
        anchor(top: container.topAnchor, left: container.leftAnchor, bottom: container.bottomAnchor, right: container.rightAnchor, topSpacing: topSpacing, leftSpacing: leftSpacing, bottomSpacing: bottomSpacing, rightSpacing: rightSpacing, width: width, height: height)
    }
    
    func addAxes(color: UIColor){
        let lineXAxis = UIView()
        let lineYAxis = UIView()
        
        addSubview(lineXAxis)
        addSubview(lineYAxis)
        
        lineXAxis.translatesAutoresizingMaskIntoConstraints = false
        lineYAxis.translatesAutoresizingMaskIntoConstraints = false
        
        lineXAxis.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lineXAxis.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        lineXAxis.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        lineXAxis.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        lineYAxis.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lineYAxis.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        lineYAxis.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        lineYAxis.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        lineXAxis.backgroundColor = color
        lineYAxis.backgroundColor = color
    }
}
