//
//  DetailItem.swift
//  4all_Test
//
//  Created by Henrique Velloso on 09/03/19.
//  Copyright © 2019 Henrique Velloso. All rights reserved.
//

import Foundation

struct DetailItem: Codable {
    var id: String
    var cidade: String
    var bairro: String
    var urlFoto: String
    var urlLogo: String
    var titulo: String
    var telefone: String
    var texto: String
    var endereco: String
    var latitude: Double
    var longitude: Double
    var comentarios: [Comentario]
}


struct Comentario : Codable {
    var urlFoto: String
    var nome: String
    var nota: Int
    var titulo: String
    var comentario: String
}
