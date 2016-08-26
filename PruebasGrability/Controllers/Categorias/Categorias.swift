//
//  Categorias.swift
//  PruebasGrability
//
//  Created by Edilberto Amado Perdomo on 8/22/16.
//
//

import Foundation
import Alamofire

let _UserDefaults = NSUserDefaults.standardUserDefaults()

class Categorias: NSObject {
    
    class func getData( urlSuffix : String,  success: (response: Bool!) -> Void, failure: (error: NSError?) -> Void)
{
        Alamofire.request(.GET, "https://itunes.apple.com/us/rss/topfreeapplications/limit=100/genre=" + urlSuffix + "/json") .validate() .responseJSON
            { response in
                switch(response.result)
                {
                case .Success:
                    
                    if let JSON = response.result.value as? NSDictionary
                    {
                        let _Apps = (JSON.valueForKey("feed") as! NSDictionary).valueForKey("entry") as!  Array<NSDictionary>
                        _UserDefaults.setValue(_Apps, forKey: urlSuffix)
                        success(response: true)
                    }
                case .Failure(let error):
                    print(error.localizedDescription)
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .Alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
                    UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alert, animated: true, completion:nil)
                    failure(error: error)
                    
                }
        }
    }
    
}

extension UIViewController {
    
    /**
     Alerta customizada para indicación de espera, recibe un mensaje de indicación y retorna el controlador de vista presentado que posteriormente deberá ser ocultado.
     
     - parameter mensaje: String del mensaje que se va a mostrar
     
     - returns: UIViewController con el indicador de espera presentado.
     */
    func mostrarDetalles(nombre: String, precio: String, categoria: String, creador: String, fecha: String, imagen: String) -> UIViewController
    {
        let modalViewController = DetallesVC(nombre: nombre, precio: precio, categoria: categoria, creador: creador, fecha: fecha, imagen: imagen)
        modalViewController.modalPresentationStyle = .OverCurrentContext
        presentViewController(modalViewController, animated: false, completion: nil)
        return modalViewController
    }
}