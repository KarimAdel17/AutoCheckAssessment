//
//  CarModelsCollectionViewCell.swift
//  AutoCheckAssessment
//
//  Created by Karim on 11/10/2022.
//

import UIKit

class CarModelsCollectionViewCell: UICollectionViewCell {
    
    lazy var modelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = #colorLiteral(red: 0.1361255944, green: 0.1445160806, blue: 0.1920819879, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.9491131902, green: 0.948877871, blue: 0.957639277, alpha: 1)
        layoutUserInterFace()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUserInterFace() {
        addSubViews()
        setupCarModel()
    }
    
    private func addSubViews() {
        contentView.addSubview(modelLabel)
    }
    
    private func setupCarModel() {
        NSLayoutConstraint.activate([
            modelLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            modelLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
