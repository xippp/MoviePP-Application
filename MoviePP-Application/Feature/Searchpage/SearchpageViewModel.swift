
//  SearchpageViewModel.swift
//  MoviePP-Application
//
//  Created by Paul on 22/4/2567 BE.
//

import Foundation
import RxSwift
class SearchpageViewModel {
    
    var searchSubject = BehaviorSubject<String>(value:"")
    var resultSubject = PublishSubject<[Movies]>()
    
    func getSearchMovie() {
        searchSubject.subscribe { str in
            let result = Configuration.shared.testData.filter { movies in
                movies.title!.uppercased().contains(str.uppercased())
            }
            self.resultSubject.onNext(result)
        }
        
    }
    
}
