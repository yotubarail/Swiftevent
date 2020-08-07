//
//  MyMapView.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/08/04.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI
import MapKit

struct MyMapView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var eventData: myEvent
    
    var body: some View {
        NavigationView {
            MapView(eventData: eventData, showingRoute: true)
            .edgesIgnoringSafeArea(.all)
            
        .navigationBarTitle("地図", displayMode: .inline)
        .navigationBarItems(leading: Button("完了") {
            self.presentationMode.wrappedValue.dismiss()
        }
        .font(.system(size: 22))
        )
        }
    }
}

struct MapView: UIViewRepresentable {
    let eventData: myEvent!
    let showingRoute: Bool
    
    private let mapView = WrappableMapView()

    func makeUIView(context: UIViewRepresentableContext<MapView>) -> WrappableMapView {
        mapView.delegate = mapView
        return mapView
    }

    func updateUIView(_ uiView: WrappableMapView, context: UIViewRepresentableContext<MapView>) {
        guard let lat = eventData.lat, let lon = eventData.lon else {
            return
        }
        let coordinate = CLLocationCoordinate2D(latitude:Double(lat)!, longitude:Double(lon)!)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = eventData.place
        uiView.addAnnotation(annotation)
        
        uiView.showsUserLocation = true
        
        if showingRoute {
            let locationManager = CLLocationManager()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()

            let request = MKDirections.Request()
            request.source = .forCurrentLocation()
            request.destination = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
            request.requestsAlternateRoutes = true
            request.transportType = .walking

            let directions = MKDirections(request: request)
            directions.calculate { response, error in
                guard let response = response else { return }

                let route = response.routes[0]
                uiView.addOverlay(route.polyline, level: .aboveRoads)
                uiView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }
    
    class WrappableMapView: MKMapView, MKMapViewDelegate {

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor.systemBlue
            renderer.lineWidth = 4.0
            return renderer
        }
    }
}


struct MyMapView_Previews: PreviewProvider {
    static var previews: some View {
        MyMapView(eventData: mockMyEventsData[0])
    }
}
