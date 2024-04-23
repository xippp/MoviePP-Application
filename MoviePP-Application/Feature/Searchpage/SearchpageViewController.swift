//
//  SearchpageViewController.swift
//  MoviePP-Application
//
//  Created by Paul on 8/4/2567 BE.
//

import UIKit
import RxSwift
import RxCocoa
class SearchpageViewController: UIViewController {
    
    private let viewModel = SearchpageViewModel()
    private var moviesResult: [Movies] = []
    var bag = DisposeBag()
    @IBOutlet weak var searchFieldView: SearchField!
    
    @IBOutlet weak var searchTableView: UITableView! {
        didSet {
            searchTableView.delegate = self
            searchTableView.dataSource = self
            searchTableView.register(UINib(nibName: "SearchMovieTableViewCell", bundle: nil), forCellReuseIdentifier: "searchMovieCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Wellcome To SearchpageViewController!")
        setupTapGesture()
        setupObservable()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
//    MARK: -Setup Observable
    
    private func setupObservable() {
        searchFieldView.searchTextField.rx.text.orEmpty.bind(to: viewModel.searchSubject).disposed(by: bag)
            
        
        viewModel.resultSubject.asObservable().subscribe { movies in
            print(movies)
            self.moviesResult = movies
            self.searchTableView.reloadData()
        }.disposed(by: bag)
        
        viewModel.getSearchMovie()

    }
    
//    MARK: -Setup TapGesture
    
    private func setupTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.view.endEditing(true)
    }
    
}

extension SearchpageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.moviesResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchMovieCell", for: indexPath) as? SearchMovieTableViewCell else { return UITableViewCell() }
        cell.setImage = Configuration.shared.imageServerAddress + self.moviesResult[indexPath.row].posterPath
        cell.setTitle = self.moviesResult[indexPath.row].title ?? ""
        return cell
    }
    
    
}
