//
//  AddLinkView.swift
//  LinkStorage
//
//  Created by Viktoriia Sharukhina on 05.03.2023.
//

import SwiftUI
import RealmSwift

struct AddLinkView: View {
    @State var linkTitle = ""
    @State var linkURL = ""
    
    @ObservedResults (Link.self) var link
    @EnvironmentObject var contentVM: ContentViewModel
    
    @State var selectedLinkId: ObjectId?
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextField("Link title", text: $linkTitle)
                        .padding(10)
                        .background(Color("Lavender"))
                        .cornerRadius(10)
                    TextField("Link url", text: $linkURL)
                        .padding(10)
                        .background(Color("Lavender"))
                        .cornerRadius(10)
                }
                
                Spacer()
                
                Button {
                    if selectedLinkId != nil {
                        $link.where = ({$0._id == selectedLinkId!})
                        $link.remove(link.first!)
                    }
                    
                    let link = Link()
                    link.title = linkTitle
                    link.url = linkURL
                    
                    $link.append(link)
                    
                    contentVM.addLinkViewIsOpen = false
                } label: {
                    Text("Save")
                }
                .frame(maxWidth: .infinity)
                .padding(10)
                .foregroundColor(.white)
                .background(Color("MediumPurple"))
                .clipShape(Capsule())
            }
            .navigationTitle("Add a new link")
            .navigationBarItems(trailing: closeAddLinkView())
            .padding()
            
        }
        .onAppear{
            if selectedLinkId != nil {
                $link.where = ({$0._id == selectedLinkId!})
                linkTitle = link.first?.title ?? ""
                linkURL = link.first?.url ?? ""
            }
        }
    }
    
    @ViewBuilder
    func closeAddLinkView() -> some View {
        Button {
            contentVM.addLinkViewIsOpen = false
        } label: {
            Image(systemName: "xmark")
        }
    }

    
}

struct AddLinkView_Previews: PreviewProvider {
    static var previews: some View {
        AddLinkView()
    }
}
