//
//  ListViewModel.swift
//  NoteAppUsingSwiftUI
//
//  Created by Mohanned Alsahaf on 05/01/1445 AH.
//

import Foundation


class ListViewModel:ObservableObject{
    @Published var items:[ItemModel] = [] {
        didSet{//this will called anytime this array will change
            saveItems()
        }
    }
    
    let itemsKey:String = "items_list"
    
    init(){
        getItems()
    }
    
    
    func getItems(){
//        let newItems = [// get the items from the listview and append it to the array in this file
//            ItemModel(title: "I will go to the gym today", isCompleted: false),
//            ItemModel(title: "I will play video games 4pm", isCompleted: true),
//            ItemModel(title: "I will eat at 12pm", isCompleted: false)
//        ]
        //items.append(contentsOf: newItems)
        
        //return the data from userdefault
        guard//make guard for both statments
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        self.items = savedItems // items will be updated with the saved data
            
        
    }
    
    func deleteItem(indexset:IndexSet){
        items.remove(atOffsets: indexset)
    }
    
    func moveItem(from:IndexSet,to:Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    
    func addItem(title:String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item:ItemModel){
     
        if let index = items.firstIndex(where: {$0.id == item.id})//to find the item that have the same id ($0 is changing variable that looping the items)
        {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems(){
       //we have to convert the itemsmodel to jsondata to save it into userdefault
        
        if let encodedData = try? JSONEncoder().encode(items){//convert items to json
            
            
            UserDefaults.standard.set(encodedData, forKey: itemsKey)//saving
        }
        
    }
}
