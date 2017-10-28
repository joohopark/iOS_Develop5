//
//  CoverFlowLayout.swift
//  MusicPlayer
//
//  Created by youngmin joo on 2017. 7. 3..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//


import UIKit

class CoverFlowLayout : UICollectionViewFlowLayout {
    
    
    // 아이템의 Scale과 Alpha값을 정의 해줌.
    let itemScale:CGFloat = 0.5
    let itemAlpha:CGFloat = 0.5
    
    override func awakeFromNib() {
        self.minimumLineSpacing = 25.0
        
    }
    
    //1. 시작전 할일
    override func prepare() {
        
    }
    
    
    

    // layoutAtrributesforelements각각 들을 가져온다
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        guard  let attributes = super.layoutAttributesForElements(in: rect) else {return nil}
        
        // 변경할 내용을 담아놓을 temp 같은 저장소?
        var layoutAttribute:[UICollectionViewLayoutAttributes] = []
        for item in attributes {
            
            changeLayoutAttribute(attribute: item)
            
            print(item)
            print(item.accessibilityElementCount())
            
            layoutAttribute.append(item)
        }
        
        return layoutAttribute
    }
    
    
       
    
    // 위의 함수에서 delegate처럼 dataModele처럼 사용하였음..
    func changeLayoutAttribute(attribute:UICollectionViewLayoutAttributes)
    {
    
        // 187.5 -> 전체 프레임의 반값
        let collectionViewCenter = (self.collectionView?.frame.size.width)! / 2.0
        
        //offSet은 ContentOffset.x값 + 중앙값을 더함 -> why? 한번 해결해야 하는과제
        let offSet = (self.collectionView?.contentOffset.x)! + collectionViewCenter
        
        // FlowLayout의 width 사이즈,
        // 변경 가능한 최대거리
        let maxDistance = self.itemSize.width + self.minimumLineSpacing
        
        // 변경 가능한 최대거리 산출
        let distance = min(fabs(offSet - attribute.center.x), maxDistance)
        
        
        // 여기까지 테스트 완료, 그 이후에 어떻게 되는지 한번 다시 작성해서 확인해보자.
        print(distance, offSet, attribute.center.x, maxDistance)
        

        
        
        
    }
    
    
    
//    스크롤을 멈췄을때 실행
//    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
//
//
//
//        return
//    }
//
//    //레이아웃 정보듣 다시 불러오도록 허락함
//    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
//        return true
//    }

    
    
    
}




