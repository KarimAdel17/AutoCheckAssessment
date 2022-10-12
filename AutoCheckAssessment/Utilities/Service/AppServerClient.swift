//
//  AppServerClient.swift
//  AutoCheckAssessment
//
//  Created by Karim on 10/10/2022.
//

import Foundation
import Alamofire
import RxSwift

class AppServerClient {
    
    enum GetDataFailureReason: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }

    func getBrands(page: Int) -> Observable<Brands> {
        return Observable.create { observer -> Disposable in
            AF.request("https://api-prod.autochek.africa/v1/inventory/make?popular=true&page=\(page)")
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            
                            observer.onError(response.error ?? GetDataFailureReason.notFound)
                            return
                        }
                        do {
                            let brands = try JSONDecoder().decode(Brands.self, from: data)
                            observer.onNext(brands)
                        } catch {
                            observer.onError(error)
                        }
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode,
                            let reason = GetDataFailureReason(rawValue: statusCode)
                        {
                            observer.onError(reason)
                        }
                        observer.onError(error)
                    }
            }

            return Disposables.create()
        }
    }
    
    func getCars(page: Int) -> Observable<Cars> {
        return Observable.create { observer -> Disposable in
            AF.request("https://api-prod.autochek.africa/v1/inventory/car/search?page=\(page)")
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            
                            observer.onError(response.error ?? GetDataFailureReason.notFound)
                            return
                        }
                        do {
                            let brands = try JSONDecoder().decode(Cars.self, from: data)
                            observer.onNext(brands)
                        } catch {
                            observer.onError(error)
                        }
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode,
                            let reason = GetDataFailureReason(rawValue: statusCode)
                        {
                            observer.onError(reason)
                        }
                        observer.onError(error)
                    }
            }

            return Disposables.create()
        }
    }
    
    func getCarDetails(carId: String) -> Observable<CarsData> {
        return Observable.create { observer -> Disposable in
            AF.request("https://api-prod.autochek.africa/v1/inventory/car/\(carId)")
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            
                            observer.onError(response.error ?? GetDataFailureReason.notFound)
                            return
                        }
                        do {
                            let brands = try JSONDecoder().decode(CarsData.self, from: data)
                            observer.onNext(brands)
                        } catch {
                            observer.onError(error)
                        }
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode,
                            let reason = GetDataFailureReason(rawValue: statusCode)
                        {
                            observer.onError(reason)
                        }
                        observer.onError(error)
                    }
            }

            return Disposables.create()
        }
    }

}
