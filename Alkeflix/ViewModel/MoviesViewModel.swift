//
//  MoviesViewModel.swift
//  Alkeflix
//
//  Created by Lucas Di Lorenzo on 16/09/2021.
//

import Foundation
class MoviesViewModel {
    
    private var apiService = APIClient()
    private var popularMovies = [Movie]()
    
    
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let alertName = "Alert!"
    let messageInvalidaEmail = "The email entered is invalid"
    let messageEmptyLabel = "Por favor, ingrese el email de usuario primero"
    let alertActionTitle = "Ok"
    
    let imageUrlPath = "https://image.tmdb.org/t/p/w500"
    
    func getLengString(lengua:String)->String{
        switch lengua{
        case "en": return "English"
        case "es": return "Spanish"
        case "ja": return "Japanese"
        case "ru": return "Rusian"
        case "fr": return "French"
        default: return lengua
        }
    }
    
    
    
    
    
//    func fetchPopularMoviesData(completion: @escaping () -> ()) {
//
//        // weak self - prevent retain cycles
//        apiService.getMovies{ [weak self] (result) in
//
//            switch result {
//            case .success(let listOf):
//                self?.popularMovies = listOf.movies
//                completion()
//            case .failure(let error):
//                // Something is wrong with the JSON file or the model
//                print("Error processing json data: \(error)")
//            }
//        }
//    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if popularMovies.count != 0 {
            return popularMovies.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> Movie {
        return popularMovies[indexPath.row]
    }
}


//manejar el navigation
//tabbar.push
//instanciar el navigation controler desde el main
//navigationcontroler.push (metodo de )
