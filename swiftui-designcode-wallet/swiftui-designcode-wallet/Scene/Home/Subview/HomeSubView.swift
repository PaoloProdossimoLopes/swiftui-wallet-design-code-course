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
                    ForEach(sectionData) { data in
                        SectionView(data: data)
                    }
                }
                .padding(.top)
                .padding(.leading)
                .padding(.bottom, 40)
            }
            
            
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
    
    var data: Section
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(data.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(data.logo)
            }
            
            Text(data.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            data.image
                .resizable()
                .scaledToFit()
                .blendMode(.hardLight)
                .frame(width: 210)
            
        }
        .padding([.top, .horizontal], 20)
        .frame(width: 275, height: 275)
        .background(data.color)
        .cornerRadius(30)
        .shadow(color: data.color.opacity(0.2), radius: 10, x: 10, y: 20)
    }
}

struct Section: Identifiable {
    let id = UUID()
    
    let title: String
    let text: String
    let logo: String
    let image: Image
    let color: Color
}

let sectionData = [
    Section(
        title: "Prototype design in swiftUI", text: "18 Section",
        logo: "Logo1", image: Image("Card1"), color: Color("card1")
    ),
    Section(
        title: "Prototype design in swiftUI", text: "18 Section",
        logo: "Logo1", image: Image("Card2"), color: Color("card2")
    ),
    Section(
        title: "Prototype design in swiftUI", text: "18 Section",
        logo: "Logo1", image: Image("Card3"), color: Color("card3")
    )
]
