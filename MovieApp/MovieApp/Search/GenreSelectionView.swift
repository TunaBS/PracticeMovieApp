//
//  GenreSelectionView.swift
//  MovieApp
//
//  Created by BS00880 on 5/6/24.
//

import SwiftUI

struct GenreSelectionView: View {
    @Binding var selectedGenres: Set<Genre>
    
    var body: some View {
        HStack {
            ForEach(Genre.allCases, id: \.self) { genre in
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
        .padding()
    }
}

#Preview {
//    GenreSelectionView(selectedGenres: .constant(Set<Genre>()))
    GenreSelectionView(selectedGenres: .constant(Set<Genre>()))
}
