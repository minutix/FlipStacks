//
//  CardDetailView.swift
//  FlipStacks
//
//  Created by Linus Warnatz on 16.03.24.
//

import SwiftUI

struct CardDetailView: View {
    var item: Card
    @State var showSolution: Bool
    var body: some View {
        VStack {
            Text(item.frontSide)
            if showSolution == true {
                Divider()
                Text(item.backSide)
            }
            
            Button {
                showSolution.toggle()
            } label: {
                Text("BUTTON.SHOW_SOLUTION")
            }
        }
    }
}

#Preview {
    CardDetailView(item: Card(frontSide: "Hello!", backSide: "¡Hola!"), showSolution: false)
        .padding()
}
#Preview {
    CardDetailView(item: Card(frontSide: "Hello!", backSide: "¡Hola!"), showSolution: true)
        .padding()
}
