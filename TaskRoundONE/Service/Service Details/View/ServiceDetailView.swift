//
//  ServiceDetailView.swift
//  TaskRoundONE
//
//  Created by Sathya on 12/07/25.
//

import SwiftUI
import ServicesSampleData
import Combine
import MapKit
struct ServiceDetailView: View {
    let common = CommonClass()
    var service: Service
    @State private var lat = Double.random(in: -90...90)
    @State private var lon = Double.random(in: -180...180)
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        NavigationStack {
            ScrollView {
                 Map(coordinateRegion: $region, annotationItems: [MapMarkerItem(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))]) { item in
                MapMarker(coordinate: item.coordinate, tint: .red)
            }
            .frame(height: 300)
            .cornerRadius(12)
            .padding()
            .onAppear {
                region.center = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            }
                VStack(alignment: .leading,spacing: 20) {
                    
                    HStack {
                        Text(service.title)
                            .foregroundStyle(Color.primary)
                            .font(.system(size: 24, weight: .bold))
                            .multilineTextAlignment(.leading)
                            .lineLimit(0)
                        Spacer()
                        Rectangle()
                            .fill(Color.gray.opacity(0.1))
                            .frame(width: 100,height: 25)
                            .cornerRadius(12)
                            .overlay(
                                Text(service.status.rawValue)
                                    .font(.system(size: 16))
                                    .foregroundStyle(.red)
                            )
                    }
                    ServiceDetialsFields(image: "person.crop.circle.dashed", title: "Customer", subtitle: service.customerName)
                    ServiceDetialsFields(image: "text.document", title: "Description", subtitle: service.description)
                    let input1 = service.scheduledDate
                    ServiceDetialsFields(image: "clock", title: "scheduled Time", subtitle: common.formatDisplayDate(from: input1))
                    ServiceDetialsFields(image: "location", title: "Location", subtitle: service.location)
                    ServiceDetialsFields(image: "message", title: "Service Notes", subtitle: service.serviceNotes)
                }
                .padding(.horizontal,25)
            }
            .navigationTitle(Text("Service Detail"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
//    ServiceDetailView()
}

struct ServiceDetialsFields: View {
    var image: String
    var title: String
    var subtitle: String
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: image)
                    .foregroundStyle(.blue)
                    .frame(width: 44, height: 44)
                VStack(alignment: .leading) {
                    Text(title)
                        .foregroundStyle(Color.primary)
                        .font(.system(size: 18, weight: .bold))
                        .multilineTextAlignment(.leading)
                    
                    Text(subtitle)
                        .foregroundStyle(Color.primary)
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.leading)
                }
            }
           
                
        }
    }
}
