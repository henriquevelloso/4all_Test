//
//  UIImageView.swift
//  4all_Test
//
//  Created by Henrique Velloso on 11/03/19.
//  Copyright © 2019 Henrique Velloso. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImage(imageUrl:String) {
        var imageView = self
        let url = URL(string: imageUrl)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "temp"),
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
