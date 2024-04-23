//
//  ContainerpageViewController.swift
//  MoviePP-Application
//
//  Created by Paul on 8/4/2567 BE.
//

import Foundation
import UIKit

class ContainerpageViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        print("Wellcome To ContainerpageViewController!")
    }
    
    private func setupView() {
        let homepage = HomepageViewController(nibName: "Homepage", bundle: nil)
        addChild(homepage)
        self.view.addSubview(homepage.view)
        homepage.didMove(toParent: self)
    }
}
