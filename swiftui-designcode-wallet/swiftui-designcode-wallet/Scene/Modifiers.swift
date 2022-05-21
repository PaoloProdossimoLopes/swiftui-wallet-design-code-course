//
//  Modifiers.swift
//  swiftui-designcode-wallet
//
//  Created by Paolo Prodossimo Lopes on 21/05/22.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 10)
            .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

struct FontModifier: ViewModifier {
    
    var style: Font.TextStyle = .body
    
    func body(content: Content) -> some View {
        content
            .font(.system(.body, design: .rounded))
    }
}
