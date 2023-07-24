//
//  ListRowView.swift
//  NoteAppUsingSwiftUI
//
//  Created by Mohanned Alsahaf on 01/01/1445 AH.
//

import SwiftUI

struct ListRowView: View {
    
    let item:ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? Color.green : Color.red)
            
            Text(item.title)
            Spacer()
            
        }
        .font(.title2)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "This is the first title", isCompleted: false)
    
    static var item2 = ItemModel(title: "This is the second title", isCompleted: true)
    
    static var previews: some View {
        Group{// to preview both
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        //.previewLayout(.sizeThatFits)// to see only the items
      
    }
}
