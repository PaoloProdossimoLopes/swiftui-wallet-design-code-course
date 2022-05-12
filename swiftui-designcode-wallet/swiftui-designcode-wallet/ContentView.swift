//
//  ContentView.swift
//  swiftui-designcode-wallet
//
//  Created by Paolo Prodossimo Lopes on 11/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var show: Bool = false
    @State private var viewState: CGSize = .zero
    
    var body: some View {
        ZStack {
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default, value: show)
            
            BottomCardView()
                .blur(radius: show ? 20 : 0)
                .animation(.default, value: show)
                
            BackCardView(color: show ?  Color("card3") : Color("card4"))
                .offset(x: .zero, y: show ? -400 : -40)
                .scaleEffect(0.90)
                .offset(x: viewState.width, y: viewState.height)
                .rotationEffect(.init(degrees: show ? 0 : 10))
                .rotation3DEffect(.init(degrees: 10), axis: (x:10, y:  .zero, z:  .zero))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3), value: show)
            
            BackCardView(color: show ?  Color("card4") : Color("card3"))
                .offset(x: .zero, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(.init(degrees: show ? 0 : 5))
                .rotation3DEffect(.init(degrees: 5), axis: (x:10, y:  .zero, z:  .zero))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3), value: show)
            
            CardView()
                .offset(x: viewState.width, y: viewState.height)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.1, dampingFraction: 0.6, blendDuration: 0), value: viewState)
                .onTapGesture {
                    show.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            viewState = value.translation
                            show = true
                        }
                        .onEnded { value in
                            viewState = .zero
                            show = false
                        }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("Certificate")
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo1")
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            Spacer()
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
        }
        .frame(width: 340, height: 220)
        .background(.black)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct BackCardView: View {
    
    var color: Color = .blue
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(color)
            .frame(width: 300, height: 220)
            .shadow(radius: 20)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            
            Image("Background1")
            
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack {
            Rectangle()
                .opacity(0.1)
                .frame(width: 40, height: 5)
                .clipShape(Capsule())
            
            Text("This certificate is proof taht Meng to has achieved the UI Design courdse with aproval from Design+Code instructor.")
                .multilineTextAlignment(.center)
                .font(.headline)
                .lineSpacing(4)
            
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(x: 0, y: 500)
    }
}
