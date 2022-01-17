//
//  MainTemp.swift
//  SwiftUIProjects
//
//  Created by Dima on 17.01.22.
//

import SwiftUI

struct MainTemp: View {
    var body: some View {
        VStack {
            Text("13º")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .frame(width: 100, height: 30, alignment: .center)
            Text("Sunny")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(Color.orange)
                .frame(width: 100, height: 30, alignment: .center)
        }
    }
}

struct MainTemp_Previews: PreviewProvider {
    static var previews: some View {
        MainTemp()
    }
}
