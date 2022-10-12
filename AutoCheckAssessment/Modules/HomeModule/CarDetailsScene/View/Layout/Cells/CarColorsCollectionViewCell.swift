//
//  CarColorsCollectionViewCell.swift
//  AutoCheckAssessment
//
//  Created by Karim on 11/10/2022.
//

import UIKit

class CarColorsCollectionViewCell: UICollectionViewCell {
    
    
    lazy var carImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = #colorLiteral(red: 0.953034699, green: 0.952799499, blue: 0.961560905, alpha: 1)
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
        layoutUserInterFace()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUserInterFace() {
        addSubViews()
        setupCarImage()
    }
    
    private func addSubViews() {
        contentView.addSubview(carImage)
    }
    
    private func setupCarImage() {
        NSLayoutConstraint.activate([
            carImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            carImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            carImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        ])
    }
}
