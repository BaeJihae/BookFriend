//
//  BookDetailViewController.swift
//  BookFriend
//
//  Created by 배지해 on 5/9/24.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    // MARK: - Object
    private let bookDetailTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 40
        return tableView
    }()
    
    private lazy var bookDidButton = buttonConfiguration(title: "읽은 책",
                                                         image: "personal_places")
    
    private lazy var bookIngButton = buttonConfiguration(title: "읽는 중인 책",
                                                         image: "bookmarks")
    
    private lazy var bookWillButton = buttonConfiguration(title: "읽고 싶은 책",
                                                          image: "heart_check")
    
    private lazy var bookButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [bookDidButton, bookIngButton, bookWillButton])
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.backgroundColor = .mainBF
        return stackView
    }()
    
    private let tableSection: [BookDetailSection] = [.bookHeader, .bookDetail]
    
    private var data = [("지은이","배지해"),("출판사","감자를 좋아하는 출판사"),("페이지","1,420p"),("가격","32,000원"),("책소개","안녕하세요 저는 배지해입니다. 어렸을 때 부터 이 책을 매우매우 좋아하였는데요?! 사랑합니다ㅎㅎㅎ ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ")]

    // MARK: - ViewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - ViewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackground()
        setupNavigationBar()
        setupTableView()
        setupStackViewConstrains()
    }
    
    // MARK: - 배경 설정
    private func setupBackground() {
        
        self.view.backgroundColor = .white
    }
    
    // MARK: - 네비게이션바 설정
    private func setupNavigationBar() {
    
        // 네비게이션 타이틀 설정
        self.navigationItem.title = "책 정보"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:
                                                                            UIFont.aggro(size: 20, weight: .medium)]
    }
    
    // MARK: - 테이블뷰 설정
    private func setupTableView() {
        bookDetailTableView.dataSource = self
        bookDetailTableView.delegate = self
        
        bookDetailTableView.register(BookHeaderTableViewCell.self,
                                     forCellReuseIdentifier: BookHeaderTableViewCell.identifier)
        bookDetailTableView.register(BookDetailTableViewCell.self,
                                     forCellReuseIdentifier: BookDetailTableViewCell.identifier)
        
        self.view.addSubview(bookDetailTableView)
        bookDetailTableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
        }
    }
    
    // MARK: - 버튼 스택뷰 설정
    private func setupStackViewConstrains() {
        bookButtonStackView.layer.cornerRadius = 20
        bookButtonStackView.layer.masksToBounds = true
        
        self.view.addSubview(bookButtonStackView)
        bookButtonStackView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
    }
    
    // MARK: - button Configuration
    private func buttonConfiguration(title: String, image: String) -> UIButton{
        
        var configuration = UIButton.Configuration.filled()
        var titleAttributes = AttributeContainer()
        titleAttributes.font = .aggro(size: 16, weight: .medium)
        titleAttributes.foregroundColor = UIColor.black
        configuration.attributedTitle = AttributedString(title,
                                                         attributes: titleAttributes)
        configuration.baseBackgroundColor = .mainBF
        configuration.image = UIImage(named: image)
        configuration.imagePadding = 3
        configuration.imagePlacement = .top
        configuration.image?.withTintColor(.black)
        
        return UIButton(configuration: configuration)
    }
}

// MARK: - TableView
extension BookDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableSection[section] {
        case .bookHeader:
            return 1
        case .bookDetail:
            return data.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableSection[indexPath.section] {
        case .bookHeader:
            let cell = tableView.dequeueReusableCell(withIdentifier: BookHeaderTableViewCell.identifier, for: indexPath) as! BookHeaderTableViewCell
            cell.bind(image: "library_books", title: "어린왕자가 잠을 자고 있었어요. 그러다가 공주님을 만나게 되었습니다~!?")
            return cell
        case .bookDetail:
            let cell = tableView.dequeueReusableCell(withIdentifier: BookDetailTableViewCell.identifier, for: indexPath) as! BookDetailTableViewCell
            cell.bind(index: data[indexPath.row].0, content: data[indexPath.row].1)
            return cell
        }
    }
}
