//
//  MKMapViewVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 05/05/23.
//

import UIKit
import MapKit

class MKMapViewVC: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: - Functions
extension MKMapViewVC {
    private func initialSetup() {
        //mapView.
    }
}
