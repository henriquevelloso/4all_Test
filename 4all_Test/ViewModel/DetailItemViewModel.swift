//
//  DetailItemViewModel.swift
//  4all_Test
//
//  Created by Henrique Velloso on 09/03/19.
//  Copyright © 2019 Henrique Velloso. All rights reserved.
//

import Foundation

class DetailItemViewModel {
    
    var item: DetailItem?
    var error: Error?
    var refreshing = false
    
    private let dataManager: DataManager
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func fetchItemById(itemId: String, completion: @escaping () -> Void) {
        refreshing = true
        
        dataManager.getDetailItemById(itemId: itemId) { (item, error) in
        
            self.item = item
            self.error = error
            self.refreshing = false
            
            completion()
        }
    }

    func setStarsImage(nota: Int) -> String {
        
        switch nota {
        case 5:
            return "star_5"
        case 4:
            return "star_4"
        case 3:
            return "star_3"
        case 2:
            return "star_2"
        case 1:
            return "star_1"
        default:
            return "star_0"
        }
    }
    
    
}
