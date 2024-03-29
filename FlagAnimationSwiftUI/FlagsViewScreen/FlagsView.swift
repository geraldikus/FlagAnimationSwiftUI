//
//  ContentView.swift
//  FlagAnimationSwiftUI
//
//  Created by Anton on 28.03.24.
//

import SwiftUI

struct FlagsView: View {
    
    @StateObject var viewModel = FlagsViewModel(model: FlagsModel())

    var body: some View {
        VStack {
            Spacer(minLength: 0)
            
            ScrollViewWrapper(currentFlag: $viewModel.currentFlag, flags: viewModel.model.flags)
                .frame(width: 90, height: 90)
                .border(Color.black, width: 5)
            
            Spacer()
            
            Button(action: {
                viewModel.toggleScrollDirection()
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

#Preview {
    FlagsView()
}
