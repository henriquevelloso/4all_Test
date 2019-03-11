//
//  DetailViewController.swift
//  4all_Test
//
//  Created by Henrique Velloso on 09/03/19.
//  Copyright © 2019 Henrique Velloso. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    //MARK: Properties
    private var viewModel: DetailItemViewModel?
    var listId: String?
    
    //MARK: Outlets
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var enderecoLabel: UILabel!
    @IBOutlet weak var comentariosStackView: UIStackView!
    
    @IBOutlet weak var commentsVIew: UIView!
    //MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = DetailItemViewModel(dataManager: DataManager.sharedInstance())
        self.initialSetup()
    }
    
    //MARK: Custom functions
    func initialSetup() {
        
        self.loadingView.alpha = 1
        self.navigationItem.title = "Loading..."
        
        if let id = self.listId {
            self.viewModel?.fetchItemById(itemId: id, completion: {
                UIView.animate(withDuration: 0.5, animations: {
                    self.loadingView.alpha = 0
                    
                    if let item = self.viewModel?.item {
                        self.navigationItem.title = "\(item.cidade) - \(item.bairro)"
                        self.fotoImageView.loadImage(imageUrl: item.urlFoto)
                        self.logoImageView.loadImage(imageUrl: item.urlLogo)
                        self.tituloLabel.text = item.titulo
                        self.descriptionLabel.text = item.texto
                        self.enderecoLabel.text = item.endereco
                        
                        let location = CLLocationCoordinate2D(latitude: item.latitude,longitude: item.longitude)
                        let span = MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
                        let region = MKCoordinateRegion(center: location, span: span)
                        let annotation = MKPointAnnotation()
                        annotation.coordinate = location
                        self.mapView.setRegion(region, animated: true)
                        self.mapView.addAnnotation(annotation)
                        
                        
                        
                        for comment in item.comentarios {
                            let commentView = CommentView()
                            commentView.nomeLabel.text = comment.nome
                            commentView.tituloLabel.text = comment.titulo
                            commentView.comentarioLabel.text = comment.comentario
                            commentView.fotoImageView.loadImage(imageUrl: comment.urlFoto)
                            let starImageName = self.viewModel?.setStarsImage(nota: comment.nota)
                            commentView.starsImage.image = UIImage(named: starImageName!)
                            commentView.translatesAutoresizingMaskIntoConstraints = false
                            self.comentariosStackView.translatesAutoresizingMaskIntoConstraints = false
                            self.comentariosStackView.addArrangedSubview(commentView)
                            
                            
                        }
                    }
                })
            })
        }
    }
    
    //MARK: Custom functions
   
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
}
