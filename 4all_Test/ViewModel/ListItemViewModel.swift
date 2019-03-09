//
//  ListItemViewModel.swift
//  4all_Test
//
//  Created by Henrique Velloso on 09/03/19.
//  Copyright © 2019 Henrique Velloso. All rights reserved.
//

import Foundation

class ListItemViewModel {
    
    var itemList: [String] = []
    var itemDetail: DetailItem?
    var error: Error?
    var refreshing = false
    
    private let dataManager: DataManager
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func fetchItem(completion: @escaping () -> Void) {
        
        refreshing = true
        dataManager.getListItens { (item, error) in
            
            if let lista = item?.lista {
                for item in lista {
                    self.itemList.append(item)
                }
            }
            
            self.error = error
            self.refreshing = false
            
            completion()
        }
    }
    
    func fetchItemById(itemId: String, completion: @escaping (DetailItem?) -> Void) {
        
        refreshing = true
        dataManager.getDetailItemById(itemId: itemId) { (item, error) in
            
            self.itemDetail = item
            self.error = error
            self.refreshing = false
            
            completion(item)
        }
    }
}
