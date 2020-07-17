//
//  ExclusiveGestureExample.swift
//  Gestures
//
//  Created by Stewart Lynch on 2020-07-14.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct ExclusiveGestureExample: View {
    @State private var colorIsGreen = false
    @State private var position = CGSize.zero
    @State private var dragOffset = CGSize.zero
    var body: some View {
        let longPressGesture = LongPressGesture(minimumDuration: 0.5)
            .onEnded { (_) in
                self.colorIsGreen = false
        }
        .onChanged { (_) in
            self.colorIsGreen = true
        }
        
        let dragGesture = DragGesture()
            .onChanged { (value) in
                self.dragOffset = value.translation
                self.colorIsGreen = false
        }
        .onEnded { (value) in
            self.position.width += value.translation.width
            self.position.height += value.translation.height
            self.dragOffset = .zero
            self.colorIsGreen = false
        }
        let longPressBeforeDragGesture = longPressGesture.exclusively(before: dragGesture)
        return Circle()
            .fill(colorIsGreen ? Color.green : Color.red)
            .shadow(radius: 20)
            .frame(width: 100)
            .offset(x: position.width + dragOffset.width,
                    y: position.height + dragOffset.height)
            .animation(.easeInOut(duration: 0.5))
        .gesture(longPressBeforeDragGesture)
    }
}

struct ExclusiveGestureExample_Previews: PreviewProvider {
    static var previews: some View {
        ExclusiveGestureExample()
    }
}
