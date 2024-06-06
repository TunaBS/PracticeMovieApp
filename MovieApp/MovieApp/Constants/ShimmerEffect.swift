//
//  ShimmerEffect.swift
//  MovieApp
//
//  Created by BS00880 on 6/6/24.
//


import Foundation
import SwiftUI
 
extension View {
    @ViewBuilder
    func shimmer (_ config: ShimmerConfig) -> some View {
        self
            .modifier(ShimmerEffectHelper(config: config))
    }
}
 
fileprivate struct ShimmerEffectHelper: ViewModifier {
    var config: ShimmerConfig
    @State private var moveTo: CGFloat = -0.7
    
    func body(content: Content) -> some View {
        content
            .hidden()
            .overlay {
                Rectangle()
                    .fill(config.tint)
                    .mask {
                        content
                    }
                    .overlay {
                        GeometryReader {
                            let size = $0.size
                            let extraOffset = (size.height / 2.5) + config.blur
                            
                            Rectangle()
                                .fill(config.tint)
                                .mask {
                                    Rectangle()
                                        .fill(.linearGradient(colors: [.white.opacity(0), config.highlight.opacity(config.highLightOpacity),.white.opacity(0)], startPoint: .leading, endPoint: .trailing))
                                        .blur(radius: config.blur)
                                        .offset(x: moveTo > 0 ? extraOffset : -extraOffset/*, y: moveTo > 0 ? extraOffset : -extraOffset*/)
                                        .offset(x: size.width * moveTo/*, y: size.width * moveTo*/)
                                        .rotationEffect(.init(degrees: 45))
                                        .frame(height: size.height * 2)
                                }
                                .blendMode(config.blendMode)
                        }
                        .mask {
                            content
                        }
                    }
                    .onAppear {
                        DispatchQueue.main.async {
                            moveTo = 0.7
                        }
                    }
                    .animation(.linear(duration: config.speed).repeatForever(autoreverses: false), value: moveTo)
            }
    }
}
 
struct ShimmerConfig {
    var tint: Color
    var highlight: Color
    var blur: CGFloat = 0
    var highLightOpacity: CGFloat = 1
    var speed: CGFloat = 1
    var blendMode: BlendMode = .normal
}
 
