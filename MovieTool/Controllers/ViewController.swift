//
//  ViewController.swift
//  MovieTool
//
//  Created by Burak Yavuzalp on 4.05.2021.
//

import UIKit

class ViewController: UIViewController {

    var seriesManager = SeriesManager()
    var seriesResult: SeriesResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seriesManager.getSeries()
        
        seriesManager.delegate = self
    }
}

extension ViewController: MovieDelegate {
    
    func updateList(seriesResult: SeriesResult) {
        print("updates:::: \(seriesResult.results.count)")
        for a in seriesResult.results {
            print("name: \(a.name)")
        }
    }
    
}
