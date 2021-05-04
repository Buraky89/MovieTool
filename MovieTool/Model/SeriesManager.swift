//
//  SeriesManager.swift
//  MovieTool
//
//  Created by Burak Yavuzalp on 4.05.2021.
//

import Foundation
import Alamofire

class SeriesManager {
    var delegate: MovieDelegate?
    
    func getUrl() -> String {
        return K.SeriesUrl.replacingOccurrences(of: "{apiKey}", with: K.ApiKey)
    }
    
    func getSeries()
    {

        
        NetworkManager.instance.fetch(HTTPMethod.get, url: getUrl(), requestModel: nil, model: SeriesResult.self) { response in
              
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
