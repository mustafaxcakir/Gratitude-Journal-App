//
//  GratitudeView.swift
//  SukranGunluk
//
//  Created by MustafaCan on 26.01.2024.
//

import SwiftUI

struct AddGratitudeView: View {
    
    @State private var gratitudeTitle = ""
    @State private var gratitudeText = ""
    @State private var gratitudeEmoji = ""
    @State private var gratitudeDate = Date()
    
    let coreDataManager = CoreDataManager()
    
    var body: some View {
        NavigationView{
            ZStack {
                Color(Color("gratitudeAddColor"))
                    .ignoresSafeArea()
                VStack{
                    Section(header: Text("Title")){
                        TextField("Title", text: $gratitudeTitle)
                            .frame(height: 45)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                    }
                    Section(header: Text("Text")) {
                        TextEditor(text: $gratitudeText)
                            .frame(height: 250)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                    }
                    
                    Section(header: Text("Emoji")) {
                        Picker(selection: $gratitudeEmoji, label: Text("Emoji")) {
                            Text("😀").tag(1)
                            Text("☺️").tag(2)
                            Text("🥰").tag(3)
                            Text("😊").tag(4)
                            Text("😇").tag(5)
                            Text("😌").tag(6)
                            Text("🙁").tag(7)
                            Text("🥴").tag(8)
                            Text("😞").tag(9)
                            Text("😣").tag(10)
                            Text("😠").tag(11)
                            Text("🤬").tag(12)
                        }
                        
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                    }
                    
                    Section(header: Text("Date")) {
                        DatePicker(selection: .constant(Date()), label: { Text("Date") })
                            .frame(height: 45)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                    }
                    
                    Button {
                        //buton görevi
                        coreDataManager.saveData(title: gratitudeTitle, text: gratitudeText, emoji: gratitudeEmoji, date: gratitudeDate)
                    } label: {
                        Text("Kaydet") 
                            .frame(width: 300, height: 40)
                            .background(Color.red)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                }
            }
        }
    }
}

#Preview {
    AddGratitudeView()
}
