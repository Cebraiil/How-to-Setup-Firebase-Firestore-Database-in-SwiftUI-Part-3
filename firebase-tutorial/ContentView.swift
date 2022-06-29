//
//  ContentView.swift
//  firebase-tutorial
//
//  by Developer Light on 28.06.2022.
//

import SwiftUI
import Firebase

struct ContentView: View {
    let constantToNeverTouch = FirebaseApp.configure()
    
    @ObservedObject var model = ViewModel()
    var body: some View {
        VStack {
            List(model.list) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Text(item.email)
                }
            }
        }
    }
    init() {
        model.getData()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
