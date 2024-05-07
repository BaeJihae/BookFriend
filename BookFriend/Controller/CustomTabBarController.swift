//
//  CustomTabBarController.swift
//  BookFriend
//
//  Created by 배지해 on 5/7/24.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupTabBarFrame()
        configureTabBarAppearance()
    }
    
    func setupTabBarFrame() {
        var tabFrame = tabBar.frame
        tabFrame.size.height = 100
        tabFrame.origin.y = self.view.frame.size.height - 100
        tabBar.frame = tabFrame
        
        tabBar.layer.cornerRadius = 20
        tabBar.layer.masksToBounds = true
    }
    
    func configureTabBarAppearance() {
        
        let appearance = UITabBarAppearance()
        
        // 배경색 설정
        appearance.backgroundColor = UIColor(named: "mainBFColor")
        
        // 글꼴 설정을 위한 속성 정의
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.aggro(size: 14, weight: .medium),
            .foregroundColor: UIColor(named: "blackBFColor")!
        ]
        
        // 외형에 글꼴 속성 적용
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(named: "blackBFColor")
        
        // 탭 바에 외형 적용
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
    }
}
