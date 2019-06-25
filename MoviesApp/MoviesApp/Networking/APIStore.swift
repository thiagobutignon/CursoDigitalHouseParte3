//
//  APIStore.swift
//  MoviesApp
//
//  Created by Thiago B Claramunt on 24/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Alamofire

class MovieAPIStore {
    
    typealias completion <T> = (_ result: T, _ failure: NSError?) -> Void
    
    func getMovies(completion: @escaping completion<[Movie]?>) {
        let params: Parameters = ["api_key": API.apiKey]
        let url = API.baseURL + API.movie + API.popular
        
        Alamofire.request(url,
                          method: .get,
                          parameters: params,
                          encoding: URLEncoding(destination: .queryString)).responseJSON { (response) in
            
            if response.response?.statusCode == 200 {
                print("Deu certo MovieAPIStore --- getMovies  \(response.result.value ?? "nil")")
                
                
                guard let json = response.result.value as? NSDictionary else {
                    completion(nil, NSError())
                    
                    return
                }
                let _modelArray: [[String: Any]] = json.object(forKey: "results") as! [[String:Any]]
                var arrayMovies: [Movie] = []
                
                for value in _modelArray {
                    let _movie = Movie(dic: value)
                    arrayMovies.append(_movie)
                }
                
                completion(arrayMovies, nil)
            }
            
           
            
        }
    }
}
