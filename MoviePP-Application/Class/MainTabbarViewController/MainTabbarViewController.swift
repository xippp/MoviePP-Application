//
//  MainTabbarViewController.swift
//  MoviePP-Application
//
//  Created by Paul on 8/4/2567 BE.
//

import Foundation
import UIKit

class MainTabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        setUpTabbar()
    }
    
    private func setUpTabbar() {
        let homepage = ContainerpageViewController(nibName: "Containerpage", bundle: nil)
        homepage.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        let searchpage = SearchpageViewController(nibName: "Searchpage", bundle: nil)
        searchpage.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        let viewTabbars = [homepage, searchpage]
        self.setViewControllers(viewTabbars, animated: true)
        setUITabbar()
    }
    
    private func setUITabbar() {
        self.tabBar.backgroundColor = .black
        self.tabBar.tintColor = .white
    }
    
}
