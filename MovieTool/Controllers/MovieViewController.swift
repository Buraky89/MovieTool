//
//  ViewController.swift
//  MovieTool
//
//  Created by Burak Yavuzalp on 4.05.2021.
//

import UIKit
import SDWebImage

class MovieViewController: UITableViewController {

    var movieManager = MovieManager<MovieResult>()
    var movieResult: MovieResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        movieManager.delegate = self
        
        movieManager.getSeries()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieResult?.results.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)// as! CustomCell
        
        

        cell.textLabel?.text = movieResult?.results[indexPath.row].originalTitle
        
        var imgPath = "https://www.themoviedb.org/t/p/w440_and_h660_face/\(movieResult?.results[indexPath.row].backdropPath ?? "")"
        
        cell.imageView?.sd_setImage(with: URL(string: imgPath), placeholderImage: UIImage(systemName: "questionmark"))

        return cell
    }
    
}

extension MovieViewController: MovieDelegate {
    func updateList<T>(result: T) {
        self.movieResult = result as! MovieResult
        tableView.reloadData()
    }
}
