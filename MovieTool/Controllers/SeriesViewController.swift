//
//  ViewController.swift
//  MovieTool
//
//  Created by Burak Yavuzalp on 4.05.2021.
//

import UIKit
import SDWebImage

class SeriesViewController: UITableViewController {

    var seriesManager = SeriesManager<SeriesResult>()
    var seriesResult: SeriesResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        seriesManager.delegate = self
        
        seriesManager.getSeries()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seriesResult?.results.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)// as! CustomCell
        
        

        cell.textLabel?.text = seriesResult?.results[indexPath.row].name
        
        var imgPath = "https://www.themoviedb.org/t/p/w440_and_h660_face/\(seriesResult?.results[indexPath.row].backdropPath ?? "")"
        
        cell.imageView?.sd_setImage(with: URL(string: imgPath), placeholderImage: UIImage(systemName: "questionmark"))

        return cell
    }
    
}

extension SeriesViewController: MovieDelegate {
    
    func updateList(seriesResult: SeriesResult) {
        self.seriesResult = seriesResult
        tableView.reloadData()
    }
    
}
