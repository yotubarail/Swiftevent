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
            MapView(eventData: eventData)
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
    typealias UIViewType = MKMapView
    let eventData: myEvent!

    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
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
    }
}


struct MyMapView_Previews: PreviewProvider {
    static var previews: some View {
        MyMapView(eventData: mockMyEventsData[0])
    }
}
