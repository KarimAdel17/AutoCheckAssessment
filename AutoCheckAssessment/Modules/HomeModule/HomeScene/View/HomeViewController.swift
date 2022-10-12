//
//  HomeViewController.swift
//  AutoCheckAssessment
//
//  Created by Karim on 09/10/2022.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController, UIScrollViewDelegate {
    
    private let viewModel = HomeViewModel()
    private let disposeBag = DisposeBag()
    
    lazy var containerView = HomeContainerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupCellTapHandling()
        viewModel.getBrands()
        viewModel.getCars()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        self.view = containerView
    }
    
    func bindViewModel() {
        viewModel.brandCells.bind(to: self.containerView.brandsCollectionView.rx.items) { collectionView, index, element in
            let indexPath = IndexPath(item: index, section: 0)
            switch element {
            case .normal(let viewModel):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(BrandsCollectionViewCell.self), for: indexPath) as? BrandsCollectionViewCell else {
                    return UICollectionViewCell()
                }
                cell.viewModel = viewModel
                return cell
            }
        }.disposed(by: disposeBag)
        
        containerView.brandsCollectionView.rx.didScroll.subscribe { [weak self] _ in
            guard let self = self else { return }
            let offSetY = self.containerView.brandsCollectionView.contentOffset.y
            let contentHeight = self.containerView.brandsCollectionView.contentSize.height

            if offSetY > (contentHeight - self.containerView.brandsCollectionView.frame.size.height - 100) {
                self.viewModel.fetchMoreBrandsData.onNext(())
            }
        }.disposed(by: disposeBag)
        
        viewModel.carCells.bind(to: self.containerView.carsCollectionView.rx.items) { collectionView, index, element in
            let indexPath = IndexPath(item: index, section: 0)
            switch element {
            case .normal(let viewModel):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(CarsCollectionViewCell.self), for: indexPath) as? CarsCollectionViewCell else {
                    return UICollectionViewCell()
                }
                cell.viewModel = viewModel
                return cell
            }
        }.disposed(by: disposeBag)
        
        containerView.carsCollectionView.rx.didScroll.subscribe { [weak self] _ in
            guard let self = self else { return }
            let offSetY = self.containerView.carsCollectionView.contentOffset.y
            let contentHeight = self.containerView.carsCollectionView.contentSize.height

            if offSetY > (contentHeight - self.containerView.carsCollectionView.frame.size.height - 100) {
                self.viewModel.fetchMoreCarsData.onNext(())
            }
        }.disposed(by: disposeBag)
    }
    
    private func setupCellTapHandling() {
        
        Observable.zip(containerView.carsCollectionView.rx.itemSelected, containerView.carsCollectionView.rx.modelSelected(BrandsCollectionViewCellType.self)).bind {
            [weak self] indexPath, model in
            guard let self = self else { return }
            
            switch model {
            case .normal(let carDetails):
                let vc = CarDetailsViewController()
                vc.carId = "\(carDetails.id ?? 0)"
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            
        }.disposed(by: disposeBag)
    }
}
