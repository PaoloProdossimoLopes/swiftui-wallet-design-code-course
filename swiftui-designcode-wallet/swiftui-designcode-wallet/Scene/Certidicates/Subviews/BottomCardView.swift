//
//  BottomCardView.swift
//  swiftui-designcode-wallet
//
//  Created by Paolo Prodossimo Lopes on 14/05/22.
//

import SwiftUI

struct BottomCardView: View {
    
    @Binding var show: Bool
    
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
            HStack(spacing: 20) {
                RingView.init(height: 88, width: 88, progress: 78, show: $show)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("SwiftUI")
                        .fontWeight(.bold)
                    
                    Text("12 of 12 sections completed\n10 hours spend so far")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .lineSpacing(4)
                }
                .padding(20)
                .background(.white)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.2), radius: 20, x: .zero, y: 10)
                
            }
            .padding(.top)
            
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
        BottomCardView(show: .constant(true))
    }
}
