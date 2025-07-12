//
//  CustomSearchBarView.swift
//  TaskRoundONE
//
//  Created by Sathya on 12/07/25.
//

import SwiftUI

struct CustomSearchBarView: ViewModifier {
    
    var searchText: String = ""
    
    func body(content: Content) -> some View {
        content
        HStack {
            Image(systemName: "magnifyingglass")
//            TextField("Search", text: searchText)
            Spacer()
            Image(systemName: "microphone.fill")
        }
    }
}
