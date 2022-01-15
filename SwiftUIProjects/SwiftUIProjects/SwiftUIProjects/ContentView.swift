//
//  ContentView.swift
//  SwiftUIProjects
//
//  Created by Dima on 15.01.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(.red)
                .frame(width: 400, height: 400, alignment: .top)
            Rectangle()
                .fill(.red)
                .frame(width: 400, height: 100, alignment: .top)
            Rectangle()
                .fill(.red)
                .frame(width: 100, height: 100, alignment: .top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
