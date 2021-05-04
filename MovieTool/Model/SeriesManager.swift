//
//  SeriesManager.swift
//  MovieTool
//
//  Created by Burak Yavuzalp on 4.05.2021.
//

import Foundation
import Alamofire

class SeriesManager {
    //var url = "https://api.themoviedb.org/3/discover/movie?api_key=408446855a7ec2113c33da1df8d69427&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate"
    var url = "https://api.themoviedb.org/3/discover/tv?api_key=408446855a7ec2113c33da1df8d69427&language=en-US&sort_by=popularity.desc&page=1&timezone=America%2FNew_York&include_null_first_air_dates=false&with_watch_monetization_types=flatrate"
    
    
    var delegate: MovieDelegate?
    
    func getUrl(parent: String) -> String {
        return "\(url)\(parent)"
    }
    
    func getSeries()
    {

        
        NetworkManager.instance.fetch(HTTPMethod.get, url: url, requestModel: nil, model: SeriesResult.self) { response in
              
              switch(response)
              {
                  case .success(let model):
                    
                    let result = model as! SeriesResult
                    self.delegate?.updateList(seriesResult: result)
                    
                case .failure(_): break
              }
            
            
            
              
          }
    }
    
}
