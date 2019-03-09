//
//  DataManager.swift
//  4all_Test
//
//  Created by Henrique Velloso on 09/03/19.
//  Copyright © 2019 Henrique Velloso. All rights reserved.
//

import Foundation


class DataManager {
    
    var session = URLSession.shared
    let apiUrl = ConfigurationManager.getConfig()?.apiUrl
    
    class func sharedInstance() -> DataManager {
        struct Singleton {
            static var sharedInstance = DataManager()
        }
        return Singleton.sharedInstance
    }
    
    
    func getListItens(completionHandler: @escaping (ListItem?, Error?) -> Void ) {
        
        let url = URL(string: apiUrl!.getListItens)
        let request = URLRequest(url: url!)
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let decodedItens = try decoder.decode(ListItem.self, from: data)
                        completionHandler(decodedItens, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                }
            }
        }
        
        dataTask.resume()
    }

    
    func getDetailItemById(itemId:String, completionHandler: @escaping (DetailItem?, Error?) -> Void ) {
        
        let url = URL(string: apiUrl!.getDetailItemById + itemId)
        let request = URLRequest(url: url!)
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.async {
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let decodedItens = try decoder.decode(DetailItem.self, from: data)
                        completionHandler(decodedItens, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
    
}
