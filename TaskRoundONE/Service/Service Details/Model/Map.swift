//
//  Map.swift
//  TaskRoundONE
//
//  Created by Sathya on 12/07/25.
//

import Foundation
import MapKit


struct MapMarkerItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
