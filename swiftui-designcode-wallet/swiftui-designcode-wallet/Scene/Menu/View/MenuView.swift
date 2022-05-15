//
//  MenuView.swift
//  swiftui-designcode-wallet
//
//  Created by Paolo Prodossimo Lopes on 14/05/22.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                Text("Meng - 28% complete")
                    .font(.caption)
                
                Color.white
                    .frame(width: 38, height: 6)
                    .clipShape(Capsule())
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(.black.opacity(0.08))
                    .clipShape(Capsule())
                    .padding()
                    .frame(width: 150, height: 24)
                    .background(.black.opacity(0.1))
                    .clipShape(Capsule())
                
                MenuRow(systemName: "gear", titleRow: "Account")
                MenuRow(systemName: "creditcard", titleRow: "billing")
                MenuRow(systemName: "person.crop.circle", titleRow: "Sign out")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(
                LinearGradient(
                    colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.8507653061, green: 0.8853369473, blue: 0.8673735119, alpha: 1))],
                    startPoint: .top, endPoint: .bottom
                )
            )
            .clipShape(RoundedRectangle.init(cornerRadius: 20, style: .continuous))
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
            .padding(.horizontal, 30)
            .overlay(
                Image("Avatar")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .offset(y: -150)
            )
        }
        .padding(.bottom, 30)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
    
    let systemName: String
    let titleRow: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: systemName)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 32, height: 32, alignment: .leading)
            
            Text(titleRow)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120, alignment: .leading)
        }
    }
}
