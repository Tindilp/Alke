//
//  ListGenViewController.swift
//  Alkeflix
//
//  Created by Lucas Di Lorenzo on 20/09/2021.
//

import UIKit

class ListGenViewController: UIViewController {
    
    //MARK: - Atributes
    var gen:String = ""
    var idGen:Int = 0
    var results:[Movie] = []
    var genres:[Genre] = []
    var isLoadin = false
    var page = 1
    
    //MARK: - Views
    @IBOutlet weak var lableGeb: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lableGeb.text = "\(gen) Movies"
        let nib = UINib(nibName: "MovTableViewCell", bundle: .main)
        tableView.register(nib,  forCellReuseIdentifier:"MovTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        loadMovies(page: page)
        loadGenre()
    }
    private func loadGenre(){
        APIClient.getGenre (completionHandler:{ genress in
            self.genres.append(contentsOf: genress)
            self.tableView.reloadData()
        })
    }
    private func loadMovies(page: Int){
            isLoadin = true
            APIClient.getMovies(page:page, completionHandler:{ movies in
                self.results.append(contentsOf: movies)
                self.results = self.results.filter{($0.genre_ids?.contains(self.idGen) ?? false)}
                self.tableView.reloadData()
                self.isLoadin = false
            })
    }
}

//MARK: - UITableViewDataSource
extension ListGenViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovTableViewCell")as! MovTableViewCell
        let movie = results[indexPath.row]
        let generos = obtenerGeneros(generos: movie.genre_ids ?? [])
        cell.configure(for: movie, gnre: generos)
        return cell
       }
    }

//MARK: - UITableViewDelegate
extension ListGenViewController:UITableViewDelegate{
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
    
    func obtenerGeneros(generos:[Int]) -> [String]{
        var test:[String]=[]
        for tipoGeneros in genres {
            for generMovies in generos{
                if (tipoGeneros.id! == generMovies){
                    let nom = tipoGeneros.name!
                    test.append(nom)
                }
            }
            
        }
        return test
    }
}
