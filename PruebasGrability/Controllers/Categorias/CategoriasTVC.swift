//
//  CategoriasTVC.swift
//  PruebasGrability
//
//  Created by Edilberto Amado Perdomo on 8/22/16.
//
//

import UIKit

class CategoriasTVC: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerNib(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return IMG_CATEGORIAS.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell

        cell.lblCelda.text = NAME_CATEGORIAS[indexPath.row]
        cell.imgCelda.image = UIImage(named: IMG_CATEGORIAS[indexPath.row])

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        progressBarDisplayer("Estamos organizando tus apps", true)
        
        Categorias.getData(ID_CATEGORIAS[indexPath.row], success: { (response) -> Void in
            self.afterResponse(ID_CATEGORIAS[indexPath.row])
        }) { (error) -> Void in
            print("Error")
            _MessageFrame.removeFromSuperview()
        }
        
    }
    // MARK: Custom functions
    func progressBarDisplayer(msg:String, _ indicator:Bool ) {
       
        _StrLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 200, height: 50))
        _StrLabel.text = msg
        _StrLabel.textColor = UIColor.whiteColor()
        _MessageFrame = UIView(frame: CGRect(x: view.frame.midX - 90, y: view.frame.midY - 25 , width: 180, height: 50))
        _MessageFrame.layer.cornerRadius = 15
        _MessageFrame.backgroundColor = UIColor(white: 0, alpha: 0.7)
        if indicator {
            _ActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.White)
            _ActivityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            _ActivityIndicator.startAnimating()
            _MessageFrame.addSubview(_ActivityIndicator)
        }
        _MessageFrame.addSubview(_StrLabel)
        view.addSubview(_MessageFrame)
    }
    
    func afterResponse(_Genre: String)
    {
        
        _MessageFrame.removeFromSuperview()
        
        let vc: AppsVC = AppsVC(nibName: "AppsVC", bundle: nil)
        vc._CodCategoria = _Genre
        self.navigationController?.pushViewController(vc, animated: true)
        /*
        let cvc = AppsCVCCollectionViewController(nibName: "AppsCVCCollectionViewController", bundle: nil)
        self.navigationController?.pushViewController(cvc, animated: true)*/
    }

    
}
