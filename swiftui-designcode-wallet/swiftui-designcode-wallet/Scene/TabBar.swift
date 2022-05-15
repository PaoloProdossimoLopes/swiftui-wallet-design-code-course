//
//  TabBar.swift
//  swiftui-designcode-wallet
//
//  Created by Paolo Prodossimo Lopes on 15/05/22.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView().tabItem {
                    Text("Home")
                    Image(systemName: "play.circle.fill")
                }
            
            ContentView().tabItem {
                Text("Certificates")
                Image(systemName: "rectangle.stack.fill")
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar().previewDevice("iPhone 8")
            TabBar().previewDevice("iPhone 11 Pro Max")
        }
    }
}
