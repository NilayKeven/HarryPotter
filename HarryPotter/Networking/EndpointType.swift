//
//  EndpointType.swift
//  HarryPotter
//
//  Created by Nilay Keven on 28.10.2020.
//

import Foundation

protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var httpHeaders: [HTTPHeader] { get }
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

extension EndpointType {
    
    typealias HTTPHeader = (value: String, forHTTPHeaderField: String)
    
    func retrieve<T: Codable>(completion: @escaping (_ response: (T?)) -> Void ) {
        
        var urlRequest = URLRequest(url: baseURL)
        
        for header in httpHeaders {
            urlRequest.setValue(header.value, forHTTPHeaderField: header.forHTTPHeaderField)
        }
        
        let urlSession = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let _ = error {
                print("ERROR DESCRIBTION: " + (error?.localizedDescription ?? "Client Error!"))
                completion(nil)
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("ERROR DESCRIBTION: Server Error!")
                completion(nil)
                return
            }
            
            if let data = data {
                let response = Result(data: data)
                guard let decodedData = response.decode(T.self) else {
                    print("ERROR DESCRIBTION: Decode Error!")
                    completion(nil)
                    return
                }
                completion(decodedData)
            }
        }
        urlSession.resume()
    }
}
