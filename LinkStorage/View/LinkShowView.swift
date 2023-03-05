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
        NavigationView {
            VStack {
               WebView(openUrl: $url)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
            }
            //.navigationTitle(title)
        }
    }
}

struct LinkShowView_Previews: PreviewProvider {
    static var previews: some View {
        LinkShowView()
    }
}
