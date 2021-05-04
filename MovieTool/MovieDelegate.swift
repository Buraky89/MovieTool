//
//  SeriesDelegate.swift
//  MovieTool
//
//  Created by Burak Yavuzalp on 4.05.2021.
//

import Foundation

protocol MovieDelegate {
    func updateList<T>(seriesResult: T)
}
