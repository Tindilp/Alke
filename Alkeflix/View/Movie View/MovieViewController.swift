//
//  MovieViewController.swift
//  Alkeflix
//
//  Created by Lucas Di Lorenzo on 15/09/2021.
//

import UIKit
import Kingfisher

class MovieViewController: UIViewController {

    // MARK: - Atributes
    var movie: Movie?

    private let viewModel = MoviesViewModel()
    var strUrl:String = "https://image.tmdb.org/t/p/w500"
    
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet var titleMovie: UILabel!
    @IBOutlet var rate: UILabel!
    @IBOutlet var descrip: UILabel!
    @IBOutlet var originaLeng: UILabel!
    @IBOutlet var dateRelease: UILabel!
    
    // MARK: - ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        imageMovie.image = nil
        imageMovie.kf.cancelDownloadTask()
        guard let mov = movie else {return}
        self.configureDetailView(movie: mov)
    }
    
    private func configureDetailView(movie: Movie){
        let path:String = movie.poster_path ?? ""
        if let imagUrl = URL(string: strUrl+path){
            imageMovie.kf.setImage(with: imagUrl)
        }
        titleMovie.text = movie.original_title
        rate.text = "Rate: \(movie.vote_average ?? 0)/10 ⭐️ "
        descrip.text = movie.overview
        let leng = viewModel.getLengString(lengua: movie.original_language ?? " ")
        originaLeng.text = "Original Lenguage: \(leng)"
        dateRelease.text = "Date release: \(movie.release_date ?? " ")"
    }
    
}

