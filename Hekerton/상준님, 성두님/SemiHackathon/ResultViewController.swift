//
//  ResultViewController.swift
//  SemiHackathon
//
//  Created by Sangjun Lee on 02/11/2017.
//  Copyright © 2017 esung. All rights reserved.
//

import UIKit

protocol ResultViewControllerDelegate{
    func dismissCalled()
}

class ResultViewController: UIViewController {
    
    var delegate: ResultViewControllerDelegate?
    
    let coordinatesView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    let coordinatesTypeLabels: [UILabel] = {
        let labelTexts = ["D", "I", "S", "C"]
        var labels: [UILabel] = []
        for i in 0..<labelTexts.count{
            let label = UILabel()
            label.text = labelTexts[i]
            labels.append(label)
            label.textAlignment = .center
        }
        return labels
    }()
    
    let guessLabel: UILabel = {
       let label = UILabel()
        label.text = "나의 예상은? "
        label.backgroundColor = .white
        return label
    }()
    let textView: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .white
        tv.layer.borderColor = UIColor.black.cgColor
        tv.layer.borderWidth = 2
        tv.isEditable = false
        return tv
    }()
    
    let returnToMainScreenButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("처음으로 가기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.layer.backgroundColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        var coordinates = Coordinates()
        
        if let userResult = User.main.personalityType{
            if let result = DataHandler.results.getResultData(of: userResult){
                textView.text = result.title + "\n" + result.content
            }else{
                textView.text = "애매모호합니다."
            }
        }
        
        coordinates.addPoint(point: User.main.point)
        print(User.main.point)
        coordinatesView.draw(coordinates: coordinates)
    }
    
    func setupViews(){
        view.backgroundColor = .white
        
        view.addSubview(coordinatesView)
        
        //좌표 화면 그리기
        coordinatesView.anchor(to: view, topSpacing: 50, leftSpacing: 50, bottomSpacing: nil, rightSpacing: 50, width: nil, height: 200)
        coordinatesView.addAxes(color: .black)
        coordinatesView.layoutIfNeeded()
        addCoordinatesLabels(to: coordinatesView)
        //나의 예상 레이블 설정
        view.addSubview(guessLabel)
        guessLabel.anchor(top: coordinatesView.bottomAnchor, left: coordinatesView.leftAnchor, bottom: nil, right: coordinatesView.rightAnchor, topSpacing: 20, leftSpacing: 0, bottomSpacing: nil, rightSpacing: 0, width: nil, height: 30)
        
        //타입 설명 텍스트뷰 설정
        view.addSubview(textView)
        textView.anchor(top: guessLabel.bottomAnchor, left: coordinatesView.leftAnchor, bottom: nil, right: coordinatesView.rightAnchor, topSpacing: 20, leftSpacing: 0, bottomSpacing: nil, rightSpacing: 0, width: nil, height: nil)
        
        //하단 버튼 추가
        
        view.addSubview(returnToMainScreenButton)
        returnToMainScreenButton.anchor(top: textView.bottomAnchor, left: coordinatesView.leftAnchor, bottom: view.bottomAnchor, right: coordinatesView.rightAnchor, topSpacing: 20, leftSpacing: 0, bottomSpacing: 30, rightSpacing: 0, width: nil, height: 50)
        textView.textContainerInset = UIEdgeInsetsMake(30, 0, 0, 0)
        
        //버튼 액션 연결
        returnToMainScreenButton.addTarget(self, action: #selector(returnToMainScreen), for: .touchUpInside)

    }
    
    func addCoordinatesLabels(to container: UIView){
        let labelWidth = container.frame.width / 2
        let labelHeight = container.frame.height / 2
        let firstQuadrant = CGPoint(x: labelWidth + 1, y: 0)
        let secondQuadrant = CGPoint(x: 0, y: 0)
        let thirdQuadrant = CGPoint(x: 0, y: labelHeight + 1)
        let fourthQuadrant = CGPoint(x: labelWidth + 1, y: labelHeight + 1)
        
        let quadrants: [CGPoint] = [secondQuadrant, firstQuadrant, fourthQuadrant, thirdQuadrant]
        
        for i in 0..<coordinatesTypeLabels.count{
            coordinatesTypeLabels[i].frame = CGRect(origin: quadrants[i], size: CGSize(width: labelWidth, height: labelHeight))
            container.addSubview(coordinatesTypeLabels[i])
        }
    }
    
    @objc func returnToMainScreen(){
        dismiss(animated: false) {
            self.delegate?.dismissCalled()
        }
    }

}


