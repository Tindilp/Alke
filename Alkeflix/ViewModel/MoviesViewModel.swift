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
    private var listGenre = [Genre]()
    var genres:[Genre] = []
    var cleanGenreAndId:[Int: String] = [:]
    
    
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
    
    func getStringGenre( gnre:[String])-> String{
        var textGenre = ""
        for g in gnre{
            textGenre += "| \(g) |"
        }
        return textGenre
    }

    func getCleanGenreAndId(){
        APIClient.getGenre (completionHandler:{ genress in
            self.genres.append(contentsOf: genress)
        })
        for g in genres{
            cleanGenreAndId[g.id ?? 0]=g.name
        }
    }
    
    func getListOfNameGenre()-> [String]{
        getCleanGenreAndId()
        var names:[String]=[]
        cleanGenreAndId.map { (key, value) in names.append(value) }
        return names
    }
    
    func getListOfGenres()-> [Int:String]{
        getCleanGenreAndId()
        return cleanGenreAndId
    }
}
