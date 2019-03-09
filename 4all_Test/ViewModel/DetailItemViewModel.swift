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

    
    
}
