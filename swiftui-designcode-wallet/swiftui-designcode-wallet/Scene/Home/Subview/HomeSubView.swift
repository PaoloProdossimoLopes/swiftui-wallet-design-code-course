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
            
            Spacer()
        }
    }
}

struct HomeSubView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSubView(showProfile: .constant(false))
    }
}
