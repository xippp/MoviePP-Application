//
//  Network.swift
//  MoviePP-Application
//
//  Created by Paul on 10/4/2567 BE.
//

import Foundation

enum NetworkStatusError: Error {
    case urlError
    case cannotParseData
    case unexpectedError
}

public class Network {
    
    static func getTreadingMovie(completionHandle: @escaping(_ result: Result<MoviesModel, NetworkStatusError>) -> Void) {
        
        let url = Configuration.shared.serverAddress + "trending/all/day?api_key=" + Configuration.shared.apiKey
        
        guard let url = URL(string: url) else {
            completionHandle(.failure(.urlError))
            return
        }
        URLSession.shared.dataTask(with: url) { dataResponse, URLResponse, err in
            if err == nil,
               let data = dataResponse {
                do {
                    let resultData = try JSONDecoder().decode(MoviesModel.self, from: data)
                        completionHandle(.success(resultData))
                } catch {
                    print("Error occurred while decoding JSON data: \(error)")
                    completionHandle(.failure(.cannotParseData))
                }
            } else {
                print("Unexpected nil dataResponse")
                completionHandle(.failure(.unexpectedError))
            }
        }.resume()
    }
    
    static func getPopularMovies(completionHandle: @escaping(_ result: Result<MoviesModel, NetworkStatusError>) -> Void) {
        
        let url = Configuration.shared.serverAddress + "movie/popular?api_key=" + Configuration.shared.apiKey
        
        guard let url = URL(string: url) else {
            completionHandle(.failure(.urlError))
            return
        }
//        NEW
        URLSession.shared.dataTask(with: url) { dataResponse, URLResponse, err in
            if err == nil,
               let data = dataResponse {
                do {
                    let resultData = try JSONDecoder().decode(MoviesModel.self, from: data)
                        completionHandle(.success(resultData))
                } catch {
                    print("Error occurred while decoding JSON data: \(error)")
                    completionHandle(.failure(.cannotParseData))
                }
            } else {
                print("Unexpected nil dataResponse")
                completionHandle(.failure(.unexpectedError))
            }
        }.resume()
        
        
    }

    static func getPopularTvSeries(completionHandle: @escaping(_ result: Result<MoviesModel, NetworkStatusError>) -> Void) {
        
        let url = Configuration.shared.serverAddress + "tv/popular?api_key=" + Configuration.shared.apiKey
        
        guard let url = URL(string: url) else {
            completionHandle(.failure(.urlError))
            return
        }
        URLSession.shared.dataTask(with: url) { dataResponse, URLResponse, err in
            if err == nil,
               let data = dataResponse {
                do {
                    let resultData = try JSONDecoder().decode(MoviesModel.self, from: data)
                        completionHandle(.success(resultData))
                } catch {
                    print("Error occurred while decoding JSON data: \(error)")
                    completionHandle(.failure(.cannotParseData))
                }
            } else {
                print("Unexpected nil dataResponse")
                completionHandle(.failure(.unexpectedError))
            }
        }.resume()
    }
    
}
