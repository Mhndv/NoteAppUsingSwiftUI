//
//  ListView.swift
//  NoteAppUsingSwiftUI
//
//  Created by Mohanned Alsahaf on 01/01/1445 AH.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel:ListViewModel// to get all variables inside the listviewmodel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else{
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.easeIn){
                                    listViewModel.updateItem(item: item)//update the checkmark
                                }
                            }
                    }
                    .onDelete { IndexSet in
                        listViewModel.deleteItem(indexset: IndexSet)
                    }
                    .onMove { IndexSet, Int in
                        listViewModel.moveItem(from: IndexSet, to: Int)
                    }
                   
                }.listStyle(.insetGrouped)
            }
        }
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
        }
   
    
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ListView()
        }
        .environmentObject(ListViewModel())//to make the preview work with the model
        
    }
}


