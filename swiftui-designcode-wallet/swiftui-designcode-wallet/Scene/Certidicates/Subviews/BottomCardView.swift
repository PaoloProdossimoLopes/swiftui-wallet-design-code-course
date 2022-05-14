//
//  BottomCardView.swift
//  swiftui-designcode-wallet
//
//  Created by Paolo Prodossimo Lopes on 14/05/22.
//

import SwiftUI

struct BottomCardView: View {
    var body: some View {
        VStack {
            Rectangle()
                .opacity(0.1)
                .frame(width: 40, height: 5)
                .clipShape(Capsule())
            
            Text("This certificate is proof taht Meng to has achieved the UI Design courdse with aproval from Design+Code instructor.")
                .multilineTextAlignment(.center)
                .font(.headline)
                .lineSpacing(4)
            
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
struct BottomCardView_Previews: PreviewProvider {
    static var previews: some View {
        BottomCardView()
    }
}
