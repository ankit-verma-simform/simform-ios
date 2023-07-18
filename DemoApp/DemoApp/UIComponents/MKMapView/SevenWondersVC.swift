//
//  SevenWondersVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 08/05/23.
//

import UIKit
import MapKit

class SevenWondersVC: UIViewController {
    // MARK: - Variables
    private let sevenWondersList = Wonder.getSevenWonders()
    private let locationManager = CLLocationManager()
    private var annotation = WonderAnnotation()
    
    // MARK: - IB Outlets
    @IBOutlet private weak var picker: UIPickerView!
    @IBOutlet private weak var mapView: MKMapView!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: - Functions
extension SevenWondersVC {
    private func initialSetup() {
        picker.delegate = self
        setupMapView()
    }
    
    private func setupMapView() {
        mapView.delegate = self
        locationManager.delegate = self
        handleLocationPermissions()
    }
    
    private func handleLocationPermissions() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Need location to use app")
        case .denied:
            print("Need location to use app properly")
        case .authorizedAlways, .authorizedWhenInUse:
            showMapLocationFromPickerValue()
        @unknown default:
            print("Something went wrong!")
        }
    }
    
    private func setupAnnotation(_ wonder: Wonder) {
        mapView.removeAnnotation(annotation)
        annotation.title = wonder.name
        annotation.coordinate = CLLocationCoordinate2D(
            latitude: wonder.coords.latitude,
            longitude: wonder.coords.longitude)
        annotation.image = UIImage(systemName: "flag.fill")
        mapView.addAnnotation(annotation)
    }
    
    private func showMapLocationFromPickerValue() {
        print(#function)
        let currentPickerValue = picker.selectedRow(inComponent: 0)
        let wonder = sevenWondersList[currentPickerValue]
        let coords = CLLocationCoordinate2D(
                        latitude: wonder.coords.latitude,
                        longitude: wonder.coords.longitude)
        let wonderRegion = MKCoordinateRegion(center: coords,
                                              latitudinalMeters: 1000,
                                              longitudinalMeters: 1000)
        mapView.setCenter(wonderRegion.center, animated: true)
        setupAnnotation(wonder)
    }
}

// MARK: - MapView Delegate Methods
extension SevenWondersVC: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let wonderAnnotation = annotation as? WonderAnnotation else {
            return nil
        }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: WonderAnnotation.reusableId)
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: wonderAnnotation,
                                     reuseIdentifier: WonderAnnotation.reusableId)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = wonderAnnotation
        }
        annotationView?.image = wonderAnnotation.image
        return annotationView
    }
}

// MARK: - CLLocationManager Delegate Methods
extension SevenWondersVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        print(#function)
        print("Status: ", status.rawValue)
        handleLocationPermissions()
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        print(#function)
    }
}

// MARK: - UIPicker DataSource Methods
extension SevenWondersVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return sevenWondersList.count
    }
}

// MARK: - UIPicker Delegate Methods
extension SevenWondersVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return sevenWondersList[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        showMapLocationFromPickerValue()
    }
}
