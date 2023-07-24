//
//  AddView.swift
//  NoteAppUsingSwiftUI
//
//  Created by Mohanned Alsahaf on 01/01/1445 AH.
//

import SwiftUI

struct AddView: View {
    
    
    @State var showErrorAlert:Bool = false
    
    @State var showSuccessAlert:Bool = false
    
    @State var textFieldText:String = ""
    
    @EnvironmentObject var listViewModel:ListViewModel
    
    @Environment(\.dismiss) var dismiss//to make it dissmis a view
    
    
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("Add a title: ")
                    .bold()
                    .padding(.top,25)
                    
                TextField("Add title here..", text: $textFieldText)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))//dynamic color for light and dark mode
                    .cornerRadius(25)
                Button {
                    saveButtonPressed()
                   
                    
                } label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(25)
                }.padding(.top)
                .alert(Text( "Note Added Seccussfully ✅"), isPresented: $showSuccessAlert) {
                        Button("Okay", role: .cancel) {
                        textFieldText = ""
                           dismiss()// to dismiss the view
                        }
                    }
                .alert(Text("Title must be 3 letters and above"), isPresented: $showErrorAlert) {
                    Button("Okay", role: .cancel) {
                        textFieldText = ""
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Add a Note ✏️")
  
    }
    
    
    func saveButtonPressed(){
        
        
        if textFieldText.count >= 3{
            showSuccessAlert = true
            listViewModel.addItem(title: textFieldText)
            
        }
        else
        {
            showErrorAlert = true
          
        }
            
    
    }
   
    
    
 
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
            
        NavigationStack{
            AddView()
        }
        .environmentObject(ListViewModel())
       
    }
}
