//
//  ContentView.swift
//  LinkStorage
//
//  Created by Viktoriia Sharukhina on 05.03.2023.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @ObservedObject var contentVM = ContentViewModel()
    
    @ObservedResults (Link.self) var link
    
    var body: some View {
        ZStack{
            NavigationView {
                List {
                    ForEach(link, id: \.self) { item in
                        NavigationLink {
                            LinkShowView(url: item.url, title: item.title)
                        } label: {
                            Text(item.title)
                        }
                        
                    }
                    .onDelete { index in
                        $link.remove(atOffsets: index)
                    }
                }
                .navigationBarItems(trailing: addButton())
                .navigationTitle("My links")
                .navigationBarTitleDisplayMode(.large)
            }
            if contentVM.addLinkViewIsOpen {
                AddLinkView()
                    .environmentObject(contentVM)
            }
        }
    }
    
    
    @ViewBuilder
    func addButton() -> some View {
        Button {
            contentVM.addLinkViewIsOpen = true
        } label: {
            Image(systemName: "plus")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
