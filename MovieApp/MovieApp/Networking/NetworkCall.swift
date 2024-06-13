//
//  NetworkCall.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import Foundation



class NetworkCall {
    @MainActor
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
    
    func getMovieDetails(movieId: Int) async throws -> MovieDetail {
        let endpoint = "https://yts.mx/api/v2/movie_details.json?movie_id=\(movieId)&with_cast=true"
        
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
            let decodedData = try decoder.decode(MovieDetail.self, from: data)
            print(decodedData)
            return decodedData
        } catch {
            throw ErrorHand.invalidData
        }
    }
    
    func getSearchList(movieName: String) async throws -> MovieData {
        let endpoint = "https://yts.mx/api/v2/list_movies.json?query_term=\(movieName)"
        
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
    
    func getFilteredSearchList(movieName: String, sortCriteria: String, orderBy: String/*, genre: String*/) async throws -> MovieData {
        let endpoint = "https://yts.mx/api/v2/list_movies.json?query_term=\(movieName)&sort_by=\(sortCriteria)&order_by=\(orderBy)"
        
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
