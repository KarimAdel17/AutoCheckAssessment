//
//  CarDetailsContainerView.swift
//  AutoCheckAssessment
//
//  Created by Karim on 11/10/2022.
//

import Foundation
import UIKit

class CarDetailsContainerView: BaseContainer {
    
    lazy var productName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "productName"
        return label
    }()
    
    lazy var carImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 2
        image.backgroundColor = #colorLiteral(red: 0.919017911, green: 0.9127629399, blue: 0.9609478116, alpha: 1)
        return image
    }()
    
    lazy var favouriteBTN: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var carInfoContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var carColorsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.itemSize = CGSize(width: 200, height: 50)
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        layout.minimumLineSpacing = 10
        
        collectionView.register(CarColorsCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(CarColorsCollectionViewCell.self))
        return collectionView
    }()
    
    lazy var modelsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fill
        return stack
    }()
    
    lazy var modelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Model:"
        label.textColor = #colorLiteral(red: 0.6404908299, green: 0.6344737411, blue: 0.6739020944, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    lazy var modelCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.itemSize = CGSize(width: 40, height: 40)
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        layout.minimumLineSpacing = 10
        
        collectionView.register(CarModelsCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(CarModelsCollectionViewCell.self))
        return collectionView
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.8512330651, green: 0.7446838021, blue: 0.4507794976, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.05882351846, green: 0.05882351846, blue: 0.05882351846, alpha: 1)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.text = "price"
        return label
    }()
    
    lazy var addToCartView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.backgroundColor = .white
        return view
    }()
    
    lazy var quantityStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    lazy var minusBTN: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("-", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.05882351846, green: 0.05882351846, blue: 0.05882351846, alpha: 1), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.05882351846, green: 0.05882351846, blue: 0.05882351846, alpha: 1)
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var quantity: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.05882351846, green: 0.05882351846, blue: 0.05882351846, alpha: 1)
        label.text = "01"
        return label
    }()
    
    lazy var plusBTN: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.05882351846, green: 0.05882351846, blue: 0.05882351846, alpha: 1), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.05882351846, green: 0.05882351846, blue: 0.05882351846, alpha: 1)
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var totalPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attrs1 = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.05882351846, green: 0.05882351846, blue: 0.05882351846, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)] as [NSAttributedString.Key: Any]
        let attributedString1 = NSMutableAttributedString(string: "Total:", attributes: attrs1)
        
        let attrs2 = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.05882351846, green: 0.05882351846, blue: 0.05882351846, alpha: 1), NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)] as [NSAttributedString.Key: Any]
        let attributedString2 = NSMutableAttributedString(string: " price", attributes: attrs2)
        
        attributedString1.append(attributedString2)
        label.attributedText = attributedString1
        return label
    }()
    
    lazy var addToCartBTN: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.05882351846, green: 0.05882351846, blue: 0.05882351846, alpha: 1)
        button.layer.cornerRadius = 15
        button.setTitle("Add to cart", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.8512330651, green: 0.7446838021, blue: 0.4507794976, alpha: 1), for: .normal)
        return button
    }()
    
    init() {
        super.init(state: .withBackButton)
        title = "Product"
        layoutUserInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUserInterface() {
        addSubViews()
        setupProductName()
        setupCarInfoContainer()
        setupCarImage()
        setupFavouriteBTN()
        setupCarColorsCollection()
        setupModelsStack()
        setupModelCollection()
        setupPriceLabel()
        setupAddToCartView()
        setupQuantityStack()
        setupMinusBTN()
        setupPlusBTN()
        setupTotalLabel()
        setupAddToCartBTN()
    }
    
    private func addSubViews() {
        addSubview(productName)
        addSubview(carInfoContainer)
        addSubview(addToCartView)
        
        carInfoContainer.addSubview(carImage)
        carInfoContainer.addSubview(favouriteBTN)
        carInfoContainer.addSubview(carColorsCollectionView)
        carInfoContainer.addSubview(modelsStack)
        
        modelsStack.addArrangedSubview(modelLabel)
        modelsStack.addArrangedSubview(modelCollectionView)
        modelsStack.addArrangedSubview(priceLabel)
        
        addToCartView.addSubview(quantityStack)
        addToCartView.addSubview(totalPrice)
        addToCartView.addSubview(addToCartBTN)
        
        quantityStack.addArrangedSubview(minusBTN)
        quantityStack.addArrangedSubview(quantity)
        quantityStack.addArrangedSubview(plusBTN)
    }

    private func setupProductName() {
        NSLayoutConstraint.activate([
            productName.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            productName.leadingAnchor.constraint(equalTo: backButton.leadingAnchor)
        ])
    }
    
    private func setupCarInfoContainer() {
        NSLayoutConstraint.activate([
            carInfoContainer.topAnchor.constraint(equalTo: self.productName.bottomAnchor, constant: 80),
            carInfoContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            carInfoContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            carInfoContainer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.37)
        ])
    }
    
    private func setupCarImage() {
        NSLayoutConstraint.activate([
            carImage.topAnchor.constraint(equalTo: carInfoContainer.topAnchor, constant: -60),
            carImage.leadingAnchor.constraint(equalTo: carInfoContainer.leadingAnchor, constant: 20),
            carImage.trailingAnchor.constraint(equalTo: carInfoContainer.trailingAnchor, constant: -20),
            carImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.26)
        ])
    }
    
    private func setupFavouriteBTN() {
        NSLayoutConstraint.activate([
            favouriteBTN.topAnchor.constraint(equalTo: self.carImage.topAnchor, constant: 15),
            favouriteBTN.trailingAnchor.constraint(equalTo: self.carImage.trailingAnchor, constant: -15),
            favouriteBTN.heightAnchor.constraint(equalToConstant: 20),
            favouriteBTN.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupCarColorsCollection() {
        NSLayoutConstraint.activate([
            carColorsCollectionView.topAnchor.constraint(equalTo: self.carImage.bottomAnchor, constant: 20),
            carColorsCollectionView.leadingAnchor.constraint(equalTo: self.carImage.leadingAnchor, constant: 15),
            carColorsCollectionView.trailingAnchor.constraint(equalTo: self.carImage.trailingAnchor, constant: -15),
            carColorsCollectionView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupModelsStack() {
        NSLayoutConstraint.activate([
            modelsStack.topAnchor.constraint(equalTo: self.carColorsCollectionView.bottomAnchor, constant: 20),
            modelsStack.leadingAnchor.constraint(equalTo: self.carImage.leadingAnchor, constant: 15),
            modelsStack.trailingAnchor.constraint(equalTo: self.carImage.trailingAnchor, constant: -15)
        ])
    }
    
    private func setupModelLabel() {
        NSLayoutConstraint.activate([
            modelLabel.topAnchor.constraint(equalTo: self.carColorsCollectionView.bottomAnchor, constant: 40),
            modelLabel.leadingAnchor.constraint(equalTo: self.carImage.leadingAnchor, constant: 15)
        ])
    }
    
    private func setupModelCollection() {
        NSLayoutConstraint.activate([
            modelCollectionView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func setupPriceLabel() {
        NSLayoutConstraint.activate([
            priceLabel.heightAnchor.constraint(equalToConstant: 45),
            priceLabel.widthAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    private func setupAddToCartView() {
        NSLayoutConstraint.activate([
            addToCartView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            addToCartView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            addToCartView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            addToCartView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15)
        ])
    }
    
    private func setupQuantityStack() {
        NSLayoutConstraint.activate([
            quantityStack.topAnchor.constraint(equalTo: addToCartView.topAnchor
                                               , constant: 30),
            quantityStack.leadingAnchor.constraint(equalTo: addToCartView.leadingAnchor, constant: 20),
            quantityStack.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupMinusBTN() {
        NSLayoutConstraint.activate([
            minusBTN.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupPlusBTN() {
        NSLayoutConstraint.activate([
            plusBTN.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupTotalLabel() {
        NSLayoutConstraint.activate([
            totalPrice.topAnchor.constraint(equalTo: addToCartView.topAnchor
                                               , constant: 30),
            totalPrice.trailingAnchor.constraint(equalTo: addToCartView.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupAddToCartBTN() {
        NSLayoutConstraint.activate([
            addToCartBTN.leadingAnchor.constraint(equalTo: addToCartView.leadingAnchor, constant: 20),
            addToCartBTN.trailingAnchor.constraint(equalTo: addToCartView.trailingAnchor, constant: -20),
            addToCartBTN.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            addToCartBTN.heightAnchor.constraint(equalTo: addToCartView.heightAnchor, multiplier: 0.37)
        ])
    }
}
