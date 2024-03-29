//
//  ScrollViewContent.swift
//  FlagAnimationSwiftUI
//
//  Created by Anton on 29.03.24.
//

import SwiftUI

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
            .padding(.bottom, 2)
        }
    }
}
