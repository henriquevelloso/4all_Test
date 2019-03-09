//
//  Configuration.swift
//  4all_Test
//
//  Created by Henrique Velloso on 09/03/19.
//  Copyright © 2019 Henrique Velloso. All rights reserved.
//

import Foundation

struct Configurations: Codable {
    
    var apiUrl: ApiUrl
    
}

struct ApiUrl: Codable {
    
    var host: String
    var getListItens: String
    var getDetailItemById: String
    
}
