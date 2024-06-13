//
//  UIApplicationSwift.swift
//  MovieApp
//
//  Created by BS00880 on 4/6/24.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
