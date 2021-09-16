//
//  APIClient.swift
//  Alkeflix
//
//  Created by Lucas Di Lorenzo on 14/09/2021.
//

import Foundation
import Alamofire

class APIClient{
    static let baseUrl = "https://api.themoviedb.org/3/movie/"
    static func getMovies(page:Int, completionHandler: @escaping ([Movie])->Void){
        let request = AF.request("\(baseUrl)popular?api_key=c873239f3a6b8b866e24686a02079477&language=en-US&page=\(page)")
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
}
