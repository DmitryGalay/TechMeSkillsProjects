//
//  HourlyCell.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import UIKit

import CoreLocation

class HourlyCell: UITableViewCell {
    
    static let identifier = "HourlyCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
                    
    var setTemp: ((WeekCell, IndexPath)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }
    
    private func configCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.register(WeekCell.self, forCellWithReuseIdentifier: WeekCell.identifier)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "HourlyCell", bundle: nil)
    }
}

//MARK: - Data source

extension HourlyCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeekCell.identifier, for: indexPath) as? WeekCell else { return UICollectionViewCell() }
        cell.configCell()
        cell.backgroundColor = UIColor(named: "ParamColor")
        cell.layer.cornerRadius = 25
//        cell.backgroundColor = .clear
        setTemp?(cell, indexPath)
        
        return cell
    }
}
//MARK: - Flow layout

extension HourlyCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: contentView.frame.width / 4.8, height: collectionView.frame.height - 30)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
}
