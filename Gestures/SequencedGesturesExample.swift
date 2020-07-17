//
//  SequencedGestureExample.swift
//  Gestures
//
//  Created by Stewart Lynch on 2020-07-14.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct SequencedGesturesExample: View {
    @State private var isScaled = false
    @State private var position = CGSize.zero
    @State private var dragOffset = CGSize.zero
    var body: some View {
        let longPressGesture = LongPressGesture(minimumDuration: 0.5)
            .onEnded { (_) in
                self.isScaled = true
        }
        
        let dragGesture = DragGesture()
            .onChanged { (value) in
                self.dragOffset = value.translation
                self.isScaled = true
        }
        .onEnded { (value) in
            self.position.width += value.translation.width
            self.position.height += value.translation.height
            self.dragOffset = .zero
            self.isScaled = false
        }
        let longPressBeforeDragGesture = longPressGesture.sequenced(before: dragGesture)
        return Circle()
            .fill(Color.red)
            .shadow(radius: 20)
            .frame(width: 100)
            .scaleEffect(isScaled ? 1.5 : 1)
            .offset(x: position.width + dragOffset.width,
                    y: position.height + dragOffset.height)
            .animation(.easeInOut(duration: 0.5))
        .gesture(longPressBeforeDragGesture)
    }
}

struct SequencedGesturesExample_Previews: PreviewProvider {
    static var previews: some View {
        SequencedGesturesExample()
    }
}
