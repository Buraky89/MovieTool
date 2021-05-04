//
//  SeriesManager.swift
//  MovieTool
//
//  Created by Burak Yavuzalp on 4.05.2021.
//

import Foundation
import Alamofire

class SeriesManager<T:Codable> {
    var delegate: MovieDelegate?
    
    func getUrl() -> String {
        return K.SeriesUrl.replacingOccurrences(of: "{apiKey}", with: K.ApiKey)
    }
    
    func getSeries()
    {

        
        NetworkManager.instance.fetch(HTTPMethod.get, url: getUrl(), requestModel: nil, model: T.self) { response in
              
              switch(response)
              {
                  case .success(let model):
                    
                    let result = model as! T
                    self.delegate?.updateList(seriesResult: result as! SeriesResult)
                    
                case .failure(_): break
              }
            
            
            
              
          }
    }
    
}
