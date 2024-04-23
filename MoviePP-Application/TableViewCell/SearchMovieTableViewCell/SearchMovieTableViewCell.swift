//
//  SearchMovieTableViewCell.swift
//  MoviePP-Application
//
//  Created by Paul on 23/4/2567 BE.
//

import UIKit

class SearchMovieTableViewCell: UITableViewCell {
    
    var setImage: String = "" {
        didSet {
            guard let url = URL(string: setImage) else { return }
            previewMovieView.kf.setImage(with: url)
        }
    }
    
    var setTitle: String = "" {
        didSet {
            titleMovieLabel.text = setTitle
        }
    }
    
    @IBOutlet weak var previewMovieView: UIImageView!
    
    
    @IBOutlet weak var titleMovieLabel: UILabel! {
        didSet {
            titleMovieLabel.textColor = .white
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
