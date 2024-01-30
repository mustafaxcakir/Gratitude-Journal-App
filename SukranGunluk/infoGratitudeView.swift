//
//  infoGratitudeView.swift
//  SukranGunluk
//
//  Created by MustafaCan on 26.01.2024.
//

import SwiftUI

struct infoGratitudeView: View {
    var body: some View {
        List {
            Section(header: Text("What is Gratitude Journal?").bold().foregroundColor(.red)) {
                Text("It is a tool where you think about and write down things you can be grateful for in your life. You don't have to write every day; it's a method to incorporate the feeling of gratitude into your life and develop a positive perspective.")
                    .padding(.vertical, 10)
            }
            
            Section(header: Text("Benefits:").bold().foregroundColor(.red)) {
                Text("✓ Less stress and better sleep\n\n✓ Reduced depression and anxiety\n\n✓ Stronger and longer relationships\n\n✓ Higher life satisfaction\n\n✓ Improved physical and mental health")
                    .padding(.vertical, 10)
            }
            
            Section(header: Text("How to Use:").bold().foregroundColor(.red)) {
                Text("✓ Write down 3-5 things you are grateful for each day.\n\n✓ Be detailed and specific.\n\n✓ Focus on your feelings.\n\n✓ Instead of just writing, also think about the things you are grateful for.\n\n✓ You can use the app or a journal if you prefer.")
                    .padding(.vertical, 10)
            }
        }
    }
}


#Preview {
    infoGratitudeView()
}
