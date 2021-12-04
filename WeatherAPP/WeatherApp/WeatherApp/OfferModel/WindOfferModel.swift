//
//  WindOfferModel.swift
//  WeatherApp
//
//  Created by Dima on 22.11.21.
//

import Foundation

enum Direction: String, CaseIterable {
    case N, NNE, NE, ENE, E, ESE, SE, SSE, S, SSW, SW, WSW, W, WWNW, NW, NNW
}

class WindOfferModel: Codable {
    var speed: Double?
    var deg: Double?
}

extension WindOfferModel {
    var speedString: String{
        return"Wind: \(speed!) m/s"
    }
    var degString: String {
        let direction = Direction(deg!)
        return direction.rawValue
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
