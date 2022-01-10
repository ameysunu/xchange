//
//  LetterSheet.swift
//  xChange
//
//  Created by Amey Sunu on 10/01/22.
//

import SwiftUI

struct LetterSheet: View {
    
    @State var title: String = ""
    @State var content: String = ""
    
    @State var alertItem: AlertItem?
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            Color("#9296F0")
                .ignoresSafeArea()
            VStack{
                HStack {
                    Text("Create a Letter")
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .font(.title)
                        .padding(.top, 20)
                    Spacer()
                }
                Image("lettersheet")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .padding()
                TextField("Title",text: $title)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 5.0)
                                .stroke(.white, lineWidth: 1.0))
                    .padding(.bottom, 20)
                HStack {
                    Text("Content")
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    Spacer()
                }
                ZStack {
                    TextEditor(text: $content)
                        .background(Color("#9296F0"))
                        .overlay(RoundedRectangle(cornerRadius: 5.0)
                                    .stroke(.white, lineWidth: 1.0))
                    Text(content).opacity(0).padding(.all, 8)
                }
                .padding(.bottom, 20)
                if content.isEmpty {
                    EmptyView()
                } else {
                    Button(action:{
                        addLetters(title: title, content: content){
                            (success) -> Void in
                            if success {
                                self.alertItem = AlertItem(title: Text("Success"), message: Text("Your letter has been successfully sent."), dismissButton: .default(Text("Done")))
                                title = ""
                                content = ""
                                
                            } else {
                                self.alertItem = AlertItem(title: Text("Error"), message: Text("There has been an error while sending your letter."), dismissButton: .default(Text("Done")))
                            }
                            
                        }
                    }){
                        Text("Send")
                            .fontWeight(.medium)
                            .padding(8)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color("#9296F0"))
                            .padding(10)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white, lineWidth: 0)
                            )
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                    }
                }
            }
            .padding()
            .alert(item: $alertItem){ item in
                Alert(title: item.title, message: item.message, dismissButton: item.dismissButton)
            }
        }
    }
}

struct LetterSheet_Previews: PreviewProvider {
    static var previews: some View {
        LetterSheet()
    }
}
