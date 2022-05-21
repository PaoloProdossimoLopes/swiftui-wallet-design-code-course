//
//  RingView.swift
//  swiftui-designcode-wallet
//
//  Created by Paolo Prodossimo Lopes on 21/05/22.
//

import SwiftUI

struct RingView: View {
    
    private let darkPourpleColor: Color = .init(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
    private let strongPinkColor: Color = .init(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.black.opacity(0.1),
                    style: StrokeStyle(lineWidth: 5)
                )
                .frame(width: 44, height: 44)
            
            Circle()
                .trim(from: 0.5, to: 1)
                .stroke(
                    LinearGradient(
                        colors: [strongPinkColor, darkPourpleColor],
                        startPoint: .topTrailing,
                        endPoint: .bottomLeading
                    ),
                    style: StrokeStyle(
                        lineWidth: 5, lineCap: .round,
                        lineJoin: .round, miterLimit: .infinity,
                        dash: [], dashPhase: 0
                    )
                )
                .rotationEffect(.init(degrees: 90))
                .rotation3DEffect(.init(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: 44, height: 44)
                .shadow(
                    color: darkPourpleColor.opacity(0.1),
                    radius: 3,
                    x: 0, y: 3
            )
            
            Text("82%")
                .font(.caption)
                .fontWeight(.bold)
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}
