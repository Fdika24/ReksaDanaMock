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
    
    //todo: use enum above
    public func getTitleData(data:Datum,idx:Int) -> String? {
        switch idx {
        case 0:
            return data.details?.type
        case 1:
            return data.details?.typeID == 3 ? "\(data.details?.returnFiveYear ?? 0)% / thn" : "\(String(describing: data.details?.returnOneYear ?? 0))% / thn"
        case 2:
            let tot = Double(data.details?.totalUnit ?? 0)
            let nav = data.details?.nav ?? 0
            return (tot * nav).getNumType()
        case 3:
            return data.details?.minSubscription?.getNumType()
        case 4:
            return data.details?.typeID == 3 ? "5 Tahun" : "1 Tahun"
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
