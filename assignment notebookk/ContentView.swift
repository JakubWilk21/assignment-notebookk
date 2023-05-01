//
//  ContentView.swift
//  assignment notebookk
//
//  Created by Jakub Wilk on 4/30/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddItemView = false
    var body: some View {
        NavigationView {
            List{
                ForEach(assignmentList.items) { item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.course)
                                .font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                }
                .onMove { indices, newOffset in
                }
                .onDelete { indexSet in
                }
            }
            .sheet(isPresented: $showingAddItemView, content: {
                AddAssignmentView(assignmentList: assignmentList)
            })
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                showingAddItemView = true}) {
                    Image(systemName: "plus")})
        }
    }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
       ContentView()
   }
}
struct AssignmentItem: Identifiable, Codable {
    var  id = UUID()
    var course: String
    var description: String
    var dueDate: Date
}
