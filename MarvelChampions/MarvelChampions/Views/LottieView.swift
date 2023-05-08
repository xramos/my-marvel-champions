//
//  LottieView.swift
//  MarvelChampions
//
//  Created by Xavier Ramos on 8/5/23.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    func makeCoordinator() -> Coordinator {
        
        Coordinator(self)
    }
    
    var name: String = "spinner"
    
    var animationView = LottieAnimationView()

    class Coordinator: NSObject {
        var parent: LottieView
    
        init(_ animationView: LottieView) {
            self.parent = animationView
            super.init()
        }
    }

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        
        let view = UIView()
        animationView.animation = LottieAnimation.named(name, bundle: Bundle.main)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        animationView.play()
    }
}
