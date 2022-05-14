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
    @State private var showCardView: Bool = false
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCardView ? 0.4 : 1)
                .offset(y: showCardView ? -200 : 0)
                .animation(.default, value: show)
                .animation(
                    Animation
                        .default
                        .delay(0.1),
                    value: showCardView)
                
            BackCardView(color: show ?  Color("card3") : Color("card4"))
                .frame(width: 300, height: 220)
                .shadow(radius: 20)
                .offset(x: .zero, y: show ? -400 : -40)
                .offset(y: showCardView ? -180 : 0)
                .scaleEffect(0.90)
                .offset(x: viewState.width, y: viewState.height)
                .rotationEffect(.init(degrees: show ? 0 : 10))
                .rotationEffect(.init(degrees: showCardView ? -10 : 0))
                .rotation3DEffect(.init(degrees: 10), axis: (x:10, y:  .zero, z:  .zero))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3), value: show)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: showCardView)
            
            BackCardView(color: show ?  Color("card4") : Color("card3"))
                .frame(width: 300, height: 220)
                .shadow(radius: 20)
                .offset(x: .zero, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCardView ? -140 : 0)
                .scaleEffect(0.95)
                .rotationEffect(.init(degrees: show ? 0 : 5))
                .rotationEffect(.init(degrees: showCardView ? -5 : 0))
                .rotation3DEffect(.init(degrees: 5), axis: (x:10, y:  .zero, z:  .zero))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3), value: show)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: showCardView)
            
            CardView()
                .frame(width: showCardView ? 375 : 340, height: 220)
                .background(.black)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: showCardView ? 30 : 20,
                        style: .continuous
                    )
                )
                .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCardView ? -100 : 0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: showCardView)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: viewState)
                .onTapGesture {
                    showCardView.toggle()
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
            
            BottomCardView()
                .offset(x: 0, y: showCardView ? 360 : 1000)
                .blur(radius: show ? 20 : 0)
                .animation(.default, value: show)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8), value: showCardView)
                //you can visit cubic-bezier.com to test your curves paramenter
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
    }
}

struct BackCardView: View {
    
    var color: Color = .blue
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(color)
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
    }
}
