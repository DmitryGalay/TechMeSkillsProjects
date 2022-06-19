//
//  DataServiceImp.swift
//  Weather_Viper
//
//  Created by Dima on 26.01.22.
//

protocol DataServiceDelegate: AnyObject {
    
    func updateModel(with model: WeatherModel)
    func updateEntity(with entity: BasicEntity)
}

final class DataService {
    weak var delegate: DataServiceDelegate?
}
