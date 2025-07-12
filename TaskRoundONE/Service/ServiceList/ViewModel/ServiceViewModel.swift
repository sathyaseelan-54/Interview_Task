//
//  ServiceViewModel.swift
//  TaskRoundONE
//
//  Created by Sathya on 12/07/25.
//

import Foundation
import Combine
import ServicesSampleData
import SwiftUI

class ServiceViewModel: ObservableObject {
    @Published var services: [Service] = []
    
    @Published var searchServices: [Service] = []
    @Published var sampleData: SampleData?
    @Published var searchInputText: String = ""
    
    @Published var cancellables: Set<AnyCancellable> = []
    @Published var statusForegroundColor: Color = .clear
    @Published var statusTextColor: Color = .clear
    
    init() {
        loadSampleData()
        searchData()
    }
    
    private func searchData() {
        $searchInputText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { [unowned self] text in
                guard !text.isEmpty else {
                    return self.services
                }
                
                return self.services.filter { service in
                    service.title.localizedCaseInsensitiveContains(text) ||
                    service.customerName.localizedCaseInsensitiveContains(text) ||
                    service.description.localizedCaseInsensitiveContains(text)
                }
            }
            .receive(on: RunLoop.main)
            .assign(to: &$searchServices)
    }
    
    func loadSampleData() {
        services = SampleData.generateServices(count: 15)
        searchServices = searchServices
    }
    
    func refreshData() async {
        try? await Task.sleep(nanoseconds: UInt64(0.2))
        await MainActor.run {
            self.searchServices = services.shuffled()
        }
    }
    
    func loadColorSetUp() {
        services.forEach { service in
            if service.status.rawValue == "Completed" {
                self.statusForegroundColor = .green
                self.statusTextColor = .green
            } else if service.status.rawValue == "In Progress" {
                self.statusForegroundColor = .blue
                self.statusTextColor = .blue
            }  else if service.status.rawValue == "Active" {
                self.statusForegroundColor = .orange
                self.statusTextColor = .orange
            } else if service.status.rawValue == "Urgent" {
                self.statusForegroundColor = .red
                self.statusTextColor = .red
            } else if service.status.rawValue == "Scheduled" {
                self.statusForegroundColor = .green
                self.statusTextColor = .green
            }
        }
    }
}
    
