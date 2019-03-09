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
    
    //MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ListItemViewModel(dataManager: DataManager.sharedInstance())
        self.loadTableViewData()
    }
    
    //MARK: Custom functions
    func loadTableViewData() {
        self.viewModel?.fetchItem(completion: {
            self.tableView.reloadData()
            self.tableView.tableFooterView = UIView()
        })
    }
    
    func loadImage(imageView:inout UIImageView, imageUrl:String, tempImage:String) {
        
        let url = URL(string: imageUrl)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: tempImage),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
        
    }
}

//MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel!.itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listItem", for: indexPath) as! ListItemTableViewCell
        
        let itemId = viewModel!.itemList[indexPath.row]
        viewModel!.fetchItemById(itemId: itemId) { detail in
           
            cell.titleLabel.text = detail?.titulo
            self.loadImage(imageView: &cell.backgroundImage, imageUrl: (detail?.urlFoto)!, tempImage: "tempBackground")
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
    
}
