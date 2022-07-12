//
//  ContentView.swift
//  firebase-tutorial

//  by Developer Light on 28.06.2022.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    let constantToNeverTouch = FirebaseApp.configure()
    
    @State var name = ""
    @State var email = ""

    @ObservedObject var model = ViewModel()
    var body: some View {
        VStack {
            List(model.list) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Text(item.email)
                    Button {
                        model.deleteData(userToDelete: item)
                    } label: {
                        Image(systemName: "minus.circle")
                            .foregroundColor(.red)
                    }
                }
            }
            VStack {
                HStack {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                }
                Button {
                    model.addData(name: name, email: email)
                } label: {
                    Text("Add User")
                }
            }
            .padding()
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
