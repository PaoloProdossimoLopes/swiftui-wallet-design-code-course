//
//  HomeView.swift
//  swiftui-designcode-wallet
//
//  Created by Paolo Prodossimo Lopes on 14/05/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showProfile: Bool = false
    
    var body: some View {
        ZStack {
            
            Color.gray.opacity(0.2).ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: { showProfile.toggle() }) {
                        Image("Avatar").renderingMode(.original)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Spacer()
            }
            .padding(.top, 44)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: showProfile ? -450 : 0)
            .scaleEffect(showProfile ? 0.9 : 1)
            .rotation3DEffect(
                .init(degrees: showProfile ? -10 : .zero),
                axis: (x: 10, y: .zero, z: .zero))
            .edgesIgnoringSafeArea(.all)
            .animation(
                .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0),
                value: showProfile
            )
            
            MenuView()
                .offset(y: showProfile ? 0 : 600)
                .animation(
                    .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0),
                    value: showProfile
                )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
