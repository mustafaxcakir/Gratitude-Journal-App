//
//  MyGratitudeView.swift
//  SukranGunluk
//
//  Created by MustafaCan on 26.01.2024.
//

import SwiftUI


extension GratitudeData{
    @objc dynamic var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy h:mm a"
        return dateFormatter.string(from: self.gratitudeDate ?? Date())
    }
}

struct GratitudeSection: Hashable {
    var date: String
    var gratitudes: [GratitudeData]
}

struct MyGratitudeView: View {
    
    @State private var gratitudes: [GratitudeData] = [GratitudeData]()
    let coreDataManager = CoreDataManager()

    var body: some View {
        NavigationView {
                List {
                    ForEach(sortedGratitudesByDate(), id: \.self) { section in
                        Section(header: Text(section.date)) {
                            ForEach(section.gratitudes, id: \.self) { gratitude in
                                VStack(alignment: .leading) {
                                    Text(gratitude.gratitudeTitle ?? "No Title")
                                        .font(.headline)
                                        .padding(.vertical, 10)
                                    
                                    Text(gratitude.gratitudeText ?? "No Text")
                                        .padding(.vertical, 20)
                                    
                                    HStack {
                                        Text(gratitude.gratitudeEmoji ?? "No Emoji")
                                            .padding(.vertical, 20)
                                        Text(gratitude.formattedDate)
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                            .onDelete { indexSet in
                                let deletedGratitudes = indexSet.map { section.gratitudes[$0] }
                                for deletedGratitude in deletedGratitudes {
                                    coreDataManager.deleteGratitude(gratitude: deletedGratitude)
                                }
                               
                                gratitudes = coreDataManager.getAllGratitude()
                            }
                        }
                    }
                }
                .onAppear {
                    gratitudes = coreDataManager.getAllGratitude()
                }
            .navigationTitle("My Gratitudes ✨")
        }
    }
    
    private func sortedGratitudesByDate() -> [GratitudeSection] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        
        let groupedGratitudes = Dictionary(grouping: gratitudes) { gratitude in
            return dateFormatter.string(from: gratitude.gratitudeDate ?? Date())
        }
        
        return groupedGratitudes.map { (date: $0.key, gratitudes: $0.value) }
            .sorted { $0.date > $1.date }
            .map { GratitudeSection(date: $0.date, gratitudes: $0.gratitudes) }
    }
}


#Preview {
    MyGratitudeView()
}
