//
//  Coordinates.swift
//  SemiHackathon
//
//  Created by Sangjun Lee on 02/11/2017.
//  Copyright © 2017 esung. All rights reserved.
//

import UIKit

struct Coordinates{
    private var points: [Point] = []
    mutating func addPoint(point: Point){
        points.append(point)
    }
    var getPoints: [Point]{
        return points
    }
}

struct Point{
    var x: CGFloat
    var y: CGFloat
}

extension UIView{
    func draw(coordinates: Coordinates){
        for point in coordinates.getPoints{
            drawPoint(point: point)
        }
    }
    private func drawPoint(point: Point){
        let originPoint = Point(x: bounds.width / 2.0, y: bounds.height / 2.0)
        let pointSize: CGFloat = 5
        let pointView = UIView(frame: CGRect(x: originPoint.x + (point.x * 2) - (pointSize / 2), y: originPoint.y - (point.y * 2) - (pointSize / 2), width: pointSize, height: pointSize))
        pointView.backgroundColor = .red
        addSubview(pointView)
    }
}
