//
//  ServiceListItemView.swift
//  TaskRoundONE
//
//  Created by Sathya on 12/07/25.
//

import SwiftUI
import Combine
import ServicesSampleData

struct ServiceListItemView: View {
    @ObservedObject var servicViewModel: ServiceViewModel
    var service: Service
    let commonClass: CommonClass
    
    
    var body: some View {
        VStack {
            VStack(alignment: .leading,spacing: 16) {
                HStack {
                    Text(service.title)
                        .foregroundStyle(Color.primary)
                        .font(.system(size: 24, weight: .bold))
                        .lineLimit(1)
                    Spacer()
                
                    Label("", systemImage: "circlebadge.fill")
                        .foregroundStyle(service.priority.rawValue == "high" ? .orange : service.priority.rawValue == "Critical" ? .red : service.priority.rawValue == "Medium" ? .yellow : .green)
                        .padding(.trailing,0)
                }
                
                VStack(spacing: 10) {
                    HStack {
                        Image(systemName: "person.crop.circle.dashed")
                            .foregroundStyle(.blue)
                        Text(service.serviceNotes)
                            .foregroundStyle(Color.primary)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 15, weight: .regular))
                            .lineLimit(0)
                    }
                    HStack {
                        Image(systemName: "person.crop.circle.dashed")
                            .foregroundStyle(.blue)
                        Text(service.description)
                            .foregroundStyle(Color.primary)
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.leading)
                            .lineLimit(0)
                    }
                }
                HStack {
                    Rectangle()
                        .fill(servicViewModel.statusForegroundColor.opacity(0.1))
                        .frame(width: 100,height: 25)
                        .cornerRadius(12)
                        .overlay(
                            Text(service.status.rawValue)
                                .font(.system(size: 16))
                                .foregroundStyle(servicViewModel.statusTextColor)
                            )
                    Spacer()
                    Text(commonClass.formatDisplayDate(from: service.scheduledDate))
                        .foregroundStyle(Color.primary)
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.leading)
                        .lineLimit(0)
                }
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)
    }
}

#Preview {
//    ServiceListItemView()
}
