//
//  NoCardsLeftView.swift
//  FlipStacks
//
//  Created by Linus Warnatz on 17.03.24.
//
//  This Source Code Form is subject to the terms of the Mozilla Public
//    License, v. 2.0. If a copy of the MPL was not distributed with this
//    file, You can obtain one at http://mozilla.org/MPL/2.0/.
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
