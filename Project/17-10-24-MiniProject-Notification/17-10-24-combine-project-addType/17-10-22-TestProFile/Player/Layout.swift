////
////  Layout.swift
////  17-10-22-TestProFile
////
////  Created by MIN JUN JU on 2017. 10. 27..
////  Copyright © 2017년 MIN JUN JU. All rights reserved.
////
//
//import UIKit
//
//class Layout: UICollectionViewFlowLayout {
//    
//    var itemSize: CGFloat = 0.5
//
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        
//        guard  let attributes = super.layoutAttributesForElements(in: rect) else {return nil}
//        
//        var layoutAttribute:[UICollectionViewLayoutAttributes] = []
//        
//        for attribute in attributes {
//            //change
//            changeLayoutAttribute(attribute: attribute)
//            //add
//            layoutAttribute.append(attribute)
//            
//        }
//        
//        return layoutAttribute
//        
//        
//    }
//    //레이아웃 정보듣 다시 불러오도록 허락함
//    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
//        
//        return true
//        
//    }
//    
//    func changeLayoutAttribute(attribute:UICollectionViewLayoutAttributes)
//    {
//        //센터 컬렉션 뷰의 반
//        let collectionViewCenter = (self.collectionView?.frame.size.width)! / 2.0
//        //현재 아이템의 offsetX + 센터
//        let offSet = (self.collectionView?.contentOffset.x)! + collectionViewCenter
//        //변경가능한 최대 거리
//        let maxDistance = self.itemSize.width + self.minimumLineSpacing
//        //최대거리 이상은 변경 않함
//        let distance = min(fabs(offSet - attribute.center.x), maxDistance)
//        //비율
//        let ratio = (maxDistance - distance) / maxDistance
//        //비율에 따라 스케일과 투명도 변경
//        let scale = ratio * (1 - self.itemScale) + 1.0
//        let alpha = ratio * (1 - self.itemAlpha) + self.itemAlpha;
//        attribute.alpha = alpha;
//        attribute.transform3D = CATransform3DScale(CATransform3DIdentity, scale,
//                                                   scale, 1);
//        //alpha값에 따른 z 좌표 변경
//        attribute.zIndex = NSInteger(alpha * 10.0)
//    }
//    
//}

