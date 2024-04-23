//
//  HomepageViewModel.swift
//  MoviePP-Application
//
//  Created by Paul on 10/4/2567 BE.
//

import Foundation
import RxSwift
import RxCocoa
class HomepageViewModel {
//    MARK: -Subject
    private var bannerSubject = PublishSubject<Movies>()
    private var MainDisplayMoviesSubject = PublishSubject<[MainDisplayMoviesModel]>()
//    MARK: -Observable
    var bannerObservable: Observable<Movies> {
            return bannerSubject.asObservable()
        }
    
    var MainDisplayMoviesObservable: Observable<[MainDisplayMoviesModel]> {
        return MainDisplayMoviesSubject.asObservable()
    }
//    MARK: -Property Varribles
    var treadMovies: [Movies]?
    
    var mainDisplayMoviesModel: [MainDisplayMoviesModel] = []
    
    func callMovieTread() {
        Network.getTreadingMovie { result in
            switch result {
            case .success(let data):
                self.treadMovies = data.movies
                self.mainDisplayMoviesModel.append(MainDisplayMoviesModel(title: "Treading Movies", movies: data.movies))
                self.getTreadMovieBanner()
            case .failure(let failure):
                switch failure {
                case .urlError:
                    print("URL is Error")
                case .cannotParseData:
                    print("Cannot Parse Json To Data")
                case .unexpectedError:
                    print("Response Not Responsing")
                }
            }
        }
    }
    
    func callMoviePopuplar() {
        Network.getPopularMovies { result in
            switch result {
            case .success(let data):
                self.mainDisplayMoviesModel.append(MainDisplayMoviesModel(title: "Popular Movies", movies: data.movies))
                self.callTvSeriesPopular()
            case .failure(let failure):
                switch failure {
                case .urlError:
                    print("URL is Error")
                case .cannotParseData:
                    print("Cannot Parse Json To Data")
                case .unexpectedError:
                    print("Response Not Responsing")
                }
            }
        }
    }
    
    func callTvSeriesPopular() {
        Network.getPopularTvSeries { result in
            switch result {
            case .success(let data):
                self.mainDisplayMoviesModel.append(MainDisplayMoviesModel(title: "Popular TVSeries", movies: data.movies))
                Configuration.shared.testData = self.mainDisplayMoviesModel[1].movies
                self.MainDisplayMoviesSubject.onNext(self.mainDisplayMoviesModel)
            case .failure(let failure):
                switch failure {
                case .urlError:
                    print("URL is Error")
                case .cannotParseData:
                    print("Cannot Parse Json To Data")
                case .unexpectedError:
                    print("Response Not Responsing")
                }
            }
        }
    }
    
    func getTreadMovieBanner() {
        guard let treadMovies = treadMovies else { return }
        let popularMovie = treadMovies.max(by: { $0.popularity < $1.popularity})
        bannerSubject.onNext(popularMovie!)
    }
    
    func getTreadingMovies() {
        guard let treadMovies = treadMovies else { return }
        callMoviePopuplar()
    }
    
}
