//
//  MovieViewController.swift
//  Alkeflix
//
//  Created by Lucas Di Lorenzo on 15/09/2021.
//

import UIKit


class MovieViewController: UIViewController {

    // MARK: - Atributes
    var movie: Movie?

    private let viewModel = MoviesViewModel()
    
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet var titleMovie: UILabel!
    @IBOutlet var rate: UILabel!
    @IBOutlet var descrip: UILabel!
    @IBOutlet var originaLeng: UILabel!
    @IBOutlet var dateRelease: UILabel!
    
    // MARK: - ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let mov = movie else {return}
        self.configureDetailView(movie: mov)
    }
    
    private func configureDetailView(movie: Movie){
        guard let url = URL(string:"\(viewModel.imageUrlPath)\(movie.poster_path ?? " ")") else {return}
        if let data = try? Data(contentsOf: url) {
            imageMovie.image = UIImage(data: data)}
        titleMovie.text = movie.original_title
        rate.text = "Rate: \(movie.vote_average ?? 0)/10 ⭐️ "
        descrip.text = movie.overview
        let leng = viewModel.getLengString(lengua: movie.original_language ?? " ")
        originaLeng.text = "Original Lenguage: \(leng)"
        dateRelease.text = "Date release: \(movie.release_date ?? " ")"
    }
    
}

