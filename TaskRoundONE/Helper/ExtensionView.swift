//
//  ExtensionView.swift
//  TaskRoundONE
//
//  Created by Sathya on 12/07/25.
//

import Foundation
import SwiftUI

extension View {
    func customSearchbarStyle() -> some View {
        modifier(CustomSearchBarView())
    }
}

