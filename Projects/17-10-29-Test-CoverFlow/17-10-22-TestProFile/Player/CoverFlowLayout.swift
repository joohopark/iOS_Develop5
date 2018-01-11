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
            layoutAttribute.append(item)
        }
        
        return layoutAttribute
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        guard let collectionView = self.collectionView  else { return proposedContentOffset }
        
        //현재 컬렉션 뷰의 [UICollectionViewLayoutAttributes] 가져오기
        guard let attributeList =  self.layoutAttributesForElements(in: collectionView.bounds) else {return proposedContentOffset}
        
        
        
        
        //거리가 가장 가까운 순으로 정렬
        let sortedAttributeList = attributeList.sorted {
            (attribute1, attribute2) -> Bool in
            distance(ofCenter: attribute1.center.x) < distance(ofCenter: attribute2.center.x)
            
        }
        
        //가장 가까은 아이템의 센터 위치
        let xCenterOfMinimumAttributes = sortedAttributeList.first?.center.x
        let screenXCenter = collectionView.frame.size.width / 2
        let targetContentOffset = CGPoint(x:xCenterOfMinimumAttributes! - screenXCenter,y: proposedContentOffset.y)
        
        return targetContentOffset
    }
    


    
    
       
    
    // 위의 함수에서 delegate처럼 dataModele처럼 사용하였음..
    func changeLayoutAttribute(attribute:UICollectionViewLayoutAttributes)
    {
    
        // 187.5 -> 전체 프레임의 반값
//        let collectionViewCenter = (self.collectionView?.frame.size.width)! / 2.0
        
        //offSet은 ContentOffset.x값 + 중앙값을 더함 -> why? 한번 해결해야 하는과제
        // collectionView의 중앙값 + 컨텐츠가 중앙에서 떨어진 x값 만큼 더한값..
//        let offSet = (self.collectionView?.contentOffset.x)! + collectionViewCenter
        
        
        // FlowLayout의 width 사이즈,
        // 변경 가능한 최대거리
        // ContentsView의 witdh 값, + 고정 Spacing 값 -> 아이템간의 거리를 정의 해놓은것 같음.
        
        //변경가능한 최대 거리(조정가능)
        let maxDistance = self.itemSize.width + self.minimumLineSpacing
        
        // 실제 거리과 최대거리중 작은거리를 선택!
        // 중앙으로 갈수록 cell의 ratio가 1.5배가 되고 멀어질수록 작아짐..
        let choiceDistance = min(distance(ofCenter: attribute.center.x), maxDistance)
        
        // 비율 계산
        // maxDistance 와, choiceDistance의 값이 같아지면 0 반환
        // 1을 반환하지는 않지만, 1의 근사치의 값으로 올라간다
        // choiceDistance가 maxDistance의 근사치에 다가가기는 하지만, maxDistance보다 커지지는 않는다.
        
        let ratio = (maxDistance - choiceDistance) / maxDistance
        
        
        
        let scale = ratio * (1 - self.itemScale) + 1.0
        let alpha = ratio * (1 - self.itemAlpha) + self.itemAlpha;
        
        
        //attribute의 모습을 바꾸는 함수
        
        attribute.alpha = alpha;
        attribute.transform3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1);
        attribute.zIndex = NSInteger(alpha * 10.0)
  
    }
    
    // layout의 값이 변할때 새롭게 변한 값을 사용하겠다는 함수이다.
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    func distance(ofCenter centerx:CGFloat) -> CGFloat
    {
        
        guard let collectionView = self.collectionView else {
            return 0
        }
        
        // 현재 아이템의 offsetX + 센터
        // 두값의 차의 최소값은 0이구나..
        let offSet = collectionView.contentOffset.x + (collectionView.bounds.size.width/2)
        return  fabs(offSet - centerx)
    }
    
}




