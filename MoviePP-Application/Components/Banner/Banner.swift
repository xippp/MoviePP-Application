//
//  Banner.swift
//  MoviePP-Application
//
//  Created by Paul on 8/4/2567 BE.
//

import Foundation
import UIKit
import Kingfisher
class Banner: UIView {
    
//    MARK: -Setup Property
    
    var setHeaderText: String? {
        didSet {
            headerlabel.text = setHeaderText
        }
    }
    
    var setSubTitleText: String? {
        didSet {
            subTitleLabel.text = setSubTitleText
        }
    }
    
    var setImageBanner: String = "" {
        didSet {
            DispatchQueue.main.async {
                guard let url = URL(string: self.setImageBanner ) else { return }
                self.bannerImageView.kf.setImage(with: url)
            }
        }
    }
    
//    MARK: -IBOutlet Property
    
    @IBOutlet weak var bannerImageView: UIImageView!
    
    @IBOutlet weak var headerlabel: UILabel! {
        didSet {
            headerlabel.textColor = .black
            headerlabel.text = "หนุ่มเย็บผ้ากับสาวนักคอสเพลย์"
        }
    }
    
    
    @IBOutlet weak var subTitleLabel: UILabel! {
        didSet {
            subTitleLabel.textColor = .gray
            subTitleLabel.text = "การ์ตูนยอดฮิต อันดับ 1 ในประเทศไทย"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configView()
    }
    
    private func configView() {
        guard let view = self.loadViewFromNib(nibName: "Banner") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
}
