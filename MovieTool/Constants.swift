//
//  Constants.swift
//  MovieTool
//
//  Created by Burak Yavuzalp on 4.05.2021.
//

import Foundation

struct K {
    static let SeriesUrl = "https://api.themoviedb.org/3/discover/tv?api_key={apiKey}&language=en-US&sort_by=popularity.desc&page=1&timezone=America%2FNew_York&include_null_first_air_dates=false&with_watch_monetization_types=flatrate"
    static let MoviesUrl = "https://api.themoviedb.org/3/discover/movie?api_key={apiKey}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate"
    static let ApiKey = "408446855a7ec2113c33da1df8d69427"
}
