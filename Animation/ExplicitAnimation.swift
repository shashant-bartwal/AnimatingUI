//
//  ExplicitAnimation.swift
//  Animation
//
//  Created by shashant on 13/06/21.
//

import SwiftUI

struct ExplicitAnimation: View {
    
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap me"){
//            self.animationAmount += 1
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                self.animationAmount += 360
            }
        }
        .padding(40)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(
            .degrees(animationAmount),
            axis: (x: 0.0, y: 10.0, z: 0.0)
            )
    }
}

struct ExplicitAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimation()
    }
}
