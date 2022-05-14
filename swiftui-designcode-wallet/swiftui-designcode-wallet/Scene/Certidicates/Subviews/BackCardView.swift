//
//  BackCardView.swift
//  swiftui-designcode-wallet
//
//  Created by Paolo Prodossimo Lopes on 14/05/22.
//

import SwiftUI

struct BackCardView: View {
    
    var color: Color = .blue
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(color)
    }
}

struct BackCardView_Previews: PreviewProvider {
    static var previews: some View {
        BackCardView()
    }
}
