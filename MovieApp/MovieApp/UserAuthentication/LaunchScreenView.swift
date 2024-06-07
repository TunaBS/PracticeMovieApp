//
//  LaunchScreenView.swift
//  MovieApp
//
//  Created by BS00880 on 7/6/24.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        NavigationStack {
//            RegistrationNewAccountView()
            SignInView()
        }
    }
}

#Preview {
    LaunchScreenView()
}
