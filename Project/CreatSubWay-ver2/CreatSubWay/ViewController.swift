//
//  ViewController.swift
//  CreatSubWay
//
//  Created by MIN JUN JU on 2017. 10. 2..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    
    // 지하철 역버튼 총 13개
    var stationBtns: [UIButton]!
    
    var btn: UIButton!
    
    // 버튼 클릭 횟수
    var clickBtn = 0
    
    // 출발, 도착역 설정
    var startStation = ""
    var arrivalStation = ""
    
    var startStationTag = -1
    var arrivalStationTag = -1
    
    // 스타트 역의 tag 값을 가져온다
    var getStartStionTag = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 스크롤뷰를 만드는 다양한 방법이 있는데, 이분은 이렇게 함.
        let frameSize = view.bounds.size
        scrollView = UIScrollView(frame: CGRect(origin: CGPoint.zero, size: frameSize))
        
        let image = UIImage(named: "deagu.jpeg")
        imageView = UIImageView(image: image)
        scrollView.contentSize = imageView.bounds.size
        
        
        //view 에 뿌려주기
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        
        // zoomscale 설정
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 3
        
        
        
       scrollView.delegate = self
        
        // 더블탭 만들기, 델리게이트 사용
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(self.tapToZoom))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.numberOfTouchesRequired = 1
        
       
        
        /*==========================
                  btn 만들기
                 각 버튼 위치
         버튼 색상, 곡률 지정
         버튼 imageView 에 추가.
         버튼 기능 연결
         역 이름 한글 지정
         tag 값 설정
         ========================*/
        
        //stationBtns = Array(repeatElement(UIButton(), count: Station.stations.count))
        stationBtns = []
        for i in 0..<Station.stations.count {
            stationBtns.append(UIButton())
            stationBtns[i].frame = Station.stations[i].getCGRect()
            stationBtns[i].backgroundColor = UIColor.black
            stationBtns[i].layer.cornerRadius = 10
            imageView.addSubview(stationBtns[i])
            stationBtns[i].addTarget(self, action: #selector(btnAction(_:)) , for: .touchUpInside)
            stationBtns[i].titleLabel?.text = Station.stations[i].name
            stationBtns[i].tag = i
            
            print(stationBtns[i].titleLabel?.text, stationBtns[i].tag)
        }

        // 이 두줄로 해결 -> 이미지뷰 인터렉션 허용
        imageView.isUserInteractionEnabled = true
        
        
        
        scrollView.addGestureRecognizer(doubleTap)
        
        
    
    }
    
    /*=======================
            역 버튼 기능
     ========================*/
    @objc func btnAction(_ sender: UIButton) {
        
        let station = Station.stations[sender.tag]
        
        switch clickBtn {
        case 0:
            
            /*=======================
             출발역 알럿
             ========================*/
            let popAlert: UIAlertController = UIAlertController(title: "출발 역 은", message: "\(station.name) 입니다", preferredStyle: .alert)
            
            /*=======================
             OK 누르면 출발역 설정
             ========================*/
            let okAlertAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: { (alert) in
                
                // 전역 변수에 출발역 설정
                self.startStationTag = sender.tag
                self.clickBtn += 1
                print("출발역은 \(Station.stations[self.startStationTag].name)")
            })
            
            /*=======================
             cancle 버튼 누르면 출발역 재설정
             ========================*/
            let cancelAlertAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .default, handler: { _ in })
            
            /*=======================
             alert 액션 설정
             ========================*/
            popAlert.addAction(okAlertAction)
            popAlert.addAction(cancelAlertAction)
            
            /*=======================
             alert 을 뷰에 뿌려줌
             ========================*/
            
            self.present(popAlert, animated: true, completion: nil)
            
            
            /*=======================
             도착역 설정 구간, 여기가 핵심(출발역 -> 도착역 알고리즘 적용)
             ========================*/
            
        case 1:
            
            print("도착역을 설정 해주세요 ")
            
            /*=======================
             도착역 설정 알럿
             ========================*/
            let popAlert: UIAlertController = UIAlertController(title: "도착 역 은", message: "\(station.name) 입니다", preferredStyle: .alert)
            
            
            /*=======================
             도착역 OK 버튼 누르면 예상 시간 반환
             ========================*/
            let okAlertAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: { (alert) in
                
                // 도착역 전역변수에 지정
                self.arrivalStationTag = sender.tag
                print("출발역은 \(Station.stations[self.startStationTag].name), 도착역은 \(Station.stations[self.arrivalStationTag].name) " )
                
                
                //다익스트라
                
                var calcTable: [(sIndex: Int, timeSum: Int)] = []
                for i in 0..<Station.stations.count {
                    calcTable.append((i,Int.max))
                }
                
                
                
                //startStationTag
                //arrivalStationTag
                
                //var currentTag
                var nextStationTag: Int? = self.startStationTag
                var dicAlreadyCheckStations: [Int] = []
                
            
                calcTable[nextStationTag!].timeSum = 0
                
                while nextStationTag != nil {
                    //다음역
                    let station = Station.stations[nextStationTag!]
                    let currentStationTime = calcTable[nextStationTag!].timeSum
                    //station을 방문했다고 체크
                    dicAlreadyCheckStations.append(nextStationTag!)
                    
                    //비용 작성
                    for stationTime in station.stationTimes {
                        let ssIndex = stationTime.sIndex
                        let calcTimeSum = (currentStationTime + stationTime.time)
                        if( calcTable[ssIndex].timeSum > calcTimeSum ) {
                            calcTable[ssIndex].timeSum = calcTimeSum
                        }
                    }
                    
                    nextStationTag = nil
                    
                    var minTime = Int.max // 시작역과 가장 가까운 역의 걸리는 시간 저장
                    for calcTableItem in calcTable { //모든 역 비교
                        print(dicAlreadyCheckStations)
                        
                        if !dicAlreadyCheckStations.contains(calcTableItem.sIndex) && //방문한적이 없으면서
                            minTime > calcTableItem.timeSum { //시작역과 가장 가까우면(시간)
                            
                            nextStationTag = calcTableItem.sIndex //다음 역으로 지정
                            
                            minTime = calcTableItem.timeSum //시작역과 이 역과의 시간값 저장
                        }
                    }
                  
                 
                }
                
                let popAlert: UIAlertController = UIAlertController(title: "총 \(calcTable[self.arrivalStationTag].timeSum) 분 소요 됩니다", message:"" , preferredStyle: .alert)

                let okAlertAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: { (alert) in

                    // 모두 리셋
                    self.startStationTag = -1
                    self.arrivalStationTag = -1
                    self.clickBtn = 0

                })
                
                
                /*=======================
                 결과 알럿 출력
                 ========================*/
                popAlert.addAction(okAlertAction)
                self.present(popAlert, animated: true, completion: nil)
                
            })
            ///////////////////////위까지 okAlert 범위
            
            // 도착역 재설정
            let cancelAlertAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .default, handler: { _ in })
            
            // 출발역  재설정
            let resetStartStation: UIAlertAction = UIAlertAction(title: "ResetStatstation", style: .default, handler: { (alert) in
                self.clickBtn = 0
                self.startStationTag = -1
            })
            
            
            // 3. 알럿액션을 알럿 컨트롤러에 연결
            popAlert.addAction(okAlertAction)
            popAlert.addAction(cancelAlertAction)
            popAlert.addAction(resetStartStation)
            
            // 4. 알럿 뿌려주기
            
            self.present(popAlert, animated: true, completion: nil)
            
        default: break
        }
        
        
    }
    
    // 더블탭 기능
    @objc func tapToZoom(_ gestureRecognizer: UIGestureRecognizer) {
        
        // 좌표추적
        //print(gestureRecognizer.location(in: scrollView))
        
        
        
        print("줌..")
        
        
        
        // 더블탭 간단 하게 구현
        if scrollView.zoomScale == CGFloat(1) {
            
            
            let locationX = gestureRecognizer.location(in: scrollView).x*2.95-90
            let locationY = gestureRecognizer.location(in: scrollView).y*2.95-300
            
            
            
            
            scrollView.setZoomScale(3, animated: true)
            
            scrollView.setContentOffset(CGPoint(x: locationX, y: locationY), animated: true)
        }else {
            
            let locationX = gestureRecognizer.location(in: scrollView).x/2.95-200
            let locationY = gestureRecognizer.location(in: scrollView).y/2.95-250
            scrollView.setZoomScale(1, animated: true)

            
            scrollView.setContentOffset(CGPoint(x: locationX, y: locationY), animated: true)
        }
        
    }


    
    
    // Pinch Gesture 줌 인, 아웃 가능
    @objc func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        //print("viewFor")
        
        
        return imageView
    }
    
    // 작업을 편하게 하기 위해 offSet 이동
    override func viewDidAppear(_ animated: Bool) {
        scrollView.setContentOffset(CGPoint(x: 390, y:0), animated: true)
    }
    
    

}

// 줌 -> 해당 위치 줌
// 다익스트라 -> 확인

