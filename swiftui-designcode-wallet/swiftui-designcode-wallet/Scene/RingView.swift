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
    
    private let lineWidth: CGFloat = 5
    private var multiplier: CGFloat { width / 44 }
    
    var height: CGFloat = 44
    var width: CGFloat = 44
    var progress: CGFloat = 86
    
    @Binding var show: Bool
    
    var body: some View {
        
        let statePercentage = (1 - (progress / 100))
        
        ZStack {
            Circle()
                .stroke(
                    Color.black.opacity(0.1),
                    style: StrokeStyle(lineWidth: multiplier * lineWidth)
                )
                .frame(width: width, height: height)
            
            Circle()
                .trim(from: show ? statePercentage : 1, to: 1)
                .stroke(
                    LinearGradient(
                        colors: [strongPinkColor, darkPourpleColor],
                        startPoint: .topTrailing,
                        endPoint: .bottomLeading
                    ),
                    style: StrokeStyle(
                        lineWidth: multiplier * lineWidth, lineCap: .round,
                        lineJoin: .round, miterLimit: .infinity,
                        dash: [], dashPhase: .zero
                    )
                )
                .rotationEffect(.init(degrees: 90))
                .rotation3DEffect(.init(degrees: 180), axis: (x: 1, y: .zero, z: .zero))
                .frame(width: width, height: height)
                .shadow(
                    color: darkPourpleColor.opacity(0.1),
                    radius: 3,
                    x: .zero, y: 3 * multiplier
                )
            
            Text("\(Int(progress))%")
                .foregroundColor(.black)
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
                .onTapGesture { show.toggle() }
        }
        .animation(.easeInOut, value: show)
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
            .previewLayout(.sizeThatFits)
            .padding()
        
        RingView(show: .constant(false))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
