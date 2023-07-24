//
//  NoItemsView.swift
//  NoteAppUsingSwiftUI
//
//  Created by Mohanned Alsahaf on 05/01/1445 AH.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate:Bool = false
    
    let secondaryAccentColor = Color("SecondaryAccentColor")
    var body: some View {
        ScrollView{
            VStack(spacing: 15){
                Text("There are no Notes ☹️")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("If you want to keep track with your Todo list. Just click add button to add items on your Todo list! 🤩")
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Note! 📝")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(minHeight: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.accentColor : secondaryAccentColor)
                        .cornerRadius(25)
                        .padding(.top)
                }
                .padding(.horizontal,animate ? 0 : 10)
                .shadow(
                    color: animate ? Color.accentColor : secondaryAccentColor,
                    radius:animate ? 30:10,
                    x: 0.0,
                    y: animate ? 20:5
                        )
                
                .scaleEffect(animate ? 1.03 : 1.0)
                
                .offset(y: animate ? -5 : 0)

            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear {
                animation()
            }
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func animation(){
        guard !animate else {return} //to make sure animate is false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            withAnimation(
            
            Animation
                .easeInOut(duration: 1.5)
                .repeatForever()// to make it reapet forever
            
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group{
            NavigationStack{
                NoItemsView()
                    .navigationTitle("Todo List")
            }.preferredColorScheme(.dark)
            NavigationStack{
                NoItemsView()
                    .navigationTitle("Todo List")
            }
            .preferredColorScheme(.light)
        }
      
      
    }
}
