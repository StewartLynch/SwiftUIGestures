//
//  MagnificationGesture.swift
//  Gestures
//
//  Created by Stewart Lynch on 2020-06-16.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct MagnificationGestureExample: View {
    @State private var currentMagnification: CGFloat = 1
    @GestureState private var pinchMagnification: CGFloat = 1
    var body: some View {
        Circle()
            .fill(Color.red)
            .shadow(radius: 20)
            .frame(width: 100)
        .scaleEffect(currentMagnification * pinchMagnification)
        .gesture(MagnificationGesture()
            .updating($pinchMagnification, body: { (value, state, _) in
                state = value
            })
            .onEnded{ self.currentMagnification *= $0 }
        )
    }
}

struct MagnificationGestureExample_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureExample()
    }
}
