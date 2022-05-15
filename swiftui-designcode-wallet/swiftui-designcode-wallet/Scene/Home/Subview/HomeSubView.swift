//
//  HomeSubView.swift
//  swiftui-designcode-wallet
//
//  Created by Paolo Prodossimo Lopes on 15/05/22.
//

import SwiftUI

struct HomeSubView: View {
    
    @Binding var showProfile: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                
                Spacer()
                
                AvatarView(showProfile: $showProfile)
            }
            .padding(.horizontal)
            .padding(.top, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(0..<5) { _ in
                        SectionView()
                    }
                }
                .padding(.leading)
            }
            .shadow(color: Color("card1").opacity(0.3), radius: 20, x: 0, y: 20)
            
            
            Spacer()
        }
    }
}

struct HomeSubView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSubView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text("Prototype design in swiftUI")
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                
                Spacer()
                
                Image("Logo1")
            }
            
            Text("18 Section".uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image("Card1")
                .resizable()
                .scaledToFit()
                .frame(width: 210)
            
        }
        .padding([.top, .horizontal], 20)
        .frame(width: 275, height: 275)
        .background(Color("card1"))
        .cornerRadius(30)
//        .shadow(color: Color("card1").opacity(0.3), radius: 20, x: 0, y: 20)
    }
}
