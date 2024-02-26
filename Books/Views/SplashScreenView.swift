//
//  SplashScreenView.swift
//  Books
//
//  Created by Sergey Basin on 26.02.2024.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var isLoaded: Bool
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Image(.overlaySplashScreen)
                .resizable()
                .scaledToFill()
            
            VStack {
                Text(verbatim: "Book App")
                    .font(.custom("Georgia", size: 52, relativeTo: .largeTitle))
                    .italic()
                    .bold()
                    .foregroundStyle(.splash)
                
                Text("Welcome to Book App")
                    .font(.title2)
                    .foregroundStyle(.white)
                
                ProgressView()
            }
        }
        .background {
            Image(.backgroundSplashScreen)
        }
        .onReceive(timer) { _ in
            isLoaded = true
        }
    }
}

#Preview {
    SplashScreenView(isLoaded: .constant(false))
}
