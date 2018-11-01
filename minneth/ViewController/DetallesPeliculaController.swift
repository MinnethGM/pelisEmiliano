//
//  DetallePeliculaController.swift
//  minneth
//
//  Created by Alumno on 01/11/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class DetallesPeliculaController : UIViewController {
    
    var pelicula : Pelicula?
    let urlBase = "https://omdbapi.com/?apikey=1d2750f9&i="
    
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblAño: UILabel!
    @IBOutlet weak var lblDuracion: UILabel!
    @IBOutlet weak var lblClasificacion: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblGenero: UILabel!
    
    
}
