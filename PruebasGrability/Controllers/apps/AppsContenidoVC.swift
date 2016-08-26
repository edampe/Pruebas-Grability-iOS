//
//  ZoomContenidoVC.swift
//  SOILite
//
//  Created by Sdatas on 30/07/15.
//  Copyright (c) 2015 Sdatas. All rights reserved.
//

import UIKit

class AppsContenidoVC: UIViewController {
    
    @IBOutlet var _principalView: UIView!
    @IBOutlet weak var _View1: UIView!
    @IBOutlet weak var _View2: UIView!
    @IBOutlet weak var _View3: UIView!
    @IBOutlet weak var _View4: UIView!
    
    @IBOutlet weak var _Img_1_1: UIImageView!
    @IBOutlet weak var _Img_1_2: UIImageView!
    @IBOutlet weak var _Img_1_3: UIImageView!
    @IBOutlet weak var _Img_2_1: UIImageView!
    @IBOutlet weak var _Img_2_2: UIImageView!
    @IBOutlet weak var _Img_2_3: UIImageView!
    @IBOutlet weak var _Img_3_1: UIImageView!
    @IBOutlet weak var _Img_3_2: UIImageView!
    @IBOutlet weak var _Img_3_3: UIImageView!
    
    @IBOutlet weak var _Txt_1_1: UITextField!
    @IBOutlet weak var _Txt_1_2: UITextField!
    @IBOutlet weak var _Txt_1_3: UITextField!
    @IBOutlet weak var _Txt_2_1: UITextField!
    @IBOutlet weak var _Txt_2_2: UITextField!
    @IBOutlet weak var _Txt_2_3: UITextField!
    @IBOutlet weak var _Txt_3_1: UITextField!
    @IBOutlet weak var _Txt_3_2: UITextField!
    @IBOutlet weak var _Txt_3_3: UITextField!
    
    
    
    // MARK: - Variables
    var itemIndex: Int = 0
    var _ImgApp_1_1: String = "", _ImgApp_1_2: String = "",_ImgApp_1_3: String = "", _ImgApp_2_1: String = "", _ImgApp_2_2: String = "",_ImgApp_2_3: String = "", _ImgApp_3_1: String = "", _ImgApp_3_2: String = "",_ImgApp_3_3: String = ""
    
    var _TxtApp_1_1 = "",_TxtApp_1_2 = "",_TxtApp_1_3 = "",_TxtApp_2_1 = "",_TxtApp_2_2 = "",_TxtApp_2_3 = "",_TxtApp_3_1 = "",_TxtApp_3_2 = "",_TxtApp_3_3 = "", _Categoria = ""
    
