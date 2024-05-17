//
//  ContentView.swift
//  MovieApp
//
//  Created by BS00880 on 17/5/24.
//

import SwiftUI



struct MovieData: Codable{
    struct Movie: Codable, Identifiable{
        let id: Int
        let title: String
    //    let rating: Float
    //    let runtime: Float
    }
    struct Data: Codable {
        let movies: [Movie]
    }
    let status: String
    let statusMessage: String
    let data: Data
    
}

struct ContentView: View {
    
    @State private var movieList: MovieData?
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    let movieData: MovieData
    let datal: Data
    let movie: [MovieData.Movie]
    
    var body: some View {
        Text(movieList?.status ?? "Status name not found")
        Text(movieList?.statusMessage ?? "Status msg not found")
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(movie) {
                        movieName in NavigationLink{
                            Text("details here")
                        } label: {
                            VStack {
                                //                            Image(movieName.image)
                                VStack {
                                    Text(movieName.title)
                                        .font(.headline)
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    
                }
            }
            .navigationTitle("Movie Mania")
            .preferredColorScheme(.dark)
        }
        .padding()
        .task {
            do {
                movieList = try await getList()
            } catch ErrorHand.invalidURL {
                print("invalid url")
            } catch ErrorHand.invalidData {
                print("invalid data")
            } catch ErrorHand.invalidResponse {
                print("invalid response")
            } catch {
                print("default")
            }
        }//end of task
    }//end of body
    
    
    func getList() async throws -> MovieData {
        let endpoint = "https://yts.mx/api/v2/list_movies.json?sort_by=popular&order_by=desc"
        
        guard let url = URL(string: endpoint) else {
            throw ErrorHand.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
//        print(String(data: data, encoding: .utf8))
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ErrorHand.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(MovieData.self, from: data)
            print(decodedData)
            return decodedData
        } catch {
            throw ErrorHand.invalidData
        }
    }
}

enum ErrorHand: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

#Preview {
    ContentView()
}
