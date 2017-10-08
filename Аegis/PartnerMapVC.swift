//
//  PartnerMapVC.swift
//  Аegis
//
//  Created by Владислав Ходеев on 13.06.17.
//  Copyright © 2017 Владислав Ходеев. All rights reserved.
//

import UIKit
import MapKit



class PartnerMapVC: UIViewController,MKMapViewDelegate {
    
    var location = [String]()
    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        
        let locationString = "Минск, улица Немига 3"
        
        
        
        
        
        
        let geocoder = CLGeocoder()
         geocoder.geocodeAddressString(locationString) { (placemarks, error ) in
            guard error == nil else {return}
            guard let placemarks = placemarks else {return}
            
            let placemark = placemarks.first!
            let annotation = MKPointAnnotation()

            guard let location = placemark.location else {return}
            annotation.coordinate = location.coordinate
            
            self.mapView.showAnnotations([annotation], animated: true)
            self.mapView.selectAnnotation(annotation, animated: true)
            
            
        }
        

    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {return nil}
        
        let annotateID = "shopAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotateID) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotateID)
            annotationView?.canShowCallout = true
            
        }
      
        
        
        annotationView?.pinTintColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
        
        return annotationView
        
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
