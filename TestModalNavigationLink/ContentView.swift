//
//  ContentView.swift
//  TestModalNavigationLink
//
//  Created by Jake Nelson on 3/1/20.
//  Copyright © 2020 Jake Nelson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            FirstView()
                .tabItem {
                    VStack {
                        Image(systemName: "flame")
                        Text("First")
                    }
                }
                .tag(0)
            Text("Second View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "flame")
                        Text("Second")
                    }
                }
                .tag(1)
        }
    }
}

struct FirstView: View {
    
    @State var showModal: Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                Button(action: {
                    print("Show button was tapped")
                    self.showModal.toggle()
                }) {
                    Text("Show about info")
                    Image(systemName: "flame")
                }
            }
            .sheet(isPresented: $showModal,
                   content: {
                    AboutView(showModal: self.$showModal)
            })
        }
    }
    
    func done() {
        self.showModal.toggle()
    }
}

struct AboutView: View {
    
    @Binding var showModal: Bool
    
    var body: some View {
        NavigationView {
            VStack{
                Text("About view")
            }
            .navigationBarTitle(Text("About info"))
            .navigationBarItems(trailing:
                HStack{
                    Spacer()
                    Button("Done") {
                        self.done()
                    }
                }
            )
        }
    }
    
    func done() {
        self.showModal.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
