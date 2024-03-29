//
//  FlagsViewModel.swift
//  FlagAnimationSwiftUI
//
//  Created by Anton on 29.03.24.
//

import SwiftUI

class FlagsViewModel: ObservableObject {
    
    @Published var model: FlagsModel
    @Published var currentFlag = 0
    @Published var scrollDown = true

    init(model: FlagsModel) {
        self.model = model
    }

    func toggleScrollDirection() {
        withAnimation {
            if scrollDown {
                currentFlag = model.flags.count - 1
            } else {
                currentFlag = 0
            }
            scrollDown.toggle()
        }
    }
}
