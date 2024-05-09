//
//  PreviousBookRecordCollectionViewCell.swift
//  BookFriend
//
//  Created by 배지해 on 5/9/24.
//

import UIKit
import SnapKit

class PreviousBookRecordCollectionViewCell: UICollectionViewCell {
    
    private var imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.textColor
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    static let identifier = "PreviousBookRecord"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        self.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func bind(text: String) {
        imageView.image = UIImage(named: text)
    }
}
