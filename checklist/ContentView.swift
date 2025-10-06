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
                Image(systemName: "person.circle")
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

struct ChecklistView: View {
    @Binding var inProgressTasks: [String]
    @Binding var completedTasks: [String]
    var body: some View {
        List {
            Section(header: Text("In Progress").textCase(nil)) {
                ForEach(inProgressTasks, id: \.self) { task in
                    Button(action: {
                        if let index = inProgressTasks.firstIndex(of: task) {
                            completeTasks.append(task)
                            inProgressTasks.remove(at: index)
                        }
                    })
                    {
                        HStack {
                            Image(systemName: "circle")
                            Text(task)
                        }
                    }
                }
            }
        }
    }
}


struct ContentView: View {
    @State var description = ""
    @State var inProgressTasks: [String] = []
    @State var completedTasks: [String] = []
    var body: some View {
        VStack {
            HeaderView(description: $description, addTask: {
                inProgressTasks.append(description)
                description = ""
            })
            ChecklistView(inProgressTasks: $inProgressTasks, completedTasks: $completedTasks)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
