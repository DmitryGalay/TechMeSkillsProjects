//
//  DaysTemp.swift
//  SwiftUIProjects
//
//  Created by Dima on 17.01.22.
//

import SwiftUI

struct DaysTemp: View {
    let myWidth: CGFloat
    var body: some View {
        VStack {
            DailyWeatherView(imageName: "sunnySmall", day: "Friday", temp: "12", myWidth: myWidth)
            DailyWeatherView(imageName: "cloudySmall", day: "Saturday", temp: "Saturday", myWidth: myWidth)
            DailyWeatherView(imageName: "rainySmall", day: "Sunday", temp: "17º", myWidth: myWidth)
        }
    }
}


