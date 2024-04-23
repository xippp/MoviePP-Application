//
//  MovieTableViewCell.swift
//  MoviePP-Application
//
//  Created by Paul on 8/4/2567 BE.
//

import UIKit

class MovieTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var mainDisplayMovies: [MainDisplayMoviesModel] = []
    var indexSection: Int = 0
    @IBOutlet weak var movieCollectionView: UICollectionView! {
        didSet {
            movieCollectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "movieCollectionCell")
            movieCollectionView.delegate = self
            movieCollectionView.dataSource = self
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.mainDisplayMovies[section].movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCollectionCell", for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }
        cell.setImageMovie = self.mainDisplayMovies[indexSection].movies[indexPath.row].posterPath
        return cell
    }
    
}
