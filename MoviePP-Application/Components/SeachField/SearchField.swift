//
//  SearchField.swift
//  MoviePP-Application
//
//  Created by Paul on 22/4/2567 BE.
//

import UIKit

class SearchField: UIView {
    
    var getText: String {
        get {
            return searchTextField.text ?? ""
        }
    }
    
    @IBOutlet weak var searchTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configView()
    }
    
    private func configView() {
        guard let view = self.loadViewFromNib(nibName: "SearchField") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
}
