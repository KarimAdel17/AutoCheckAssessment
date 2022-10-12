//
//  CarDetailsViewController.swift
//  AutoCheckAssessment
//
//  Created by Karim on 11/10/2022.
//

import UIKit
import RxSwift
import RxCocoa

class CarDetailsViewController: UIViewController {

    private let viewModel = CarDetailsViewModel()
    private let disposeBag = DisposeBag()
    var carId: String?
    
    let containerView = CarDetailsContainerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.getCarDetails(carId: carId ?? "")
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        self.view = containerView
    }
    
    func bindViewModel() {
        viewModel.car.subscribe(
            onNext: { [weak self] car in
                self?.containerView.productName.text = car.name
                self?.containerView.priceLabel.text = car.price
                if let carImage = car.imageURL {
                    if let url = URL(string: carImage) {
                        self?.containerView.carImage.kf.indicatorType = .activity
                        self?.containerView.carImage.kf.setImage(with: url)
                    }
                }
        },
        onError: { _ in
                
            }
        )
        .disposed(by: disposeBag)
    }
}
