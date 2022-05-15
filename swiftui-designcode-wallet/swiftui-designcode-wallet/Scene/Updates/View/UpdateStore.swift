//
//  UpdateStore.swift
//  swiftui-designcode-wallet
//
//  Created by Paolo Prodossimo Lopes on 15/05/22.
//

import SwiftUI
import Combine

final class UpdateStore: ObservableObject {
    
    @Published var updates: [Update] = updateData
    
}
