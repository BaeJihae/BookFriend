//
//  SearchViewController.swift
//  BookFriend
//
//  Created by 배지해 on 5/7/24.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    private lazy var searchCollectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return collectionView
    }()
    
    private var dataSource: [SearchSection] = [
        SearchSection.previousSearch(["태그1", "태그2", "태그3ㄹㄹ", "태그1ㅈ34ㄷ", "ㅎ", "안ㄴ여항서ㅐㅁㄴ욜ㄷ ㅣ" , "매우 긴 태그가 여기에"]),
        SearchSection.previousBookRecord([ "menu_book", "menu_book", "menu_book", "menu_book"])
    ]
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        self.searchCollectionView.dataSource = self
        self.searchCollectionView.delegate = self
        searchCollectionView.register(SectionHeaderCollectionView.self,
                                      forSupplementaryViewOfKind: SectionHeaderCollectionView.elementKind,
                                      withReuseIdentifier: SectionHeaderCollectionView.identifier)
        searchCollectionView.register(PreviousSearchCollectionViewCell.self,
                                      forCellWithReuseIdentifier: PreviousSearchCollectionViewCell.identifier)
        searchCollectionView.register(PreviousBookRecordCollectionViewCell.self,
                                      forCellWithReuseIdentifier: PreviousBookRecordCollectionViewCell.identifier)
        
        setupBackground()
        setupNavigationBar()
        setupCollectionView()
    }
    
    // MARK: - 배경 설정
    private func setupBackground() {
        
        self.view.backgroundColor = .white
    }
    
    // MARK: - 네비게이션바 설정
    private func setupNavigationBar() {
        
        // 네비게이션 타이틀 설정
        self.navigationItem.title = "책 검색"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:
                                                                            UIFont.aggro(size: 20, weight: .medium)]
        
        // 바코드 버튼 설정
        let rightButton = UIBarButtonItem(image: UIImage(named: "barcode_scanner"), 
                                          style: .plain,
                                          target: self,
                                          action: #selector(barcodeButton(_:)))
        rightButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = rightButton
        
        // searchBar 설정
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "검색어를 입력해주세요."
        searchController.hidesNavigationBarDuringPresentation = false
        self.navigationItem.searchController = searchController
    }
    
    @objc func barcodeButton(_ sender: UIBarButtonItem) {
        
        let barcodeVC = BarcodeViewController()
        self.navigationController?.pushViewController(barcodeVC, animated: true)
    }
    
    // MARK: - CollectionView 설정
    private func setupCollectionView() {
        
        view.addSubview(searchCollectionView)
        searchCollectionView.collectionViewLayout = makeFlowLayout()
        searchCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.bottom.equalToSuperview().inset(16)
        }
    }
    
    private func makeHeaderView() -> NSCollectionLayoutBoundarySupplementaryItem {
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .estimated(50))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: SectionHeaderCollectionView.elementKind,
                                                                 alignment: .top)
        return header
    }
}

// MARK: - SearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
    // 유저가 텍스트 입력했을 때
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filterItems(with: searchText)
    }
    
    // 유저가 취소버튼을 클릭했을 때
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.text = nil
        filterItems(with: "")
        searchBar.resignFirstResponder() // 키보드 내림
    }
    
    // searchText
    private func filterItems(with searchText: String) {
        
        if searchText.isEmpty {
            print("검색하려는 메세지가 없습니다.")
        }else {
            print("\(searchText)를 검색합니다.")
        }
    }
    
}

// MARK: - CollectionViewCompositionalLayout
extension SearchViewController {
    private func makeFlowLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, environment -> NSCollectionLayoutSection? in
            let sectionType = self.dataSource[sectionIndex]
            switch sectionType {
            case .previousSearch(let data):
                return self.makeSearchWordSectionLayout(data: data)
            case .previousBookRecord(let data):
                return self.makeBookRecordSectionLayout(data: data)
            }
        }
    }
    
    private func makeSearchWordSectionLayout(data: [String]) -> NSCollectionLayoutSection {
    
        var items: [NSCollectionLayoutItem] = []
        var totalWidth = 0.0
        
        for text in data {
            let width = text.size(withAttributes: [NSAttributedString.Key.font: UIFont.pretendard(size: 16, weight: .medium)]).width + 40
            totalWidth += width
            let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(width), heightDimension: .absolute(32))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
            items.append(item)
        }
        
        // 그룹 설정
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(CGFloat(totalWidth)),
                                               heightDimension: .fractionalWidth(0.1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: items)
        
        // 섹션 설정
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 15, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous
        
        // 헤더 설정
        let header = makeHeaderView()
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    private func makeBookRecordSectionLayout(data: [String]) -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), 
                                              heightDimension: .fractionalWidth(1/2))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3)
        
        // 그룹 설정: 3개의 아이템을 한 줄에 배열
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), 
                                               heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 3)
        
        // 섹션 설정
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0)
        
        // 헤더 설정
        let header = makeHeaderView()
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Section 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return dataSource.count
    }
    
    // MARK: - CollectionView의 Section에 따른 아이템 갯수 설정
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        switch dataSource[section] {
        case .previousBookRecord(let data):
            return data.count > 10 ? 10 : data.count
        case .previousSearch(let data):
            return data.count > 10 ? 10 : data.count
        }
    }
    
    // MARK: - CollectionView의 Section에 따른 cell 설정
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch dataSource[indexPath.section] {
        case .previousSearch(let data):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviousSearchCollectionViewCell.identifier,
                                                          for: indexPath) as! PreviousSearchCollectionViewCell
            cell.bind(text: data[indexPath.row])
            return cell
        case .previousBookRecord(let data):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviousBookRecordCollectionViewCell.identifier,
                                                          for: indexPath) as! PreviousBookRecordCollectionViewCell
            cell.bind(text: data[indexPath.row])
            return cell
        }
    }
    
    // MARK: - header설정
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case SectionHeaderCollectionView.elementKind:
            let header = searchCollectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: SectionHeaderCollectionView.identifier,
                                                                               for: indexPath) as! SectionHeaderCollectionView
            switch dataSource[indexPath.section] {
            case .previousBookRecord:
                header.bind(sectionTitle: "최근 본 책")
            case .previousSearch:
                header.bind(sectionTitle: "최근 검색어")
            }
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
    // MARK: - CollectionCell 눌렀을 때 동작
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch dataSource[indexPath.section] {
        case .previousSearch(let data):
            print("\(data[indexPath.row])가 선택됨.")
        case .previousBookRecord(let data):
            let bookDetailVC = BookDetailViewController()
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            navigationController?.pushViewController(bookDetailVC, animated: true)
        }
    }
}
