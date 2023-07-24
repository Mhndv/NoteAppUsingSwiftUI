//
//  NoteAppUsingSwiftUIApp.swift
//  NoteAppUsingSwiftUI
//
//  Created by Mohanned Alsahaf on 30/12/1444 AH.
//

import SwiftUI

@main
struct NoteAppUsingSwiftUIApp: App {
    
    
    @StateObject var listViewModel:ListViewModel = ListViewModel() //to pass it to the listview
    
    var body: some Scene {
        WindowGroup {
            
            NavigationStack{ //To make the entire app in NavigationStack
                
                ListView()
            }
           
            .environmentObject(listViewModel)//now all the views have access to this viewmodel
          
        }
    }
}
