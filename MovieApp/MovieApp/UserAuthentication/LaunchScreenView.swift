//
//  LaunchScreenView.swift
//  MovieApp
//
//  Created by BS00880 on 7/6/24.
//

import SwiftUI

struct LaunchScreenView: View {
    @StateObject private var navigationState = NavigationState()
    @StateObject private var viewModel = SignInEmailViewModel()
        
    
    var body: some View {
        NavigationStack {
            //            RegistrationNewAccountView()
            //            SignInView()
            GeometryReader { geometry in
                
                Image("signUpBackGround")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    .opacity(0.2)
                
                ZStack(alignment: .bottom) {
                    // Background with curved shape (behind)
                    CurvedBackgroundShape()
                        .fill(Color.gray.opacity(0.9))
                        .frame(height: geometry.size.height / 1.3)
                        .offset(y: geometry.size.height * 1.1 )
                    
                    // Foreground with curved shape (front)
                    CurvedBackgroundShape()
                        .fill(Color.white.opacity(0.2))
                        .frame(height: geometry.size.height / 1.4)
                        .offset(y: geometry.size.height * 1.1)
                }
                .edgesIgnoringSafeArea(.bottom) // Extend to the edges of the screen
            }
        }
    }
}

#Preview {
    LaunchScreenView()
}
