//
//  SectionHeaderCollectionView.swift
//  BookFriend
//
//  Created by 배지해 on 5/9/24.
//

import UIKit

class SectionHeaderCollectionView: UICollectionReusableView {
    
    private let sectionLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 18, weight: .bold)
        label.textColor = UIColor.textColor
        return label
    }()
    
    static let elementKind = "SectionHeaderCV"
    static let identifier = "SectionHeaderCV"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(sectionLabel)
        sectionLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(12)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    func bind(sectionTitle: String) {
        sectionLabel.text = sectionTitle
    }
}
