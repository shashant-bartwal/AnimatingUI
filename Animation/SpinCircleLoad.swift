//
//  SpinCircleLoad.swift
//  Animation
//
//  Created by shashant on 13/06/21.
//

import SwiftUI

struct SpinCircleLoad: View {
    @State private var offset: CGFloat = 0
    @State private var rotation: Double = 0
       
    @State private var backgroundSize: CGFloat = 0
    @State private var circleColor: Color = Color(red: 0.22, green: 0.24, blue: 0.31)
    @State private var showBackground = false
    
    let darkColor: Color = Color(red: 0.22, green: 0.24, blue: 0.31)
    
    var body: some View {
        ZStack {
            ZStack {
                           showBackground ? darkColor : Color.red
                       }.edgesIgnoringSafeArea(.all)
            
            Circle()
                            .frame(width: backgroundSize, height: backgroundSize, alignment: .center)
                            .foregroundColor(showBackground ? Color.red : darkColor)
            
            Circle()
                            .frame(width: 50, height: 50, alignment: .center)
                            .foregroundColor(circleColor)
                            .offset(x: 0, y: offset)
                            .rotationEffect(.degrees(rotation))
            
            Circle()
                           .frame(width: 50, height: 50, alignment: .center)
                           .foregroundColor(circleColor)
                           .offset(x: 0, y: offset)
                           .rotationEffect(.degrees(rotation))
                           .rotationEffect(.degrees(180))
                .rotationEffect(.degrees(rotation))
        }.onAppear() {
            animate()
        }
    }
    func animate() {
        Timer.scheduledTimer(withTimeInterval: 1.7, repeats: true) { _ in
                    withAnimation(Animation.easeInOut(duration: 0.2)) {
                        offset = -100
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation(Animation.easeInOut(duration: 0.5)) {
                            if showBackground {
                                rotation = 0
                            } else {
                                rotation = 360
                            }
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                        withAnimation(Animation.easeInOut(duration: 0.2)) {
                            offset = 0
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                        withAnimation(Animation.easeInOut(duration: 0.5)) {
                            if showBackground {
                                circleColor = darkColor
                            } else {
                                circleColor = .red
                            }
                            backgroundSize = UIScreen.main.bounds.height * 1.1
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
                        showBackground.toggle()
                        backgroundSize = 0
                    }
                }
    }
}

struct SpinCircleLoad_Previews: PreviewProvider {
    static var previews: some View {
        SpinCircleLoad()
    }
}
