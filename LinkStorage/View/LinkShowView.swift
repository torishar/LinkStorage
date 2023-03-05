//
//  LinkShowView.swift
//  LinkStorage
//
//  Created by Viktoriia Sharukhina on 05.03.2023.
//

import SwiftUI

struct LinkShowView: View {
    @State var url = ""
    @State var title = ""
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
               WebView(openUrl: $url)
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        

    }
}

struct LinkShowView_Previews: PreviewProvider {
    static var previews: some View {
        LinkShowView()
    }
}