    var _CodApp_1_1 = 0,_CodApp_1_2 = 0,_CodApp_1_3 = 0,_CodApp_2_1 = 0,_CodApp_2_2 = 0,_CodApp_2_3 = 0,_CodApp_3_1 = 0,_CodApp_3_2 = 0,_CodApp_3_3 = 0
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
       
        
        if _ImgApp_1_1 != ""{
            _Img_1_1.kf_setImageWithURL(NSURL(string: _ImgApp_1_1)!, placeholderImage: nil)
            _Img_1_1.tag = _CodApp_1_1
        }
        if _ImgApp_1_2 != ""{
            _Img_1_2.kf_setImageWithURL(NSURL(string: _ImgApp_1_2)!, placeholderImage: nil)
            _Img_1_2.tag = _CodApp_1_2
        }
        if _ImgApp_1_3 != ""{
            _Img_1_3.kf_setImageWithURL(NSURL(string: _ImgApp_1_3)!, placeholderImage: nil)
            _Img_1_3.tag = _CodApp_1_3
        }
        if _ImgApp_2_1 != ""{
            _Img_2_1.kf_setImageWithURL(NSURL(string: _ImgApp_2_1)!, placeholderImage: nil)
            _Img_2_1.tag = _CodApp_2_1
        }
        if _ImgApp_2_2 != ""{
            _Img_2_2.kf_setImageWithURL(NSURL(string: _ImgApp_2_2)!, placeholderImage: nil)
            _Img_2_2.tag = _CodApp_2_2
        }
        if _ImgApp_2_3 != ""{
            _Img_2_3.kf_setImageWithURL(NSURL(string: _ImgApp_2_3)!, placeholderImage: nil)
            _Img_2_3.tag = _CodApp_2_3
        }
        if _ImgApp_3_1 != ""{
            _Img_3_1.kf_setImageWithURL(NSURL(string: _ImgApp_3_1)!, placeholderImage: nil)
            _Img_3_1.tag = _CodApp_3_1
        }
        if _ImgApp_3_2 != ""{
            _Img_3_2.kf_setImageWithURL(NSURL(string: _ImgApp_3_2)!, placeholderImage: nil)
            _Img_3_2.tag = _CodApp_3_2
        }
        if _ImgApp_3_3 != ""{
            _Img_3_3.kf_setImageWithURL(NSURL(string: _ImgApp_3_3)!, placeholderImage: nil)
            _Img_3_3.tag = _CodApp_3_3
        }
        
        
        _Txt_1_1.text = _TxtApp_1_1
        _Txt_1_2.text = _TxtApp_1_2
        _Txt_1_3.text = _TxtApp_1_3
        _Txt_2_1.text = _TxtApp_2_1
        _Txt_2_2.text = _TxtApp_2_2
        _Txt_2_3.text = _TxtApp_2_3
        _Txt_3_1.text = _TxtApp_3_1
        _Txt_3_2.text = _TxtApp_3_2
        _Txt_3_3.text = _TxtApp_3_3
        
       
        _Img_1_1.userInteractionEnabled = true
        _Img_1_1.addGestureRecognizer(UITapGestureRecognizer(target:self, action: Selector("img11Tapped:")))
        _Img_1_2.userInteractionEnabled = true
        _Img_1_2.addGestureRecognizer(UITapGestureRecognizer(target:self, action: Selector("img12Tapped:")))
        _Img_1_3.userInteractionEnabled = true
        _Img_1_3.addGestureRecognizer(UITapGestureRecognizer(target:self, action: Selector("img13Tapped:")))
        _Img_2_1.userInteractionEnabled = true
        _Img_2_1.addGestureRecognizer(UITapGestureRecognizer(target:self, action: Selector("img21Tapped:")))
        _Img_2_2.userInteractionEnabled = true
        _Img_2_2.addGestureRecognizer(UITapGestureRecognizer(target:self, action: Selector("img22Tapped:")))
        _Img_2_3.userInteractionEnabled = true
        _Img_2_3.addGestureRecognizer(UITapGestureRecognizer(target:self, action: Selector("img23Tapped:")))
        _Img_3_1.userInteractionEnabled = true
        _Img_3_1.addGestureRecognizer(UITapGestureRecognizer(target:self, action: Selector("img31Tapped:")))
        _Img_3_2.userInteractionEnabled = true
        _Img_3_2.addGestureRecognizer(UITapGestureRecognizer(target:self, action: Selector("img32Tapped:")))
        _Img_3_3.userInteractionEnabled = true
        _Img_3_3.addGestureRecognizer(UITapGestureRecognizer(target:self, action: Selector("img33Tapped:")))
    }
    
    func img11Tapped(img: AnyObject){ detallesApp(_Img_1_1.tag) }
    func img12Tapped(img: AnyObject){ detallesApp(_Img_1_2.tag) }
    func img13Tapped(img: AnyObject){ detallesApp(_Img_1_3.tag) }
    func img21Tapped(img: AnyObject){ detallesApp(_Img_2_1.tag) }
    func img22Tapped(img: AnyObject){ detallesApp(_Img_2_2.tag) }
    func img23Tapped(img: AnyObject){ detallesApp(_Img_2_3.tag) }
    func img31Tapped(img: AnyObject){ detallesApp(_Img_3_1.tag) }
    func img32Tapped(img: AnyObject){ detallesApp(_Img_3_2.tag) }
    func img33Tapped(img: AnyObject){ detallesApp(_Img_3_3.tag) }
    
    
    func detallesApp(_Img: Int)
    {
        print(_Img)
        // Your action 
        var appsCategoria = _UserDefaults.valueForKey(_Categoria) as!  Array<NSDictionary>
        self.mostrarDetalles(
            (appsCategoria[_Img].valueForKey("im:name") as! NSDictionary).valueForKey("label") as! String,
            precio: ((appsCategoria[_Img].valueForKey("im:price") as! NSDictionary).valueForKey("attributes") as! NSDictionary).valueForKey("amount") as! String,
            categoria:  ((appsCategoria[_Img].valueForKey("category") as! NSDictionary).valueForKey("attributes") as! NSDictionary).valueForKey("label") as! String,
            creador:    (appsCategoria[_Img].valueForKey("im:artist") as! NSDictionary).valueForKey("label") as! String,
            fecha:      ((appsCategoria[_Img].valueForKey("im:releaseDate") as! NSDictionary).valueForKey("attributes") as! NSDictionary).valueForKey("label") as! String,
            imagen:     ((appsCategoria[_Img].valueForKey("im:image") as! Array<NSDictionary>)[2]).valueForKey("label") as! String
        )

    }
    
}