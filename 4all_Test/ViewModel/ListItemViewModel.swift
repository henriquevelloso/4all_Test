//
//  ListItemViewModel.swift
//  4all_Test
//
//  Created by Henrique Velloso on 09/03/19.
//  Copyright © 2019 Henrique Velloso. All rights reserved.
//

import Foundation

class ListItemViewModel {
    
    var itemList: ListItem?
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
            
            self.itemList = item
            self.error = error
            self.refreshing = false
            
            completion()
        }
    }
}
