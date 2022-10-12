//
//  HomeContainerView.swift
//  AutoCheckAssessment
//
//  Created by Karim on 09/10/2022.
//

import Foundation
import UIKit

class HomeContainerView: BaseContainer {
    
    lazy var filterStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 7
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.tintColor = #colorLiteral(red: 0.6784313725, green: 0.6784313725, blue: 0.6784313725, alpha: 0.09)
        searchBar.barTintColor = .clear
        searchBar.searchBarStyle = .default
        searchBar.backgroundImage = UIImage()
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.textColor = .black
            searchBar.searchTextField.backgroundColor = #colorLiteral(red: 0.6784313725, green: 0.6784313725, blue: 0.6784313725, alpha: 0.09)
        } else {
            // Fallback on earlier versions
        }
        searchBar.layer.cornerRadius = 5
        searchBar.placeholder = "Search"
        searchBar.heightAnchor.constraint(equalToConstant: 39).isActive = true
        return searchBar
    }()
    
    lazy var filterBTN: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "filter"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.05882352941, green: 0.07450980392, blue: 0.1529411765, alpha: 1)
        button.tintColor = #colorLiteral(red: 0.05882352941, green: 0.07450980392, blue: 0.1529411765, alpha: 1)
        button.layer.cornerRadius = 5
        button.heightAnchor.constraint(equalToConstant: 39).isActive = true
        button.widthAnchor.constraint(equalToConstant: 39).isActive = true
        return button
    }()
    
    lazy var brandsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = #colorLiteral(red: 0.9686275125, green: 0.9686275125, blue: 0.9686276317, alpha: 1)
        collectionView.showsHorizontalScrollIndicator = false
        layout.minimumLineSpacing = 10
        
        collectionView.register(BrandsCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(BrandsCollectionViewCell.self))
        return collectionView
    }()
    
    lazy var carsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        let size = (UIScreen.main.bounds.width - CGFloat(30))
        layout.itemSize = CGSize(width: size, height: 340)
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = #colorLiteral(red: 0.9686275125, green: 0.9686275125, blue: 0.9686276317, alpha: 1)
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(CarsCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(CarsCollectionViewCell.self))
        return collectionView
    }()
    
    init() {
        
        super.init(state: .withoutNavButton)
        title = "Explore"
        layoutUserInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUserInterface() {
        addSubViews()
        setupFilterStack()
//        setupBannerImage()
        setupBrandsCollectionView()
        setupCarsCollectionView()
    }
    
    private func addSubViews() {
        addSubview(filterStack)
        addSubview(brandsCollectionView)
        addSubview(carsCollectionView)
        
        filterStack.addArrangedSubview(searchBar)
        filterStack.addArrangedSubview(filterBTN)
    }
    
    private func setupFilterStack() {
        NSLayoutConstraint.activate([
            filterStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            filterStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 21),
            filterStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -21)
        ])
    }
    
    private func setupBrandsCollectionView() {
        NSLayoutConstraint.activate([
            brandsCollectionView.topAnchor.constraint(equalTo: filterStack.bottomAnchor, constant: 20),
            brandsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            brandsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            brandsCollectionView.heightAnchor.constraint(equalToConstant: 85)
        ])
    }
    
    private func setupCarsCollectionView() {
        NSLayoutConstraint.activate([
            carsCollectionView.topAnchor.constraint(equalTo: brandsCollectionView.bottomAnchor, constant: 30),
            carsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            carsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            carsCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
