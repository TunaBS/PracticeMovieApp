//
//  LaunchScreenView.swift
//  MovieApp
//
//  Created by BS00880 on 7/6/24.
//
//শুরু করুন
import SwiftUI

struct LaunchScreenView: View {

    
    @ObservedObject var languageManager = LanguageManager.shared
    @Binding var hasCompletedOnboarding: Bool
    
    var body: some View {
        GeometryReader { geometry in
            
            Image("backgroundLaunch")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(width: geometry.size.width, height: geometry.size.height/1.3, alignment: .center)
            
//            ZStack(alignment: .bottom) {
//                // Background with curved shape (behind)
//                CurvedBackgroundShape()
//                    .fill(Color.black)
//                    .frame(height: geometry.size.height / 1.3)
//                    .offset(y: geometry.size.height * 1.1 )
//                
//                // Foreground with curved shape (front)
//                CurvedBackgroundShape()
//                    .fill(Color.white.opacity(0.2))
//                    .frame(height: geometry.size.height / 1.4)
//                    .offset(y: geometry.size.height * 1.1)
//            }
//            .edgesIgnoringSafeArea(.bottom)
            
            VStack{
                Spacer()
                HStack {
                    Spacer()
                    Text("Movie Hub")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                HStack {
                    Spacer()
                    Text("Welcome to the show")
                        .foregroundColor(.white)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("take your popcorn and be sitted")
                        .foregroundColor(.white)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("watch your favourite movie or series")
                        .foregroundColor(.white)
                    Spacer()
                }
                
                
                Button(action: {
                    hasCompletedOnboarding = true
                }, label: {
                    Text("Get Started")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                })
                .padding()
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).fill(Color.blue))
                .padding()
            }
            .padding()

        }
    }
}

#Preview {
    LaunchScreenView(hasCompletedOnboarding: .constant(false))
}
