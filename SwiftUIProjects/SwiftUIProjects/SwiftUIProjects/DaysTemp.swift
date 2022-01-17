//
//  DaysTemp.swift
//  SwiftUIProjects
//
//  Created by Dima on 17.01.22.
//

import SwiftUI

struct DaysTemp: View {
    let width: CGFloat
    let firstDay: String
    let secondDay: String
    let thirdDay: String
    let spacerWight: CGFloat
    let mainSpacerWight: CGFloat
    var body: some View {
        VStack() {
            DailyWeatherView(imageName: "sunnySmall", day: firstDay, temp: "12º", myWidth: width, spacerWidth: spacerWight, mainSpacerWight: mainSpacerWight)
            DailyWeatherView(imageName: "cloudySmall", day: secondDay, temp: "14º", myWidth: width, spacerWidth: spacerWight, mainSpacerWight: mainSpacerWight)
            DailyWeatherView(imageName: "rainySmall", day: thirdDay, temp: "17º", myWidth: width, spacerWidth: spacerWight, mainSpacerWight: mainSpacerWight)
        }
    }
}
