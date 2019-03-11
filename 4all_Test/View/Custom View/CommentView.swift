//
//  CommentView.swift
//  4all_Test
//
//  Created by Henrique Velloso on 11/03/19.
//  Copyright © 2019 Henrique Velloso. All rights reserved.
//

import UIKit

class CommentView: UIView {

    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var fotoImageView: UIImageView!
    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var comentarioLabel: UILabel!
    @IBOutlet weak var starsImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("CommentView", owner: self, options: nil)
        
        self.addSubview(containerView)
        self.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
    }

}
