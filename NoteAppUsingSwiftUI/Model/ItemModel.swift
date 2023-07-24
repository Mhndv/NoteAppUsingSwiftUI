//
//  ItemModel.swift
//  NoteAppUsingSwiftUI
//
//  Created by Mohanned Alsahaf on 05/01/1445 AH.
//

import Foundation

//Immutable struct
struct ItemModel:Identifiable,Codable{//codable make the item convert to data and set it back
    let id:String // to make it enable for foreach
    let title:String
    let isCompleted:Bool
    
    
    init(id:String = UUID().uuidString,title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        //to make avaliable to add the id or make default id
    }
    
    func updateCompletion() ->ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)// to use the same id and title but to update the isCompleted
    }
}
