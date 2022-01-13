//
//  ListView.swift
//  xChange
//
//  Created by Amey Sunu on 10/01/22.
//

import SwiftUI

struct ListView: View {
    
    @State var title: String?
    @State var content: String?
    @State var expanded: Bool = true
    @State var letterIsPublic: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color("#9296F0"))
            VStack {
                HStack {
                    Text(title!)
                        .foregroundColor(.white)
                        .font(.title)
                    Spacer()
                    Button(action:{
                        self.expanded.toggle()
                    }){
                        if expanded{
                            Image(systemName: "chevron.up")
                                .foregroundColor(.white)
                        } else {
                            Image(systemName: "chevron.down")
                                .foregroundColor(.white)
                        }
                    }
                }
                if expanded {
                    HStack {
                        Text(content!)
                            .padding(.top, 2)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    if letterIsPublic {
                        HStack {
                            Spacer()
                            Button(action:{
                                
                            }){
                                Text("Reply")
                                    .foregroundColor(Color("#AA409D"))
                            }
                            
                            Button(action:{
                                
                            }){
                                Image(systemName: "hand.thumbsup")
                                    .foregroundColor(Color("#AA409D"))
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(title: "Test", content: "Hello!", letterIsPublic: false)
    }
}
