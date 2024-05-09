//
//  BookHeaderTableViewCell.swift
//  BookFriend
//
//  Created by 배지해 on 5/9/24.
//

import UIKit

class BookHeaderTableViewCell: UITableViewCell {

    private var bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowRadius = 5
        imageView.layer.shadowOpacity = 0.2
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageView.layer.masksToBounds = false
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    private var bookTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.pretendard(size: 18, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    static var identifier = "BookHeaderCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(bookImageView)
        addSubview(bookTitleLabel)
        setupConstrains()
    }
    
    private func setupConstrains() {
        bookImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).offset(15)
            make.width.equalTo(155)
            make.height.equalTo(250)
        }
        
        bookTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(bookImageView.snp.bottom).offset(25)
            make.leading.trailing.equalToSuperview().inset(26)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
    func bind(image: String, title: String){
        bookImageView.image = UIImage(named: image)
        bookTitleLabel.text = title
    }

}
