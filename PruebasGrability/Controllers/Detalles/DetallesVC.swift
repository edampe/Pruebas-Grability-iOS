//
//  DetallesVC.swift
//  PruebasGrability
//
//  Created by Sdatas on 8/19/16.
//
//

import UIKit
import Kingfisher

class DetallesVC: UIViewController {

    
    @IBOutlet weak var imgApp: UIImageView!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblPrecio: UILabel!
    @IBOutlet weak var lblCategoria: UILabel!
    @IBOutlet weak var lblCreador: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    
    @IBOutlet weak var vista: UIView!
    
    var nombre = String()
    var precio = String()
    var categoria = String()
    var creador = String()
    var fecha = String()
    var imagen = String()
    
    init (nombre: String, precio: String, categoria: String, creador: String, fecha: String, imagen: String) {
        self.nombre     =  nombre
        self.precio     = precio
        self.categoria  =  categoria
        self.creador    = creador
        self.fecha      =  fecha
        
        self.imagen = imagen
        super.init(nibName: "DetallesVC", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Fondo de vista
        view.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        view.opaque = false

        vista.layer.shadowColor = UIColor.blackColor().CGColor
        vista.layer.shadowOpacity = 1
        vista.layer.shadowOffset = CGSizeZero
        vista.layer.shadowRadius = 10
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(self.btnAtras(_:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    
    override func viewWillAppear(animated: Bool) {
        lblFecha.text = self.fecha
        lblPrecio.text = self.precio
        lblNombre.text = self.nombre
        lblCategoria.text = self.categoria
        lblCreador.text = self.creador
        
        imgApp.kf_setImageWithURL(NSURL(string: imagen)!, placeholderImage: nil)
        
    }
    
    func btnAtras(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
