//
//  Blur.swift
//  
//
//  Created by Jevon Mao on 2/10/21.
//

import SwiftUI

#if canImport(UIKit)
let screenSize = UIScreen.main.bounds
#elseif canImport(AppKit)
let screenSize = (NSScreen.main?.visibleFrame.size ?? CGSize(width: 100.0, height: 100.0))
#endif




#if canImport(UIKit)

@available(iOS 13.0, tvOS 13.0, *)
struct BlurNative: UIViewRepresentable {
#if !os(tvOS)
    var style: UIBlurEffect.Style = .systemMaterial
#else
    var style: UIBlurEffect.Style = .regular
#endif
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

#endif




@available(iOS 13.0, macOS 12.0, tvOS 13.0, *)
struct Blur: View {
    
    init() {
        
    }
    
    var body: some View {
        if #available(iOS 15.0, macOS 12.0, tvOS 13.0, *) {
            Rectangle()
                .fill(Material.ultraThin)
        } else {
#if canImport(UIKit)
            BlurNative()
            #else
            Rectangle()
                .fill(.gray.opacity(0.5))
            #endif
        }
        
    }
    
}
