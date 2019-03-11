//
//  ListViewController.swift
//  4all_Test
//
//  Created by Henrique Velloso on 09/03/19.
//  Copyright © 2019 Henrique Velloso. All rights reserved.
//

import UIKit
import Kingfisher

class ListViewController: UIViewController {
    
    //MARK: Properties
    private var viewModel: ListItemViewModel?
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    
    //MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()        
        self.viewModel = ListItemViewModel(dataManager: DataManager.sharedInstance())
        self.loadTableViewData()
    }
    
    //MARK: Custom functions
    func loadTableViewData() {
        self.loadingView.alpha = 1
        self.viewModel?.fetchItem(completion: {
            UIView.animate(withDuration: 0.5, animations: {
                self.tableView.tableFooterView = UIView()
                self.tableView.reloadData()
                self.loadingView.alpha = 0
            })
        })
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToDetail" {
            let viewController = segue.destination as! DetailViewController
            viewController.listId = sender as? String
        }
    }
}


//MARK: - UITableViewDataSource, UITableViewDelegate
extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel!.itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listItem", for: indexPath) as! ListItemTableViewCell
        let itemId = viewModel!.itemList[indexPath.row]
        viewModel!.fetchItemById(itemId: itemId) { detail in
            cell.titleLabel.text = detail?.titulo
            cell.backgroundImage.loadImage(imageUrl: (detail?.urlFoto)!)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let listId = self.viewModel?.itemList[indexPath.row]
        performSegue(withIdentifier: "segueToDetail", sender: listId)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
    
}
