//
//  ZoomVC.swift
//  SOILite
//
//  Created by Sdatas on 30/07/15.
//  Copyright (c) 2015 Sdatas. All rights reserved.
//

import UIKit
import Foundation

class AppsVC: UIPageViewController , UIPageViewControllerDataSource,  UISearchResultsUpdating, UISearchBarDelegate {
    
    // MARK: - Variables
    var _SearchController: UISearchController!
    var pageViewController: UIPageViewController?
    var appsCategoria = Array<NSDictionary>()
    var _CodCategoria = String()
 
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        

        self.navigationController!.navigationBar.barTintColor = UIColor(white: 1, alpha: 0.5)
        configureSearchController()
        
        
        let botonVistas = UIButton(frame: CGRectMake(0, 0, 25, 25))
        botonVistas.setImage(UIImage(named: "ic_action_menu_custom"), forState: UIControlState.Normal)
        botonVistas.titleEdgeInsets = UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)
        botonVistas.addTarget(self, action: "vistasTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        //Boton para generar espacio a la izquierda
        let bEspacioV = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FixedSpace, target: nil, action: nil)
        bEspacioV.width = -4
        
        let botonVistaBarra = UIBarButtonItem(customView: botonVistas)
        self.navigationItem.rightBarButtonItems = [bEspacioV,botonVistaBarra]

        appsCategoria = _UserDefaults.valueForKey(_CodCategoria) as!  Array<NSDictionary>
        createPageViewController()
    }
    func vistasTapped(img: AnyObject){ }
    
    private func createPageViewController()
    {
        let pageController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pageController.dataSource = self
        pageController.gestureRecognizers
        
        if appsCategoria.count > 0 {
            let firstController = getItemController(0)!
            let startingViewControllers: NSArray = [firstController]
            pageController.setViewControllers((startingViewControllers as! [UIViewController]), direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        }
        
        pageViewController = pageController
        addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        pageViewController!.didMoveToParentViewController(self)
    }
    
   
    
    // MARK: - UIPageViewControllerDataSource
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        let itemController = viewController as! AppsContenidoVC
        
        if itemController.itemIndex > 0
        {
            return getItemController(itemController.itemIndex-1)
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        
        let itemController = viewController as! AppsContenidoVC
        
        if itemController.itemIndex+1 < appsCategoria.count
        {
            return getItemController(itemController.itemIndex+1)
        }
        return nil
    }
    
    private func getItemController(itemIndex: Int) -> AppsContenidoVC?
    {
        if itemIndex < appsCategoria.count
        {
            let arg = itemIndex 
            let _CanDatos = 1 + (arg * 9)
            let pageItemController = AppsContenidoVC(nibName: "AppsContenidoVC", bundle: nil)
            if _CanDatos < appsCategoria.count{
                
                pageItemController.itemIndex = itemIndex
                pageItemController._Categoria = _CodCategoria
                
                pageItemController._ImgApp_1_1 = ((appsCategoria[_CanDatos].valueForKey("im:image") as! Array<NSDictionary>)[0]).valueForKey("label") as! String
                pageItemController._TxtApp_1_1 = (appsCategoria[_CanDatos].valueForKey("im:name") as! NSDictionary).valueForKey("label") as! String
                pageItemController._CodApp_1_1 = _CanDatos
                
                pageItemController._ImgApp_1_2 = ((appsCategoria[_CanDatos + 1].valueForKey("im:image") as! Array<NSDictionary>)[0]).valueForKey("label") as! String
                pageItemController._TxtApp_1_2 = (appsCategoria[_CanDatos + 1].valueForKey("im:name") as! NSDictionary).valueForKey("label") as! String
                pageItemController._CodApp_1_2 = _CanDatos + 1
                
                pageItemController._ImgApp_1_3 = ((appsCategoria[_CanDatos + 2].valueForKey("im:image") as! Array<NSDictionary>)[0]).valueForKey("label") as! String
                pageItemController._TxtApp_1_3 = (appsCategoria[_CanDatos + 2].valueForKey("im:name") as! NSDictionary).valueForKey("label") as! String
                pageItemController._CodApp_1_3 = _CanDatos + 2
                
                pageItemController._ImgApp_2_1 = ((appsCategoria[_CanDatos + 3].valueForKey("im:image") as! Array<NSDictionary>)[0]).valueForKey("label") as! String
                pageItemController._TxtApp_2_1 = (appsCategoria[_CanDatos + 3].valueForKey("im:name") as! NSDictionary).valueForKey("label") as! String
                pageItemController._CodApp_2_1 = _CanDatos + 3
                
                pageItemController._ImgApp_2_2 = ((appsCategoria[_CanDatos + 4].valueForKey("im:image") as! Array<NSDictionary>)[0]).valueForKey("label") as! String
                pageItemController._TxtApp_2_2 = (appsCategoria[_CanDatos + 4].valueForKey("im:name") as! NSDictionary).valueForKey("label") as! String
                pageItemController._CodApp_2_2 = _CanDatos + 4
                
                pageItemController._ImgApp_2_3 = ((appsCategoria[_CanDatos + 5].valueForKey("im:image") as! Array<NSDictionary>)[0]).valueForKey("label") as! String
                pageItemController._TxtApp_2_3 = (appsCategoria[_CanDatos + 5].valueForKey("im:name") as! NSDictionary).valueForKey("label") as! String
                pageItemController._CodApp_2_3 = _CanDatos + 5
                
                pageItemController._ImgApp_3_1 = ((appsCategoria[_CanDatos + 6].valueForKey("im:image") as! Array<NSDictionary>)[0]).valueForKey("label") as! String
                pageItemController._TxtApp_3_1 = (appsCategoria[_CanDatos + 6].valueForKey("im:name") as! NSDictionary).valueForKey("label") as! String
                pageItemController._CodApp_3_1 = _CanDatos + 6
                
                pageItemController._ImgApp_3_2 = ((appsCategoria[_CanDatos + 7].valueForKey("im:image") as! Array<NSDictionary>)[0]).valueForKey("label") as! String
                pageItemController._TxtApp_3_2 = (appsCategoria[_CanDatos + 7].valueForKey("im:name") as! NSDictionary).valueForKey("label") as! String
                pageItemController._CodApp_3_2 = _CanDatos + 7
                
                pageItemController._ImgApp_3_3 = ((appsCategoria[_CanDatos + 8].valueForKey("im:image") as! Array<NSDictionary>)[0]).valueForKey("label") as! String
                pageItemController._TxtApp_3_3 = (appsCategoria[_CanDatos + 8].valueForKey("im:name") as! NSDictionary).valueForKey("label") as! String
                pageItemController._CodApp_3_3 = _CanDatos + 8
                
                return pageItemController                
            }
        }
        return nil
    }
    
    // MARK: - Page Indicaton
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        print(Int(round(Double(appsCategoria.count) / 9.0)))
        return Int(round(Double(appsCategoria.count) / 9.0))
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
    }
    
    func configureSearchController() {
        // Initialize and perform a minimum configuration to the search controller.
        _SearchController = UISearchController(searchResultsController: nil)
        _SearchController.searchResultsUpdater = self
        _SearchController.dimsBackgroundDuringPresentation = false
        _SearchController.searchBar.placeholder = "Search here..."
        _SearchController.searchBar.delegate = self
        _SearchController.searchBar.sizeToFit()
        _SearchController.searchBar.frame.size.width = self.view.frame.size.width
        
        // Place the search bar view to the tableview headerview.
        // _principalView.viewtableHeaderView = _SearchController.searchBar
        _SearchController.hidesNavigationBarDuringPresentation = false
        _SearchController.searchBar.searchBarStyle = UISearchBarStyle.Minimal
        self.navigationItem.titleView = self._SearchController.searchBar
        self.definesPresentationContext = true
        
    }
    
    
    // MARK: UISearchBarDelegate functions
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        
    }
    
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        
    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        
    }
    
    
    
    // MARK: UISearchResultsUpdating delegate function
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        // Reload the tableview.
    }
    
    
    // MARK: CustomSearchControllerDelegate functions
    
    func didStartSearching() {
        
    }
    
    
    func didTapOnSearchButton() {
        
        
    }
    
    
    func didTapOnCancelButton() {
    }
    
    
    func didChangeSearchText(searchText: String) {
        // Filter the data array and get only those countries that match the search text.
        
    }
    
    
    
}

