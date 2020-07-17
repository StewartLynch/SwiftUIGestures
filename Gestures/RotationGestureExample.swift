//
//  RotationGestureExample.swift
//  Gestures
//
//  Created by Stewart Lynch on 2020-06-16.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct RotationGestureExample: View {
    @State private var currentRotation = Angle.zero
    @GestureState private var twistAngle = Angle.zero
    @State private var currentMagnification: CGFloat = 1
    @GestureState private var pinchMagnification: CGFloat = 1
    var body: some View {
        Rectangle()
            .fill(Color.red)
            .shadow(radius: 20)
            .frame(width: 200, height: 200)
            .scaleEffect(currentMagnification * pinchMagnification)
            .rotationEffect(currentRotation + twistAngle)
            .gesture(RotationGesture()
                .updating($twistAngle, body: { (value, state, _) in
                    state = value
                })
                .onEnded{ self.currentRotation += $0 }
                .simultaneously(with: MagnificationGesture()
                    .updating($pinchMagnification, body: { (value, state, _) in
                        state = value
                    })
                    .onEnded{ self.currentMagnification *= $0 }
                )
        )
    }
}

struct RotationGestureExample_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureExample()
    }
}
