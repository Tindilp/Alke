//
//  APIClient.swift
//  Alkeflix
//
//  Created by Lucas Di Lorenzo on 14/09/2021.
//

import Foundation
import Alamofire

let aKey = "c873239f3a6b8b866e24686a02079477"
let baseUrlForTopMovies = "https://api.themoviedb.org/3/movie/"
let baseUrlForGenres = "https://api.themoviedb.org/3/genre/movie/"

class APIClient{
    
    static func getMovies(page:Int, completionHandler: @escaping ([Movie])->Void){
        let request = AF.request("\(baseUrlForTopMovies)popular?api_key=\(aKey)&language=en-US&page=\(page)")
        request.responseData { response in
            switch response.result {
            case .success(let data):
                do {
                let page = try JSONDecoder().decode(MoviePage.self, from: data)
                completionHandler(page.results )
                } catch let error {
                    print("Unable to load data: \(error)")
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }

    static func getGenre(completionHandler: @escaping ([Genre])->Void){
        let request = AF.request("\(baseUrlForGenres)list?api_key=\(aKey)&language=en-US")
        request.responseData { response in
            switch response.result {
            case .success(let data):
                do {
                let page = try JSONDecoder().decode(Genres.self, from: data)
                completionHandler(page.genres)
                //print(page.genres)
                } catch let error {
                    print("Unable to load data: \(error)")
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
