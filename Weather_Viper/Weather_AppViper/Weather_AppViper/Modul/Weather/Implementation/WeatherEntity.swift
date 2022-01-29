//
//  WeatherEntity.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

struct BasicEntity: Codable {
    var city: String
    var icon: String
    var temp: String
    var descript: String
    var humidity: String
    var wind: String
    let wind_deg: String
    var sunrise: String
    var sunset: String
    var feelsLike: String
    var pressure: String
    var visibility: String
    var hourly: [Hourly]
    var daily: [Daily]
}

struct BasicIconsEntity {
    var iconsDic: Dictionary = ["01d": "sun.max.fill",
                                "01n": "moon.stars.fill",
                                
                                "02d": "cloud.sun.fill",
                                "02n": "cloud.moon.fill",
                                
                                "03d": "cloud.fill",
                                "03n": "cloud.fill",
                                
                                "04d": "smoke.fill",
                                "04n": "smoke.fill",
                                
                                "09d": "cloud.drizzle.fill",
                                "09n": "cloud.drizzle.fill",
                                
                                "10d": "cloud.sun.rain.fill",
                                "10n": "cloud.moon.rain.fill",
                                
                                "11d": "cloud.bolt.rain.fill",
                                "11n": "cloud.bolt.rain.fill",
                                
                                "13d": "snowflake",
                                "13n": "snowflake",
                                
                                "50d": "cloud.fog.fill",
                                "50n": "cloud.fog.fill"]
}
