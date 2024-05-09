//
//  BookDetailTableViewCell.swift
//  BookFriend
//
//  Created by 배지해 on 5/9/24.
//

import UIKit

class BookDetailTableViewCell: UITableViewCell {

    private var indexLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.pretendard(size: 16, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = UIColor.textColor
        return label
    }()
    
    private var contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.pretendard(size: 16, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = UIColor.textColor
        return label
    }()
    
    static var identifier = "BookDetailCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(indexLabel)
        addSubview(contentLabel)
        setupConstrains()
    }
    
    private func setupConstrains() {
        indexLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(26)
            make.width.equalTo(50)
            make.top.bottom.equalToSuperview().inset(10)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(26)
            make.leading.equalTo(indexLabel.snp.trailing).offset(10)
            make.top.bottom.equalToSuperview().inset(10)
        }
    }
    
    func bind(index: String, content: String){
        indexLabel.text = index
        contentLabel.text = content
    }

}
