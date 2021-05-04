//
//  NetworkManager.swift
//  MovieTool
//
//  Created by Burak Yavuzalp on 4.05.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    static let instance = NetworkManager()

    public func fetch<T:Codable> (_ method: HTTPMethod, url: String, requestModel: T?, model: T.Type, completion: @escaping (AFResult<Codable>) -> Void)
    {
        
        AF.request(
            url,
            method: method,
            parameters: NetworkManager.toParameters(model: requestModel),
            encoding: JSONEncoding.default,
            headers: nil
        )
        .validate()
            .responseJSON { response in

                switch response.result {
                case .success(let value as [String: AnyObject]):
                        do{
                            let responseJsonData = JSON(value)
                            print("jsonvalue: \(value)")

                            let responseModel = try JSONDecoder().decode(model.self, from: responseJsonData.rawData())
                            completion(.success(responseModel))
                        }
                        catch let parsingError{
                            print("Success (error): \(parsingError)")
                        }

                    case .failure(let error):
                            print("Failure: \(error)")
                            completion(.failure(error))

                        default: fatalError("Fatal error.")
                        
                    }
        }
    }

    static func toParameters<T:Encodable>(model: T?) -> [String:AnyObject]?
    {
        if(model == nil)
        {
            return nil
        }
        
        let jsonData = modelToJson(model:model)
        let parameters = jsonToParameters(from: jsonData!)
        return parameters! as [String: AnyObject]
    }

    static func modelToJson<T:Encodable>(model:T)  -> Data?
    {
        return try! JSONEncoder().encode(model.self)
    }

    static func jsonToParameters(from data: Data) -> [String: Any]?
    {
        return try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
    }
}

