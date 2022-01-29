//
//  ExtensionModel.swift
//  Weather_AppViper
//
//  Created by Dima on 29.01.22.
//

import Foundation


extension Current {
    var currentTemp: String{
        return"\(Int(temp)) ˚"
    }
    var currentWindSpeed: String {
        return" : \(Int(wind_speed)) m/s"
    }
    var currentHumidity: String {
        return" : \(Int(humidity))%"
    }
    var currentWindDeg: String {
        let direction = Direction(wind_deg)
              return direction.rawValue
    }
    var currentFeelLike: String {
        return"Feels like: \(Int(feels_like))°"
    }
    var currentVisibility: String {
        return" : \(Int(visibility) / 1000)km"
    }
    var currentPressure: String {
        let newPress = String(format: "%.1f", (pressure) / 1000)
        return" : \(newPress)kPa"
    }
    var weatherIcon: String {
        return weather.first?.icon ?? ""
    }
    var weatherDescr: String {
        return weather.first?.main ?? ""
    }
}

extension Direction: CustomStringConvertible  {
    init<D: BinaryFloatingPoint>(_ direction: D) {
        self =  Self.allCases[Int((direction.angle+11.25).truncatingRemainder(dividingBy: 360)/22.5)]
    }
    var description: String { rawValue.uppercased() }
}

extension BinaryFloatingPoint {
    var angle: Self {
        (truncatingRemainder(dividingBy: 360) + 360)
            .truncatingRemainder(dividingBy: 360)
    }
    var direction: Direction { .init(self) }
}
