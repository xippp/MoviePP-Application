//
//  NavBar.swift
//  MoviePP-Application
//
//  Created by Paul on 8/4/2567 BE.
//

import Foundation
import UIKit

class NavBar: UIView {
    
//    MARK: -IBOutlet property
    @IBOutlet weak var sideMenuButton: UIButton!
    
//    MARK: -IBAction
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configView()
    }
    
    
    private func configView() {
        guard let view = self.loadViewFromNib(nibName: "NavBar") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
}
