//
//  PaddedLabel.swift
//  BookFriend
//
//  Created by 배지해 on 5/10/24.
//

import UIKit

class PaddedLabel: UILabel {
    // 여백을 설정할 수 있도록 UIEdgeInsets 프로퍼티 추가
    var textInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
    
    // 레이블의 intrinsicContentSize를 오버라이드하여, 여백을 고려한 크기를 반환
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        let width = size.width + textInsets.left + textInsets.right
        let height = size.height + textInsets.top + textInsets.bottom
        return CGSize(width: width, height: height)
    }
    
    // 이 메서드를 오버라이드 하여, 레이아웃 시스템에 레이블의 새로운 크기를 알림
    override func sizeToFit() {
        super.sizeToFit()
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width + textInsets.left + textInsets.right, height: frame.height + textInsets.top + textInsets.bottom)
    }
}
