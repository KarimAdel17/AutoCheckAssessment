//
//  HomeViewModel.swift
//  AutoCheckAssessment
//
//  Created by Karim on 10/10/2022.
//

import Foundation
import RxSwift
import RxCocoa

enum BrandsCollectionViewCellType {
    case normal(cellViewModel: BrandsData)
}

enum CarsCollectionViewCellType {
    case normal(cellViewModel: CarsData)
}

class HomeViewModel {
    
    var brandCells: Observable<[BrandsCollectionViewCellType]> {
        return brandsCells.asObservable()
    }
    
    var carCells: Observable<[CarsCollectionViewCellType]> {
        return carsCells.asObservable()
    }
    
    let appServerClient: AppServerClient
    let disposeBag = DisposeBag()
    
    let fetchMoreBrandsData = PublishSubject<Void>()
    let fetchMoreCarsData = PublishSubject<Void>()
    
    private let brandsCells = BehaviorRelay<[BrandsCollectionViewCellType]>(value: [])
    
    private let carsCells = BehaviorRelay<[CarsCollectionViewCellType]>(value: [])
    
    private var brandsPageCounter = 1
    private var brandsmaxValue: Int?
    private var carsPageCounter = 1
    private var carsmaxValue: Int?
    
    init(appServerClient: AppServerClient = AppServerClient()) {
        self.appServerClient = appServerClient
    }
    
    func fetchMoreBrands() {
        brandsPageCounter += 1
        fetchMoreBrandsData.subscribe { [weak self] _ in
            guard let self = self else { return }
            self.getBrands()
        }.disposed(by: disposeBag)
    }
    
    func fetchMoreCars() {
        carsPageCounter += 1
        fetchMoreCarsData.subscribe { [weak self] _ in
            guard let self = self else { return }
            self.getCars()
        }.disposed(by: disposeBag)
    }
    
    func getBrands() {
        appServerClient
            .getBrands(page: brandsPageCounter)
            .subscribe(
                onNext: { [weak self] brands in
                    self?.brandsmaxValue = brands.pagination?.total
                    self?.brandsCells.accept(brands.brandsData?.compactMap { .normal(cellViewModel: BrandsData(brand: $0))} ?? [])
                },
                onError: { [weak self] error in
                    print(error)
                }
            )
            .disposed(by: disposeBag)
    }
    
    func getCars() {
        appServerClient.getCars(page: carsPageCounter)
            .subscribe(
                onNext: { [weak self] cars in
                    self?.carsmaxValue = cars.pagination?.total
                    self?.carsCells.accept(cars.carsData?.compactMap { .normal(cellViewModel: CarsData(car: $0))} ?? [])
                },
                onError: { [weak self] error in
                    print(error)
                }
            )
            .disposed(by: disposeBag)
    }
}
