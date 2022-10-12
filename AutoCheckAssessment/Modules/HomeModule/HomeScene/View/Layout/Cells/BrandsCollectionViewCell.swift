//
//  BrandsCollectionViewCell.swift
//  AutoCheckAssessment
//
//  Created by Karim on 09/10/2022.
//

import UIKit
import Kingfisher

class BrandsCollectionViewCell: UICollectionViewCell {
    
    var viewModel: BrandsData? {
        didSet {
            bindViewModel()
        }
    }
    
    lazy var brandLogoContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.942163527, green: 0.9368793368, blue: 0.9501052499, alpha: 1)
        view.layer.cornerRadius = 25
        return view
    }()
    
    lazy var brandLogo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var brandName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.08047700673, green: 0.09342920035, blue: 0.1493816376, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 8)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.9686275125, green: 0.9686275125, blue: 0.9686276317, alpha: 1)
        layoutUserInterFace()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUserInterFace() {
        addSubViews()
        setupBrandLogoContainer()
        setupBrandLogo()
        setupBrandName()
    }
    
    private func addSubViews() {
        contentView.addSubview(brandLogoContainer)
        contentView.addSubview(brandName)
        
        brandLogoContainer.addSubview(brandLogo)
    }
    
    private func setupBrandLogoContainer() {
        NSLayoutConstraint.activate([
            brandLogoContainer.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            brandLogoContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            brandLogoContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            brandLogoContainer.heightAnchor.constraint(equalToConstant: 50),
            brandLogoContainer.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupBrandLogo() {
        NSLayoutConstraint.activate([
            brandLogo.centerXAnchor.constraint(equalTo: brandLogoContainer.centerXAnchor),
            brandLogo.centerYAnchor.constraint(equalTo: brandLogoContainer.centerYAnchor),
            brandLogo.heightAnchor.constraint(equalToConstant: 30),
            brandLogo.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setupBrandName() {
        NSLayoutConstraint.activate([
            brandName.topAnchor.constraint(equalTo: brandLogoContainer.bottomAnchor, constant: 5),
            brandName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            brandName.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5)
        ])
    }
    
    private func bindViewModel() {
        if let viewModel = viewModel {
            if let brandLogo = viewModel.imageURL {
                if let url = URL(string: brandLogo) {
                    self.brandLogo.kf.indicatorType = .activity
                    self.brandLogo.kf.setImage(with: url)
                }
            }
            brandName.text = viewModel.name
        }
    }
}
