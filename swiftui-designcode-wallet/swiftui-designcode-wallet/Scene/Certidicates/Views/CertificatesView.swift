//
//  CertificatesView.swift
//  swiftui-designcode-wallet
//
//  Created by Paolo Prodossimo Lopes on 14/05/22.
//

import SwiftUI

struct CertificatesView: View {
    
    @State private var show: Bool = false
    @State private var viewState: CGSize = .zero
    @State private var showCardView: Bool = false
    @State private var bottomState: CGSize = .zero
    @State private var showFull: Bool = false
    
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
                .offset(y: bottomState.height)
                .blur(radius: show ? 20 : 0)
                .animation(.default, value: show)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8), value: bottomState)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8), value: showCardView)
                //you can visit cubic-bezier.com to test your curves paramenter
                .gesture(
                    DragGesture()
                        .onChanged { position in
                            bottomState = position.translation
                            if showFull {
                                bottomState.height += -300
                            }
                            
                            if bottomState.height < -300 {
                                bottomState.height = -300
                            }
                        }
                        .onEnded { _ in
                            if bottomState.height > 50 {
                                showCardView = false
                            }
                            
                            if (bottomState.height < -100 && !showFull) || (bottomState.height < -250 && showFull) {
                                bottomState.height = -300
                                showFull = true
                            } else {
                                bottomState = .zero
                                showFull = false
                            }
                        }
                )
        }
    }
}

struct CertificatesView_Previews: PreviewProvider {
    static var previews: some View {
        CertificatesView()
    }
}
