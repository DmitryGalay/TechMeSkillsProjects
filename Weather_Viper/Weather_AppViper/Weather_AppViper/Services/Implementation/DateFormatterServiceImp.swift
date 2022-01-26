//
//  DateFormatterServiceImp.swift
//  Weather_Viper
//
//  Created by Dima on 26.01.22.
//
import Foundation

final class DateFormatterServiceImp: DateFormatterService {
    func dateFormater(dt: Float, format: String) -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(dt))
        
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = format
        
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
}
