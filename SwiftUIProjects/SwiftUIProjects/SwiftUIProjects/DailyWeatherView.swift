//
//  DailyWeatherView.swift
//  SwiftUIProjects
//
//  Created by Dima on 17.01.22.
//

import SwiftUI

struct DailyWeatherView: View {
    let imageName: String
    let day: String
    let temp: String
    let myWidth: CGFloat
    let spacerWidth: CGFloat
    let mainSpacerWight: CGFloat
    
    var body: some View {
        HStack {
            Spacer().frame(width: mainSpacerWight )
            Image(imageName)
            Text(day)
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(Color.black)
                .frame(width: myWidth, height: 30, alignment: .leading)
            Spacer().frame(width: spacerWidth )
            Text(temp)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .frame(width: myWidth, height: 30, alignment: .leading)
        }
    }
}
