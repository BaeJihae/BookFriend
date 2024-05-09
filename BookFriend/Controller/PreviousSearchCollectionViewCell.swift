//
//  PreviousSearchCollectionViewCell.swift
//  BookFriend
//
//  Created by 배지해 on 5/9/24.
//

import UIKit

class PreviousSearchCollectionViewCell: UICollectionViewCell {
    
    private let tagLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.pretendard(size: 16, weight: .medium)
        label.backgroundColor = UIColor.mainColor
        label.textColor = UIColor.blackColor
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        return label
    }()
    
    static let identifier = "PreviousSearchCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(tagLabel)
        tagLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func bind(text: String) {
        tagLabel.text = text
    }
}
