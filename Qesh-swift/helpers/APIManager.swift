//
//  APIManager.swift
//  Qesh-swift
//
//  Created by Amir Khan on 14/12/2023.
//

import Foundation


enum HTTPMethod: String {
    case get = "GET"
    case post = "POST" 
    case put = "PUT"
    case delete = "DELETE"
}

typealias Handler = (Result <Data, Error>) -> Void;


final class APIManager {
    
    static let shared = APIManager()
    private init() {}
    
    private let base_url: String = "https://jsonplaceholder.typicode.com/"
    
    
    func makeApiRequest (method: HTTPMethod, path: String, params: [String : Any]? = nil, headerOpt:[String:String ]? = nil ,completion: @escaping Handler){
        guard let url = URL(string: base_url + path) else {
            completion(.failure(NSError(domain: "Invalid Url", code: 404, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod =  method.rawValue
        
        if let params = params {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: params, options:.prettyPrinted)
            } catch{
                completion(.failure(error))
            }
        }
        
        var headers: [String: String] = headerOpt ?? [:]
        
        if let token = UserDefaults.standard.string(forKey: "access_token"){
            headers["Authorization"] = token
        }
        
        headers["Content-Type"] =  "application/json"
        request.allHTTPHeaderFields =  headers
        
        
        URLSession.shared.dataTask(with: request) { (data,response,error ) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            
            completion(.success(data))
           
        }.resume()
    }
}
