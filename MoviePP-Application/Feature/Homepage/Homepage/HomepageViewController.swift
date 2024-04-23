//
//  HomepageViewController.swift
//  MoviePP-Application
//
//  Created by Paul on 8/4/2567 BE.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
class HomepageViewController: UIViewController {
    
//    MARK: -IBOut Property
    
   private let viewModel = HomepageViewModel()
    let disposeBag = DisposeBag()
    var mainDisplayMovies: [MainDisplayMoviesModel] = []
    @IBOutlet weak var navBarView: NavBar!
    
    
    @IBOutlet weak var bannerView: Banner!
    
    
    @IBOutlet weak var movieTableView: UITableView! {
        didSet {
            movieTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieTableViewCell")
            movieTableView.delegate = self
            movieTableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.setupObserver()
        self.fetchMovieTread()
        print("Wellcome To HomepageViewController!")
    }
    
//    MARK: -Function UI
    
    private func updateUI(count: Int) {
        print("Count Data is \(count)")
    }
    
    private func setUpBanner(movie: Movies) {
        bannerView.setImageBanner = Configuration.shared.imageServerAddress + (movie.backdropPath ?? "")
        bannerView.setHeaderText = movie.title
        bannerView.setSubTitleText = movie.overview
        viewModel.getTreadingMovies()
    }
    
//    MARK: -ViewModel
    private func fetchMovieTread() {   
        viewModel.callMovieTread()
    }
    
//  MARK: -SetUpObserver
    
    private func setupObserver() {
        
        // Banner
        viewModel.bannerObservable.subscribe(
            onNext: { [weak self] data in
                print("Banner is most popular is \(data.title ?? "")")
                DispatchQueue.main.async {
                    self?.setUpBanner(movie: data) // Do it on main tread
                }
            }).disposed(by: disposeBag)
        
        // MoviesTreading
        viewModel.MainDisplayMoviesObservable.subscribe (onNext: { movies in
            self.mainDisplayMovies = movies
            DispatchQueue.main.async {
                self.movieTableView.reloadData()
            }
            
        }).disposed(by: disposeBag)
    }
    
}


extension HomepageViewController: UITableViewDataSource, UITableViewDelegate {
    // Section
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.mainDisplayMovies.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .black // Set your desired background color
        
        let label = UILabel()
        label.text = self.mainDisplayMovies[section].title
        label.textColor = .white // Set your desired text color
        label.font = UIFont.boldSystemFont(ofSize: 16) // Set your desired font
        label.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(label)
        
        // Add constraints to position the label within the header view
        label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16).isActive = true
        label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16).isActive = true
        label.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8).isActive = true
        label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8).isActive = true
        
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40 // Set your desired height for the section header
    }
    
    // Row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieTableViewCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        cell.mainDisplayMovies = self.mainDisplayMovies
        cell.indexSection = indexPath.section
        cell.movieCollectionView.reloadData()
        return cell
    }
    
    
}
