//
//  MapVC.swift
//  orlando-tree-orders
//
//  Created by Keli'i Martin on 6/2/16.
//  Copyright © 2016 Code for Orlando. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate
{
    ////////////////////////////////////////////////////////////
    // MARK: - Outlets
    ////////////////////////////////////////////////////////////

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var toolbar: UIToolbar!

    ////////////////////////////////////////////////////////////
    // MARK: Properties
    ////////////////////////////////////////////////////////////

    let centerPoint = CLLocationCoordinate2DMake(28.540655, -81.381483)
    var orders = [TreeOrder]()
    lazy var locationManager = CLLocationManager()
    var currentMapType = MKMapType.Standard

    ////////////////////////////////////////////////////////////
    // MARK: - View Controller Life Cycle
    ////////////////////////////////////////////////////////////

    override func viewDidLoad()
    {
        super.viewDidLoad()

        mapView.delegate = self
        locationManager.delegate = self

        let region = MKCoordinateRegionMakeWithDistance(centerPoint, 2000, 2000)
        mapView.setRegion(region, animated: true)

        if CLLocationManager.authorizationStatus() == .NotDetermined
        {
            locationManager.requestWhenInUseAuthorization()
        }

        mapView.userTrackingMode = .None
        mapView.mapType = currentMapType

        // TODO: Setup toolbar

        DataService.sharedInstance.getTreeOrders
        { treeOrders in
            for treeOrder in treeOrders
            {
                if let order = treeOrder.order,
                   let treeName = treeOrder.treeName
                {
                    print("Order # \(order): \(treeName)")
                }
            }
        }
    }
}

