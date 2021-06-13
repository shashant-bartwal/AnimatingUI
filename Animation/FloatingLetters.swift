//
//  FloatingLetters.swift
//  Animation
//
//  Created by shashant on 13/06/21.
//

import SwiftUI

struct FloatingLetters: View {
    let letters = Array("Shashant Bartwal")
    
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(self.letters[num]))
                    .padding(5)
                    .font(.system(size: 10))
                    .frame(width: 25, height: 40, alignment: .center)
                    .background(enabled ?Color.blue:Color.red)
                   
                    .foregroundColor(enabled ? .black : .white)
                    .clipShape(Circle())
                    .offset(self.dragAmount)
                    .animation(Animation.default.delay(Double(num)/20))
                    
            }
        }
        .gesture(
            DragGesture()
                .onChanged {
                    self.dragAmount = $0.translation
                }
                .onEnded({ (val) in
                    self.dragAmount = .zero
                    self.enabled.toggle()
                }))
    }
}

struct FloatingLetters_Previews: PreviewProvider {
    static var previews: some View {
        FloatingLetters()
    }
}
