//
//  NetworkManager.swift
//  DanaReksa
//
//  Created by Farhandika on 03/01/22.
//

import Foundation
import RxSwift

public enum dataType {
    case details
    case chart
    
    func getEndPoint() -> URL {
        switch self {
        case .details:
            return URL(string: "https://ae1cdb19-2532-46fa-9b8f-cce01702bb1e.mock.pstmn.io/takehometest/apps/compare/detail?productCodes=KI002MMCDANCAS00&productCodes=TP002EQCEQTCRS00&productCodes=NI002EQCDANSIE00")!
        case .chart:
            return URL(string: "https://ae1cdb19-2532-46fa-9b8f-cce01702bb1e.mock.pstmn.io/takehometest/apps/compare/chart?productCodes=KI002MMCDANCAS00&productCodes=TP002EQCEQTCRS00&productCodes=NI002EQCDANSIE00")!
        }
    }
}

class NetworkManager {
    
    func getData<T: Decodable>(type request:dataType) -> Observable<T> {
        return Observable<T>.create  { observer in
            let task = URLSession.shared.dataTask(with: request.getEndPoint()) { data, response, error in
                guard let data = data else {
                    observer.onError(NSError(domain: "", code: -1, userInfo: nil)) // need to learn more
                    return
                }
                // STATUS HANDLER
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    observer.onNext(decodedData)
                } catch {
                    observer.onError(error)
                }
            }
            task.resume()
            return Disposables.create{
                task.cancel()
            }
        }
    }
}
