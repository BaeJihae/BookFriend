//
//  BookListCollectionViewCell.swift
//  BookFriend
//
//  Created by 배지해 on 5/10/24.
//

import UIKit

class BookListCollectionViewCell: UICollectionViewCell {
    
    private var bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = .lightGrayBF
        return imageView
    }()
    
    private var bookTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.pretendard(size: 16, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private var bookAuthorLabel: PaddedLabel = {
        let label = PaddedLabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont.pretendard(size: 12, weight: .medium)
        label.backgroundColor = .lightGrayBF
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.textInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        return label
    }()
    
    private var bookDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.pretendard(size: 13, weight: .regular)
        return label
    }()
    
    static let identifier = "bookListCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(bookImageView)
        addSubview(bookTitleLabel)
        addSubview(bookAuthorLabel)
        addSubview(bookDescriptionLabel)
        setupConstrains()
    }
    
    private func setupConstrains() {
        bookImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview().inset(7)
            make.height.equalTo(130)
            make.width.equalTo(95)
        }
        
        bookTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(bookImageView.snp.trailing).offset(10)
            make.top.equalToSuperview().inset(7)
            make.trailing.equalToSuperview().inset(20)
        }
        
        bookAuthorLabel.snp.makeConstraints { make in
            make.leading.equalTo(bookImageView.snp.trailing).offset(10)
            make.top.equalTo(bookTitleLabel.snp.bottom).offset(7)
        }
        
        bookDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(bookAuthorLabel.snp.bottom).offset(7)
            make.leading.equalTo(bookImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(bookImageView.snp.bottom)
        }
    }
    
    func bind(imageView: String, title: String, author: String, description: String) {
        bookImageView.image = UIImage(named: imageView)
        bookTitleLabel.text = title
        bookAuthorLabel.text = author
        bookDescriptionLabel.text = description
    }
    
}
