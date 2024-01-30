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
    @State private var gratitudeEmoji: String = ""
    @State private var gratitudeDate = Date()
    @State private var showAlert = false
    @State private var successMessage = ""
    
    let coreDataManager = CoreDataManager()
    
    var body: some View {
        NavigationView {
            ScrollView{
            ZStack {
                VStack {
                    Section(header: Text("Title")) {
                        TextField("Title", text: $gratitudeTitle)
                            .frame(height: 45)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                    }
                    Section(header: Text("Text")) {
                        TextEditor(text: $gratitudeText)
                            .frame(height: 200)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                    }
                    
                    Section(header: Text("How do you feel?")) {
                        Picker(selection: $gratitudeEmoji, label: Text("Emoji")) {
                            Text("😀").tag("😀")
                            Text("☺️").tag("☺️")
                            Text("🥰").tag("🥰")
                            Text("🥴").tag("🥴")
                            Text("😔").tag("😔")
                            Text("😇").tag("😇")
                            Text("🙁").tag("🙁")
                            Text("😣").tag("😣")
                            Text("😭").tag("😭")
                            Text("😠").tag("😠")
                            Text("😡").tag("😡")
                            Text("😱").tag("😱")
                            Text("😳").tag("😳")
                            Text("🥳").tag("🥳")
                            Text("😐").tag("😐")
                            Text("🤥").tag("🤥")
                            Text("🤐").tag("🤐")
                            
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .pickerStyle(MenuPickerStyle())
                        .padding()
                        
                        Text("Selected Emoji: \(gratitudeEmoji)")
                    }
                    
                    Section() {
                        DatePicker(selection: $gratitudeDate, label: { 
                            Text("Date")
                                .padding()
                        })
                            .frame(height: 45)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                    }
                    
                    Button {
                        if isInputValid() {
                            coreDataManager.saveData(title: gratitudeTitle, text: gratitudeText, emoji: gratitudeEmoji, date: gratitudeDate)
                            successMessage = "Successfully saved."
                            showAlert = true

                            // Burada text alanlarını sıfırla
                            gratitudeTitle = ""
                            gratitudeText = ""
                            gratitudeEmoji = ""
                        } else {
                            successMessage = "Failed to save. Please fill in all fields."
                            showAlert = true
                        }
                    } label: {
                        Text("Save")
                            .frame(width: 300, height: 40)
                            .background(Color.red)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text(successMessage),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    
                }
            }
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            .navigationTitle("Add Gratitudes")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    }
    
    private func isInputValid() -> Bool {
        return !gratitudeTitle.isEmpty && !gratitudeText.isEmpty && !gratitudeEmoji.isEmpty
    }
}

#Preview {
    AddGratitudeView()
}
