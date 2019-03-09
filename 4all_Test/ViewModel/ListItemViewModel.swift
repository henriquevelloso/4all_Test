//
//  ListItemViewModel.swift
//  4all_Test
//
//  Created by Henrique Velloso on 09/03/19.
//  Copyright © 2019 Henrique Velloso. All rights reserved.
//

import Foundation

class ListItemViewModel {
    
    var items: [ListItem] = []
    var error: Error?
    var refreshing = false
    
    private let dataManager: DataManager
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func fetch(completion: @escaping () -> Void) {
        refreshing = true
        /*
         dataManager.fetchItems { [weak self] (items, error) in
         self?.items = items ?? []
         self?.error = error
         self?.refreshing = false
         completion()
         }
         */
    }
}
