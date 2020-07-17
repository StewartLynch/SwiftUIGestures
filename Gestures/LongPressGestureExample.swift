//
//  LongPressGestureExample.swift
//  Gestures
//
//  Created by Stewart Lynch on 2020-06-15.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct LongPressGestureExample: View {
    @State private var isLongPressed = false
    @GestureState private var isLongPressing = false
    var body: some View {
        Circle()
            .fill(isLongPressing ? Color.green : Color.red)
            .shadow(radius: 20)
            .frame(width: 200)
            .scaleEffect(isLongPressed ? 0.5 : 1.0)
            .animation(.easeInOut(duration: 0.5))
//            .onLongPressGesture {
//                self.isLongPressed.toggle()
//        }
            .gesture(LongPressGesture(minimumDuration: 1.0, maximumDistance: 400)
                .onEnded({ (_) in
                    self.isLongPressed.toggle()
                })
                .updating($isLongPressing) { value, state, _ in
                    state = value
                }
        
        )
    }
}

struct LongPressGestureExample_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureExample()
    }
}
