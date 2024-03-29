//
//  ContentView.swift
//  FlagAnimationSwiftUI
//
//  Created by Anton on 28.03.24.
//

import SwiftUI
import UIKit

struct ContentView: View {
    let flags = ["🇺🇸", "🇬🇧", "🇨🇦", "🇦🇺", "🇮🇳", "🇯🇵", "🇩🇪", "🇧🇷", "🇿🇦", "🇨🇳", "🇷🇺"]
    @State private var currentFlag = 0

    var body: some View {
        VStack {
            Spacer(minLength: 0)
            
            ScrollViewWrapper(currentFlag: $currentFlag, flags: flags)
                .frame(width: 90, height: 90)
                .border(Color.black, width: 5)
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    currentFlag = flags.count - 1
                }
            }, label: {
                Text("Hit me!")
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .foregroundStyle(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            })
        }
        .padding()
    }
}

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
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveLinear) {
            uiView.contentOffset = CGPoint(x: 0, y: offset)
        }
    }
}


struct ScrollViewContent: View {
    @Binding var currentFlag: Int
    let flags: [String]

    var body: some View {
        VStack {
            ForEach(flags.indices, id: \.self) { index in
                Text(flags[index])
                    .font(.system(size: 60))
                    .padding(10)
                    .frame(width: 90, height: 90)
                    .id(index)
            }
        }
    }
}


#Preview {
    ContentView()
}
