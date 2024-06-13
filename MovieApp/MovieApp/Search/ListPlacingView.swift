//
//  ListPlacingView.swift
//  MovieApp
//
//  Created by BS00880 on 5/6/24.
//

import SwiftUI

struct ListPlacingView: View {
    @Binding var selectedGenres: Set<Genre>
    
    let genres: [Genre]
    let columns: Int
    
    var rows: [[Genre]] {
        Array(stride(from: 0, to: genres.count, by: columns)).map { startIndex in
            let endIndex = min(startIndex + columns, genres.count)
            return Array(genres[startIndex..<endIndex])
        }
    }
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row) { genre in
                        Button(action: {
                            if selectedGenres.contains(genre) {
                                selectedGenres.remove(genre)
                            } else {
                                selectedGenres.insert(genre)
                            }
                        }) {
                            Text(genre.rawValue)
                                .padding(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15.0)
                                        .stroke(selectedGenres.contains(genre) ? Color.blue : Color.primary)
                                )
                                .foregroundColor(selectedGenres.contains(genre) ? Color.blue : Color.primary)
                                .onTapGesture {
                                    if selectedGenres.contains(genre) {
                                        selectedGenres.remove(genre)
                                    } else {
                                        selectedGenres.insert(genre)
                                    }
                                }
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    ListPlacingView(selectedGenres: .constant([.action, .animation]), genres: Genre.allCases, columns: 4)
}
