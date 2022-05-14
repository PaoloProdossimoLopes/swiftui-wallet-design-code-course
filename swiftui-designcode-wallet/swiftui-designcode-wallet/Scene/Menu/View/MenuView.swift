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
                MenuRow(systemName: "gear", titleRow: "Account")
                MenuRow(systemName: "creditcard", titleRow: "billing")
                MenuRow(systemName: "person.crop.circle", titleRow: "Sign out")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(.white)
            .clipShape(RoundedRectangle.init(cornerRadius: 20, style: .continuous))
            .shadow(radius: 30)
            .padding(.horizontal, 30)
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
