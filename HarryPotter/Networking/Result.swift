//
//  Result.swift
//  HarryPotter
//
//  Created by Nilay Keven on 28.10.2020.
//

import Foundation

struct Result {
    
    private var data: Data
    
    init(data: Data) {
        self.data = data
    }
    
    public func decode<T: Codable>(_ type: T.Type) -> T? {
        let jsonDecoder = JSONDecoder()
        
        do {
            let response = try jsonDecoder.decode(T.self, from: data)
            return response
        } catch {
            print(error)
            return nil
        }
    }
}
