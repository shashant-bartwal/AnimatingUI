//
//  AnimatingBinding.swift
//  Animation
//
//  Created by shashant on 12/06/21.
//

import SwiftUI

struct AnimatingBinding: View {
    
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
    print(animationAmount)
        return VStack {
            Stepper("Scale Amount", value: $animationAmount.animation(
                        Animation.easeInOut(duration: 1)
                            .repeatCount(3, autoreverses: true)), in: 1...10)
            
            Spacer()
            
            Button("Tap me"){
                self.animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct AnimatingBinding_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingBinding()
    }
}
