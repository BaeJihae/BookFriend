//
//  BookRecordViewController.swift
//  BookFriend
//
//  Created by 배지해 on 5/7/24.
//

import UIKit

class BookRecordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupNavigationBar()
    }
    
    // MARK: - 배경 설정
    private func setupBackground() {
        
        self.view.backgroundColor = .white
    }
    
    // MARK: - 네비게이션바 설정
    private func setupNavigationBar() {
        
        // 네비게이션 타이틀 설정
        self.navigationItem.title = "기록"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:
                                                                            UIFont.aggro(size: 20, weight: .medium)]
    }

}
