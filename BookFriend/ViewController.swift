//
//  ViewController.swift
//  BookFriend
//
//  Created by 배지해 on 5/7/24.
//

import UIKit

class ViewController: UITabBarController {

    let tabItem = TabItem.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func addVC() {
        let recommandVC = RecommendViewController()
        recommandVC.tabBarItem = UITabBarItem(title: tabItem.recommend.rawValue, image: UIImage(named: "recommend"), tag: 0)
        
        let myBookStoreVC = UIViewController()
        myBookStoreVC.tabBarItem = UITabBarItem(title: tabItem.myBookStore.rawValue, image: UIImage(named: "menu_book"), tag: 1)
        
        let searchVC = UIViewController()
        searchVC.tabBarItem = UITabBarItem(title: tabItem.search.rawValue, image: UIImage(named: "search"), tag: 2)
        
        let bookRecordVC = UIViewController()
        bookRecordVC.tabBarItem = UITabBarItem(title: tabItem.bookRecord.rawValue, image: UIImage(named: "edit_square"), tag: 3)
        
        let settingVC = UIViewController()
        settingVC.tabBarItem = UITabBarItem(title: tabItem.setting.rawValue, image: UIImage(named: "setting"), tag: 4)
        
        self.viewControllers = [recommandVC, myBookStoreVC, searchVC, bookRecordVC, settingVC]
    }

}

