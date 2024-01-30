//
//  ContentView.swift
//  SukranGunluk
//
//  Created by MustafaCan on 26.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            MyGratitudeView()
                .tabItem {
                    Image(systemName: "lasso")
                    Text("My Gratitude")
                }
               
            AddGratitudeView()
                .tabItem {
                    Image(systemName: "plus")
                    Text("Add Gratitude")
                }
            
            infoGratitudeView()
                .tabItem {
                    Image(systemName: "info")
                    Text("Info")
                }
        }.accentColor(.red)
        
    }
}

#Preview {
    ContentView()
}
