//
//  LanguageManager.swift
//  MovieApp
//
//  Created by BS00880 on 6/6/24.
//

import Foundation
import SwiftUI
import Combine

class LanguageManager: ObservableObject {
    static let shared = LanguageManager()

    @Published var currentLanguage: Language = .english
    
    enum Language: String {
        case english = "en"
        case bengali = "bn"
    }
    
    private init() {
        // You can load the saved language from UserDefaults here if needed
    }

    func localizedString(forKey key: String) -> String {
        let path = Bundle.main.path(forResource: currentLanguage.rawValue, ofType: "lproj")!
        let bundle = Bundle(path: path)!
        return NSLocalizedString(key, bundle: bundle, comment: "")
    }

    func setLanguage(_ language: Language) {
        currentLanguage = language
        print("Language set to \(language.rawValue)")
        // Save the selected language to UserDefaults if needed
    }
}
