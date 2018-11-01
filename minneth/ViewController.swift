//
//  ViewController.swift
//  minneth
//
//  Created by Alumno on 31/10/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit
import Alamofire

//Heredar los protocolos
//Data source y delegate
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125.5
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Datos.resultadosPeliculas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "CellPelicula") as! CeldaPeliculaController
        celda.lblTitulo.text =
            Datos.resultadosPeliculas[indexPath.row].titulo
        celda.lblAño.text = "\(Datos.resultadosPeliculas[indexPath.row].año)"
        
        return celda
    }
    
    //Outlets
    @IBOutlet weak var tvResultado: UITableView!
    @IBOutlet weak var txtbuscar: UITextField!
    @IBOutlet weak var cargando: UIActivityIndicatorView!
    
    let urlBase = "https://omdbapi.com/?apikey=1d2750f9&s="
    
    //actions
    @IBAction func BuscarPelicula(_ sender: Any) {
        
        cargando.startAnimating()
        var busqueda = txtbuscar.text!
        busqueda = busqueda.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
        
        Alamofire.request("\(urlBase)\(busqueda)").responseJSON{
            response in
            
            Datos.resultadosPeliculas.removeAll()
            
            if let dictResponse = response.result.value as?
                NSDictionary {
                if let arrResultados = dictResponse.value(forKey:
                    "Search") as? NSArray {
                    for resultado in arrResultados {
                        if let dictResultado = resultado as?
                            NSDictionary {
                            let nuevoResultado =
                                Pelicula(diccionario: dictResultado)
                            
                            Datos.resultadosPeliculas.append(nuevoResultado)
                        }
                    }
                    self.tvResultado.reloadData()
                }
            }
            self.cargando.stopAnimating()
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

