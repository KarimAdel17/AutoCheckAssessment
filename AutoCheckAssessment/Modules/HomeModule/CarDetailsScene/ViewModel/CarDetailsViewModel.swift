//
//  CarDetailsViewModel.swift
//  AutoCheckAssessment
//
//  Created by Karim on 11/10/2022.
//

import Foundation
import RxSwift
import RxCocoa

class CarDetailsViewModel {
        
    var car: Observable<CarsData> {
        return carDetails.asObservable()
    }
    
    private let carDetails = PublishRelay<CarsData>()
    
    let appServerClient: AppServerClient
    let disposeBag = DisposeBag()
    
    init(appServerClient: AppServerClient = AppServerClient()) {
        self.appServerClient = appServerClient
    }
    
    func getCarDetails(carId: String) {
        
        appServerClient
            .getCarDetails(carId: carId)
            .subscribe(
                onNext: { [weak self] carDetails in
                    self?.carDetails.accept(carDetails)
                },
                onError: { [weak self] error in
                    print(error)
                }
            )
            .disposed(by: disposeBag)
    }
}
