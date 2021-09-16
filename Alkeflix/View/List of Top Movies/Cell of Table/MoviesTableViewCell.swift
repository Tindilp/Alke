//
//  MoviesTableViewCell.swift
//  Alkeflix
//
//  Created by Lucas Di Lorenzo on 14/09/2021.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {

    //MARK: - Views
    @IBOutlet var SetNameLabel: UILabel!
    @IBOutlet var SetLengLabel: UILabel!
    
    //MARK: - Configure cell
    func configure (for movie:Movie){
        SetNameLabel.text = movie.original_title
        SetLengLabel.text = "Release date: \(movie.release_date ?? " ")"
    }
}
