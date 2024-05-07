//
//  SceneDelegate.swift
//  BookFriend
//
//  Created by 배지해 on 5/7/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window?.windowScene = scene
        
        let tabBarVC = CustomTabBarController()
        
        let recommendVC = RecommendViewController()
        let recommentNav = UINavigationController(rootViewController: recommendVC)
        let recommentItem = UITabBarItem(title: TabItem.recommend.rawValue,
                                               image: UIImage(named: "recommend"),
                                               tag: 0)
        recommentItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        recommentItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
        recommentNav.tabBarItem = recommentItem
        
        let myBookStoreVC = MyBookStoreViewController()
        let myBookStoreNav = UINavigationController(rootViewController: myBookStoreVC)
        let myBookStoreItem = UITabBarItem(title: TabItem.myBookStore.rawValue,
                                                 image: UIImage(named: "library_books"),
                                                 tag: 1)
        myBookStoreItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        myBookStoreItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
        myBookStoreNav.tabBarItem = myBookStoreItem
        
        let searchVC = SearchViewController()
        let searchNav = UINavigationController(rootViewController: searchVC)
        let searchItem = UITabBarItem(title: TabItem.search.rawValue,
                                            image: UIImage(named: "search"),
                                            tag: 2)
        searchItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        searchItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
        searchNav.tabBarItem = searchItem
        
        let bookRecordVC = BookRecordViewController()
        let bookRecordNav = UINavigationController(rootViewController: bookRecordVC)
        let bookRecordItem = UITabBarItem(title: TabItem.bookRecord.rawValue,
                                                image: UIImage(named: "edit_square"),
                                                tag: 3)
        bookRecordItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        bookRecordItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
        bookRecordNav.tabBarItem = bookRecordItem
        
        let settingVC = SettingViewController()
        let settingItem = UITabBarItem(title: TabItem.setting.rawValue,
                                            image: UIImage(named: "setting"),
                                            tag: 4)
        settingItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        settingItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
        settingVC.tabBarItem = settingItem
        
        
        tabBarVC.setViewControllers([recommentNav, myBookStoreNav, searchNav, bookRecordNav, settingVC],
                                animated: true)
        
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

