//
//  ServicesListView.swift
//  TaskRoundONE
//
//  Created by Sathya on 12/07/25.
//

import SwiftUI

struct ServicesListView: View {
    @StateObject var serviceViewModel = ServiceViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search", text: $serviceViewModel.searchInputText)
                            .foregroundColor(.primary)
                        
                        Spacer()
                        
                        Image(systemName: "mic")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                    .padding(.horizontal)
                }
                Spacer()
                
                List {
                    ForEach(serviceViewModel.searchServices, id: \.id) { service in
                        NavigationLink(
                            destination: ServiceDetailView(
                                service: service
                            )
                                .transition(.opacity)
                        ) {
                            ServiceListItemView(
                                servicViewModel: serviceViewModel,
                                service: service,
                                commonClass: CommonClass()
                            )
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 6)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                    }
                }
                .listStyle(PlainListStyle())
                .refreshable {
                    serviceViewModel.loadSampleData()
                }
                .background(Color(.systemGroupedBackground))
                .animation(.easeInOut(duration: 0.25), value: serviceViewModel.services)
            }
            .navigationTitle("Services")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        .onAppear() {
            self.serviceViewModel.loadSampleData()
            self.serviceViewModel.loadColorSetUp()
        }
        
    }
    
}


#Preview {
    ServicesListView()
}
