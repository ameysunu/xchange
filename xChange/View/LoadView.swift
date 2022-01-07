//
//  LoadView.swift
//  xChange
//
//  Created by Amey Sunu on 30/12/21.
//

import SwiftUI
import Network

struct LoadView: View {
    
    @State var continuePressed: Bool = false
    @State var username: String = ""
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    @State var imageTapped: Bool = false
    @State var skipped: Bool = false
    
    @State var alertItem: AlertItem?
    
    var body: some View {
        VStack {
            Image("load")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
                .padding()
            Text("Getting Started")
                .font(.system(size: 35))
                .fontWeight(.heavy)
            Text("with xChange")
                .font(.system(size: 35))
                .fontWeight(.heavy)
                .foregroundColor(Color("#9296F0"))
            if continuePressed {
                HStack {
                    Text("Tell us something about you")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                        .padding(.top, 20)
                    Spacer()
                }
                if imageTapped {
                    Image(uiImage: self.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .edgesIgnoringSafeArea(.all)
                        .clipShape(Circle())
                        .padding()
                    
                } else {
                    Image(systemName: "person.crop.circle.badge.plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .edgesIgnoringSafeArea(.all)
                        .clipShape(Circle())
                        .foregroundColor(Color("#9296F0"))
                        .padding()
                }
                Button(action:{
                    self.isShowPhotoLibrary = true
                    self.imageTapped = true
                }) {
                    HStack {
                        Spacer()
                        Text("Upload a profile picture")
                        Spacer()
                    }
                }
                
                TextField("",text: $username)
                    .placeholder(when: username.isEmpty){
                        Text("Name").foregroundColor(Color("#9296F0"))
                    }
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 5.0)
                                .stroke(Color("#9296F0"), lineWidth: 1.0))
                    .padding(.bottom, 20)
                
            } else{
                
                LoadList(icon: "paperplane", textHead: "Send", textBody: "Send letters to people from different countries and learn a lot more about their culture and background.")
                    .padding(.top, 10)
                LoadList(icon: "person.fill.viewfinder", textHead: "Privacy", textBody: "Refrain from sending personal details and data to strangers.")
                    .padding(.top, 10)
            }
            Spacer()
            if continuePressed {
                Button(action:{
                    if image.size.width == 0 {
                        self.alertItem = AlertItem(title: Text("Error"), message: Text("There has been an error uploading the image."), dismissButton: .default(Text("Done")))
                    } else {
                        uploadImage(image: image, name: username){
                            (success) -> Void in
                            if success {
                                self.skipped.toggle()
                                //                                addName(name: username){
                                //                                    (success) -> Void in
                                //                                    if success {
                                //                                        self.skipped.toggle()
                                //                                    } else {
                                //                                        self.alertItem = AlertItem(title: Text("Error"), message: Text("Name cannot be empty."), dismissButton: .default(Text("Done")))
                                //                                    }
                                //                                }
                            } else {
                                self.alertItem = AlertItem(title: Text("Error"), message: Text("You have selected a very large image. Kindly select a lower image."), dismissButton: .default(Text("Done")))
                            }
                        }
                        
                    }
                }){
                    Text("Save")
                        .fontWeight(.medium)
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 0)
                        )
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("#9296F0")))
                }
                HStack{
                    Spacer()
                    NavigationLink(destination: HomeView().navigationBarHidden(true), isActive: $skipped){
                        Button(action:{
                            self.skipped.toggle()
                        }) {
                            Text("Skip for now")
                        }
                    }
                    Spacer()
                }
            } else {
                Button(action:{
                    self.continuePressed.toggle()
                }){
                    Text("Continue")
                        .fontWeight(.medium)
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 0)
                        )
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("#9296F0")))
                }
            }
            
        }
        .alert(item: $alertItem){ item in
            Alert(title: item.title, message: item.message, dismissButton: item.dismissButton)
        }
        .sheet(isPresented: $isShowPhotoLibrary){
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
        }
        .padding()
    }
}

struct LoadView_Previews: PreviewProvider {
    static var previews: some View {
        LoadView()
    }
}
