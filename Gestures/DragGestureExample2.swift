//
//  DragGestureExample3.swift
//  Gestures
//
//  Created by Stewart Lynch on 2020-06-15.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct DragGestureExample2: View {
    let topOffset: CGFloat = 80
    let bottomOffset: CGFloat = 120
    @State private var dragOffset: CGSize = .zero
    @State private var position: CGSize = .zero
    
     var body: some View {
           ZStack {
            Text("Hello World")
            Rectangle()
                .fill(Color.blue)
                .cornerRadius(30)
                .offset(y: topOffset + dragOffset.height + position.height)
                .gesture(DragGesture()
                    .onChanged{ self.dragOffset = $0.translation }
                    .onEnded({ (value) in
                        withAnimation(.spring()) {
                            if self.position == .zero {
                                // at the top
                                if value.translation.height < 0 || value.translation.height < 150 {
                                    self.position = .zero
                                } else {
                                    self.position.height = UIScreen.main.bounds.height - self.bottomOffset
                                }
                            } else {
                                // We are at the bottom
                                if value.translation.height > 0 || value.translation.height > -150 {
                                    self.position.height = UIScreen.main.bounds.height - self.bottomOffset
                                } else {
                                    self.position = .zero
                                }
                            }
                            self.dragOffset = .zero
                        }
                    })
            )
                .edgesIgnoringSafeArea(.all)
        }
       }
}

struct DragGestureExample2_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureExample2()
    }
}
