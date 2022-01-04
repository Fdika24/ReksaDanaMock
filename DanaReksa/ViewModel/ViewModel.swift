//
//  ViewModel.swift
//  DanaReksa
//
//  Created by Farhandika on 03/01/22.
//

import Foundation
import RxSwift

protocol ResultDelegate:AnyObject {
    func didFinnishFetchData()
    func didFinnishFetchChartData()
    func errorOnFetchData(error:Error)
    func errorOnfetchChartsData(error:Error)
}

final class ViewModelDelegate {
    private let networkManager = NetworkManager()
    weak var delegate:ResultDelegate?
    private let disposeBag = DisposeBag()
    public var imbalHasilData = [Datum]()
    public var chartsData = [String : DatumValue]()
    
    private func fetchImbalHasilData() -> Observable < Root<[Datum]> > {
        return networkManager.getData(type: .details)
    }
    
    private func fetchChartFromNetworkManager() -> Observable <Root<[String: DatumValue]>> {
        return networkManager.getData(type: .chart)
    }
    
    func fetchChartData() {
        fetchChartFromNetworkManager()
            .subscribe { result in
                if let data = result.data {
                    self.chartsData = data
                }
                self.delegate?.didFinnishFetchChartData()
            } onError: { error in
                self.delegate?.errorOnfetchChartsData(error: error)
            } onCompleted: {
                print("completed")
            } onDisposed: {
                print("disposed kenapa ya?")
            }
            .disposed(by: disposeBag)

    }
    
    func fetchData() {
        fetchImbalHasilData()
            .subscribe { result in
                if let data = result.data {
                    self.imbalHasilData += data
                }
                self.delegate?.didFinnishFetchData()
            } onError: { error in
                self.delegate?.errorOnFetchData(error: error)
            } onCompleted: {
                print("completed")
            } onDisposed: {
                print("disposed")
            }
            .disposed(by: disposeBag)

    }
    
    public func getTitleData(data:Datum,idx:Int) -> String? {
        switch idx {
        case 0:
            return data.details?.type
        case 1:
            return ""
        case 2:
            return data.details?.totalUnit?.getNumType()
        case 3:
            return data.details?.minSubscription?.getNumType()
        case 5 :
            return data.details?.typeID == 3 ? "Tinggi" : "Rendah"
        case 6 :
            let stringDate = data.details?.inceptionDate
            let olDateFormatter = DateFormatter()
            olDateFormatter.dateFormat = "yyyy-MM-dd"

            let oldDate = olDateFormatter.date(from: stringDate!)

            let convertDateFormatter = DateFormatter()
            convertDateFormatter.dateFormat = "dd MMM yyyy"

            return convertDateFormatter.string(from: oldDate!)
        default:
            return ""
        }
    }
}
