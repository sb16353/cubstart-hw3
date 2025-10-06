//
//  ContentView.swift
//  checklist
//
//  Created by Andy Huang on 7/16/23.
//

import SwiftUI

struct HeaderView: View {
    @Binding var description: String
    var addTask: () -> Void
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    .padding(.trailing, 8)
                Text("Shrey Bhavaraju")
                    .font(.title)
                    .bold()
            }
            HStack{
                TextField("Enter a task: ", text: $description )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: addTask){
                    Text("Add Task")
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding(.top, 10)
        }
        .padding()
    }
}
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
