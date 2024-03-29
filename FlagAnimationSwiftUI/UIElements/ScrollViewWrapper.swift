//
//  ScrollViewWrapper.swift
//  FlagAnimationSwiftUI
//
//  Created by Anton on 29.03.24.
//

import SwiftUI

struct ScrollViewWrapper: UIViewRepresentable {
    @Binding var currentFlag: Int
    let flags: [String]

    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        let hosting = UIHostingController(rootView: ScrollViewContent(currentFlag: $currentFlag, flags: flags))
        hosting.view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(hosting.view)
        NSLayoutConstraint.activate([
            hosting.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hosting.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hosting.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hosting.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            hosting.view.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        return scrollView
    }

    func updateUIView(_ uiView: UIScrollView, context: Context) {
        let offset = CGFloat(currentFlag) * 100
        
        // Скорость прокрутки 1.5 секунды
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveLinear) {
            uiView.contentOffset = CGPoint(x: 0, y: offset)
        }
    }
}

