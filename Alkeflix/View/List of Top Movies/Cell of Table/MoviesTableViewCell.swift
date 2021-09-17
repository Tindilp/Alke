//
//  MoviesTableViewCell.swift
//  Alkeflix
//
//  Created by Lucas Di Lorenzo on 14/09/2021.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    private let viewModel = MoviesViewModel()

    //MARK: - Views
    @IBOutlet var SetNameLabel: UILabel!
    @IBOutlet var SetLengLabel: UILabel!
    
    //MARK: - Configure cell
    func configure (for movie:Movie, gnre:[String]){
        SetNameLabel.text = movie.original_title
        let g = viewModel.getStringGenre(gnre: gnre)
        SetLengLabel.text = g
    }
    

}
