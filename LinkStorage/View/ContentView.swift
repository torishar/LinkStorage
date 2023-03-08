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
    
    @State var selectedLinkId: ObjectId? = nil
    
    var body: some View {
        ZStack{
            NavigationView {
                List {
                    ForEach(link, id: \.id) { item in
                        NavigationLink {
                            LinkShowView(url: item.url, title: item.title)
                        } label: {
                            Text(item.title)
                        }
                        .swipeActions(edge: .leading) {
                            Button(action: {
                                selectedLinkId = item._id
                                contentVM.addLinkViewIsOpen = true
                            }) {
                                Text("Edit")
                            }
                            .tint(.blue)
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
                AddLinkView(selectedLinkId: selectedLinkId)
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
