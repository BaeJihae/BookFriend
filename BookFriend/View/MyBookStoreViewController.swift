//
//  MyBookStoreViewController.swift
//  BookFriend
//
//  Created by 배지해 on 5/7/24.
//

import UIKit

class MyBookStoreViewController: UIViewController {
    
    func button(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.blackBF, for: .normal)
        button.titleLabel?.font = .aggro(size: 16, weight: .light)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.backgroundColor = .clear
        return button
    }
    
    private lazy var bookDidButton: UIButton = button(title: "읽은 책")
    private lazy var bookIngButton: UIButton = button(title: "읽는 중인 책")
    private lazy var bookWillButton: UIButton = button(title: "읽고 싶은 책")
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [bookDidButton, bookIngButton, bookWillButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        return stackView
    }()

    private let bookListView = BookListView()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackground()
        setupNavigationBar()
        setupStackView()
        setupBookListView()
        
        bookDidButton.addTarget(self, action: #selector(bookButtonClicked(_:)),
                                for: .touchUpInside)
        bookIngButton.addTarget(self, action: #selector(bookButtonClicked(_:)), 
                                for: .touchUpInside)
        bookWillButton.addTarget(self, action: #selector(bookButtonClicked(_:)), 
                                 for: .touchUpInside)
        
        bookListView.bookDetailViewAction = {
            let bookDetailVC = BookDetailViewController()
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            self.navigationController?.pushViewController(bookDetailVC, animated: true)
        }
    }
    
    @objc private func bookButtonClicked(_ sender: UIButton) {
        
        [bookDidButton, bookIngButton, bookWillButton].forEach { button in
            button.backgroundColor = .clear
        }
        
        sender.backgroundColor = .lightGrayBF
    }
    
    // MARK: - 배경 설정
    private func setupBackground() {
        
        self.view.backgroundColor = .white
    }
    
    // MARK: - 네비게이션바 설정
    private func setupNavigationBar() {
        
        // 네비게이션 타이틀 설정
        self.navigationItem.title = "서재"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.aggro(size: 20, weight: .medium)]
    }
    
    private func setupStackView() {
        self.view.addSubview(buttonStackView)
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(35)
        }
    }
    
    private func setupBookListView() {
        self.view.addSubview(bookListView)
        bookListView.snp.makeConstraints { make in
            make.top.equalTo(buttonStackView.snp.bottom).offset(5)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
}

#Preview {
    MyBookStoreViewController()
}
