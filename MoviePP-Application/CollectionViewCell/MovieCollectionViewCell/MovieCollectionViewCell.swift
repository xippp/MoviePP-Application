//
//  MovieCollectionViewCell.swift
//  MoviePP-Application
//
//  Created by Paul on 8/4/2567 BE.
//

import UIKit
import Kingfisher
class MovieCollectionViewCell: UICollectionViewCell {
    
    var setImageMovie: String? {
        didSet {
            guard let url = URL(string:Configuration.shared.imageServerAddress + (setImageMovie ?? "")) else { return }
            movieImageView.kf.setImage(with: url)
        }
    }
    
    @IBOutlet weak var containerImageView: UIView! {
        didSet {
            containerImageView.layer.cornerRadius = 10
            containerImageView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
