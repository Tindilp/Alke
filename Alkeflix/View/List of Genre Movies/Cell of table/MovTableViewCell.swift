//
//  MovTableViewCell.swift
//  Alkeflix
//
//  Created by Lucas Di Lorenzo on 20/09/2021.
//

import UIKit

class MovTableViewCell: UITableViewCell {
    
    private let viewModel = MoviesViewModel()

    //MARK: - Views
    @IBOutlet weak var nameMov: UILabel!
    @IBOutlet weak var rateMov: UILabel!


    //MARK: - Configure cell
    func configure (for movie:Movie, gnre:[String]){
        nameMov.text = movie.original_title
        rateMov.text =  "Rate: \(movie.vote_average ?? 0)/10 ⭐️ "
    }
    
}
