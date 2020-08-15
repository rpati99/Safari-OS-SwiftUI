//
//  ContentView.swift
//  SafariTabsView
//
//  Created by MacBook Pro on 18/05/20.
//  Copyright © 2020 MacBook Pro. All rights reserved.
//

import SwiftUI

let gradientColors1 = [Color.blue, Color.red]
let gradientColors2 = [Color.yellow, Color.green]

let customGradient1 = Gradient(colors: gradientColors1)
let customGradient2 = Gradient(colors: gradientColors2)


struct TabsView: View {
    @State private var offset: CGSize = .zero
    
    var body: some View {
        let dragging = DragGesture()
        
            .onChanged{ self.offset = $0.translation}
            .onEnded{
                //moving card out of the screen
                if $0.translation.width < -100 {
                    self.offset = .init(width: -1000, height: 0)
                    print("left swipe")
                } else if $0.translation.width > 100 {
                    self.offset = .init(width: 1000, height: 0)
                    print("right swipe")
                } else {
                    self.offset = .zero
                }
        }
        
        //returning view body's content
        return NavigationView {
            VStack{
                ZStack{
                    Rectangle()
                        .fill(LinearGradient(gradient: customGradient1, startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 300, height: 500)
                    .cornerRadius(20)
                        .offset(x: -5,y: 5)
                    
                    Rectangle()
                        
                        .fill(LinearGradient(gradient: customGradient2, startPoint: .topLeading, endPoint: .bottomTrailing))
                        
                        .frame(width: 300, height: 500)
                        
                        .cornerRadius(20)
                        
                        .offset(x: offset.width, y: offset.height)
                        
                    .gesture(dragging)
                        
                        .animation(.spring())
                    
                }//end of ZStack
            }//end of VStack
            .navigationBarTitle("Swipe to remove tab")
        }//end of navigationView
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}

