//
//  ListViewController.swift
//  Alkeflix
//
//  Created by Lucas Di Lorenzo on 14/09/2021.
//

import UIKit

class ListViewController: UIViewController {
    
    //MARK: - Views
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Atributes
    var results:[Movie] = []
    var isLoadin = false
    var page = 1
    
   
    //MARK: - ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "MoviesTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier:"MoviesTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        loadMovies(page: page)
    
    }
        private func loadMovies(page: Int){
            isLoadin = true
            APIClient.getMovies(page:page, completionHandler:{ movies in
                self.results.append(contentsOf: movies)
                self.tableView.reloadData()
                self.isLoadin = false
            })
        }
    }
    


//MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell")as! MoviesTableViewCell
        let movie = results[indexPath.row]
        cell.configure(for: movie)
        return cell
       }
    }

//MARK: - UITableViewDelegate
extension ListViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath:IndexPath){
        if indexPath.row == results.count - 5{
            guard !isLoadin else {
                return
            }
            page+=1
            loadMovies(page: page)

        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath) {
        tableView.deselectRow(at:indexPath, animated: true)
        let selectedeMovie = results[indexPath.row]
        let vc = MovieViewController(nibName: "MovieViewController", bundle: nil)
        vc.movie = selectedeMovie
        self.present(vc, animated: true,completion: nil)
    }
    
}
