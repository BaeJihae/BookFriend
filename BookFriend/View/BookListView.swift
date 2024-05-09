//
//  BookListView.swift
//  BookFriend
//
//  Created by 배지해 on 5/10/24.
//

import UIKit

class BookListView: UIView {
    
    private var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return collectionView
    }()
    
    var bookDetailViewAction: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        collectionView.register(BookListCollectionViewCell.self, forCellWithReuseIdentifier: BookListCollectionViewCell.identifier)
        
        setupBackground()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 배경 설정
    private func setupBackground() {
        
        self.backgroundColor = .white
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 130)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        collectionView.collectionViewLayout = layout
        
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
}

extension BookListView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 검색 결과의 수
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookListCollectionViewCell.identifier, for: indexPath) as! BookListCollectionViewCell
        cell.bind(imageView: "edit_square", title: "콩쥐 팥쥐", author: "지은이", description: "안녕하세요 저는 배지해입니다. 안녕하세요 저는 배지해입니다. 안녕하세요 저는 배지해입니다.안녕하세요 저는 배지해입니다. 안녕하세요 저는 배지해입니다. 안녕하세요 저는 배지해입니다.")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        bookDetailViewAction!()
    }
}
