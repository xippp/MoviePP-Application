//
//  Network.swift
//  MoviePP-Application
//
//  Created by Paul on 10/4/2567 BE.
//

import Foundation

class Configuration {
    
    static let shared = Configuration()
    
    var apiKey = "7a19cc61c1165bea3165535e7249635b"
    
    var serverAddress = "https://api.themoviedb.org/3/"
    
    var imageServerAddress = "https://image.tmdb.org/t/p/w500/"
    
    var testData: [Movies] = []
}
