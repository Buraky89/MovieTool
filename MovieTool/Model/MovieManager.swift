//
//  SeriesManager.swift
//  MovieTool
//
//  Created by Burak Yavuzalp on 4.05.2021.
//

import Foundation
import Alamofire

class MovieManager<T:Codable> {
    var delegate: MovieDelegate?
    
    func getUrl() -> String {
        var baseUrl = ""
        if T.self == MovieResult.self {
            baseUrl = K.MoviesUrl
        } else {
            baseUrl = K.SeriesUrl
        }
        return baseUrl.replacingOccurrences(of: "{apiKey}", with: K.ApiKey)
    }
    
    func getAll()
    {

        
        NetworkManager.instance.fetch(HTTPMethod.get, url: getUrl(), requestModel: nil, model: T.self) { response in
              
              switch(response)
              {
                  case .success(let model):
                    
                    let result = model as! T
                    self.delegate?.updateList(result: result)
                    
                case .failure(_): break
              }
            
            
            
              
          }
    }
    
}
