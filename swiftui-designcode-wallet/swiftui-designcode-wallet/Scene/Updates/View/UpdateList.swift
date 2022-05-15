//
//  UpdateList.swift
//  swiftui-designcode-wallet
//
//  Created by Paolo Prodossimo Lopes on 15/05/22.
//

import SwiftUI

struct UpdateList: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(updateData) { update in
                        NavigationLink(destination: {
                            UpdateDetail(update: update)
                        }, label: {
                            HStack {
                                Image(update.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .background(.black)
                                    .cornerRadius(20)
                                    .padding(.trailing, 4)
                                
                                VStack(alignment: .leading, spacing: 8.0) {
                                    Text(update.title)
                                        .font(.system(size: 20, weight: .bold))
                                    
                                    Text(update.text)
                                        .font(.headline)
                                        .lineLimit(2)
                                        .foregroundColor(Color.gray)
                                    
                                    Text(update.date)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding(8)
                        })
                        
                    }
                    Spacer()
                }
            }
            .navigationTitle("Updates")
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable {
    let id = UUID()
    
    let image: String
    let title: String
    let text: String
    let date: String
}

let updateData = [
    Update(
        image: "Card1", title: "SwiftUI Advanced",
        text: "Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.",
        date: "JAN 1"
    ),
    Update(
        image: "Card2", title: "Webflow",
        text: "Design and animate a high converting landing page with advanced interactions, payments and CMS",
        date: "OCT 17"
    ),
    Update(
        image: "Card3", title: "ProtoPie",
        text: "Quickly prototype advanced animations and interactions for mobile and Web.",
        date: "AUG 27"
    ),
    Update(
        image: "Card4", title: "SwiftUI",
        text: "Learn how to code custom UIs, animations, gestures and components in Xcode 11",
        date: "JUNE 26"
    ),
    Update(
        image: "Card5", title: "Framer Playground",
        text: "Create powerful animations and interactions with the Framer X code editor",
        date: "JUN 11"
    )
]
