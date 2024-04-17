//
//  NoCardsLeftView.swift
//  FlipStacks
//
//  Created by Linus Warnatz on 17.03.24.
//

import SwiftUI

struct NoCardsLeftView: View {
    var body: some View {
        VStack {
            Text("ALL_REVIEWED")
            NavigationLink {
                AddView()
            } label: {
                Text("ADD_NEW_CARDS")
            }
            NavigationLink {
                CardListView()
            } label: {
                Text("LIST_CARDS")
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NoCardsLeftView()
        .padding()
}
