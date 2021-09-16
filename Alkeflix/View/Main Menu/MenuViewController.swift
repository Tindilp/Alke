//
//  MenuViewController.swift
//  Alkeflix
//
//  Created by Lucas Di Lorenzo on 15/09/2021.
//

import UIKit

class MenuViewController: UIViewController {

    @IBAction func topMovies(_ sender: Any) {
        let vc =  ListViewController(nibName: "ListViewController", bundle: nil)
        self.present(vc, animated: true,completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let nib = UINib(nibName: "MenuTableViewCell", bundle: .main)
        //register(nib, forCellReuseIdentifier:"MenuTableViewCell")

        // Do any additional setup after loading the view.
    }

}
