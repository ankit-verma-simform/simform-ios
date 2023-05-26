//
//  MKMapViewVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 05/05/23.
//

import UIKit
import MapKit

class MKMapViewVC: UIViewController {
    // MARK: - Variables
    private var locationManager = CLLocationManager()
    private var initialLocation = CLLocation(latitude: 48.86289113006975,
                                             longitude: 2.2955338939825167)
    private var pinAnnotation: MyAnnotation?
    
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
        checkMapService()
        centerLocation()
        cameraBoundary()
        //addAnnotation()
        addMyAnnotation()
        monitorRegionAtLocation(center: initialLocation.coordinate,
                                identifier: "tower of paris")
    }
    
    private func checkMapService() {
        DispatchQueue.global().async { [weak self] in
            guard let self else {
                return
            }
            if CLLocationManager.locationServicesEnabled() {
                print("Location enabled!")
                self.checkLocationAuth()
            } else {
                print("Location disabled!")
            }
        }
    }
    
    private func checkLocationAuth() {
        switch locationManager.authorizationStatus {
        case .authorizedAlways:
            print("Auth always")
        case .authorizedWhenInUse:
            print("When in use")
            mapView.showsUserLocation = true
        case .denied:
            print("denied")
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            mapView.showsUserLocation = true
            print(#line)
        case .restricted:
            print(#line)
        @unknown default:
            print(#line)
        }
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingHeading()
    }
    
    private func centerLocation() {
        let region = MKCoordinateRegion(center: initialLocation.coordinate,
                                        latitudinalMeters: 300,
                                        longitudinalMeters: 300)
        mapView.setRegion(region, animated: true)
    }
    
    private func cameraBoundary() {
        let region = MKCoordinateRegion(center: initialLocation.coordinate,
                                        latitudinalMeters: 3000,
                                        longitudinalMeters: 3000)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        mapView.setCameraZoomRange(MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 3000), animated: true)
    }
    
    private func addAnnotation() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = initialLocation.coordinate
        annotation.title = "Tower of Paris"
        mapView.addAnnotation(annotation)
    }
    
    private func addMyAnnotation() {
        let annotation = MyAnnotation()
        annotation.coordinate = initialLocation.coordinate
        annotation.title = "Tower of Paris"
        mapView.addAnnotation(annotation)
    }
    
    func monitorRegionAtLocation(center: CLLocationCoordinate2D, identifier: String ) {
        // Make sure the devices supports region monitoring.
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            print("monitoring region")
            // Register the region.
            let maxDistance = locationManager.maximumRegionMonitoringDistance
            let region = CLCircularRegion(center: center,
                 radius: maxDistance, identifier: identifier)
            region.notifyOnEntry = true
            region.notifyOnExit = false
            locationManager.startMonitoring(for: region)
        } else {
            print("Not available monitoring")
        }
    }
}

// MARK: - Delegate Methods
extension MKMapViewVC: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MyAnnotation else {
            return nil
        }
        let reusableId = "MyAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reusableId)
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reusableId)
        } else {
            annotationView?.annotation = annotation
        }
        guard let myAnnotation = annotation as? MyAnnotation,
              let image = myAnnotation.customImage else {
            return nil
        }
        annotationView?.image = image
        annotationView?.canShowCallout = true
        return annotationView
    }
}

// MARK: - CLLocationManager Delegate Methods
extension MKMapViewVC: CLLocationManagerDelegate {
    
}
