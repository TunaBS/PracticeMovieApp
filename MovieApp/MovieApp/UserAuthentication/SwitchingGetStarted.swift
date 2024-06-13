//
//  SwitchingGetStarted.swift
//  MovieApp
//
//  Created by BS00880 on 10/6/24.
//

import SwiftUI

struct SwitchingGetStarted: View {
    @EnvironmentObject var signingViewModel: AuthenticationManager
    
    var body: some View {
        Group {
            if signingViewModel.userFirebaseSession != nil {
                TabViewBelow()
            }
            else {
                SignInView()
            }
        }
    }
}

#Preview {
    SwitchingGetStarted()
}
