//
//  ContentView.swift
//  Calculator
//
//  Created by sudhanshu jha on 19/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.pink.opacity(0.6),.teal.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
            keyView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
