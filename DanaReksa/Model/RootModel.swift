//
//  RootModel.swift
//  DanaReksa
//
//  Created by Farhandika on 03/01/22.
//

import Foundation

struct Root<T:Codable>: Codable {
    let code: Int?
    let message, error: String?
    let data: T?
    let totalData: Int?

    enum CodingKeys: String, CodingKey {
        case code, message, error, data
        case totalData = "total_data"
    }
}

//MARK: Type
public enum investmentType:Int {
    case primary = 69
    case jenis = 0
    case imbalHasil = 1
    case danaKelolaan = 2
    case minPembelian = 3
    case jangkaWaktu = 4
    case tingkatResiko = 5
    case peluncuran = 6
    case stop = 7
    case itman = 8
    
    func getStringTitle() -> String {
        switch self {
        case .jenis:
            return "Jenis reksa dana"
        case .imbalHasil:
            return "Imbal hasil"
        case .danaKelolaan:
            return "Dana kelolaan"
        case .minPembelian:
            return "Min. pembelian"
        case .jangkaWaktu:
            return "Jangka waktu"
        case .tingkatResiko:
            return "Tingkat resiko"
        case .peluncuran:
            return "Peluncuran"
        case .stop :
            return " "
        case .itman:
            return " "
        case .primary:
            return " "
        }
    }
    
}

// MARK: - Datum
struct Datum: Codable {
    let code, name: String?
    let details: Details?
}

// MARK: - Details
struct Details: Codable {
    let category: String?
    let categoryID: Int?
    let currency, custody, inceptionDate: String?
    let imAvatar: String?
    let imName: String?
    let minBalance, minRedemption, minSubscription: Int?
    let nav, returnCurYear, returnFiveYear, returnFourYear: Double?
    let returnInceptionGrowth, returnOneDay, returnOneMonth, returnOneWeek: Double?
    let returnOneYear, returnSixMonth, returnThreeMonth, returnThreeYear: Double?
    let returnTwoYear: Double?
    let totalUnit: Int?
    let type: String?
    let typeID: Int?

    enum CodingKeys: String, CodingKey {
        case category
        case categoryID = "category_id"
        case currency, custody
        case inceptionDate = "inception_date"
        case imAvatar = "im_avatar"
        case imName = "im_name"
        case minBalance = "min_balance"
        case minRedemption = "min_redemption"
        case minSubscription = "min_subscription"
        case nav
        case returnCurYear = "return_cur_year"
        case returnFiveYear = "return_five_year"
        case returnFourYear = "return_four_year"
        case returnInceptionGrowth = "return_inception_growth"
        case returnOneDay = "return_one_day"
        case returnOneMonth = "return_one_month"
        case returnOneWeek = "return_one_week"
        case returnOneYear = "return_one_year"
        case returnSixMonth = "return_six_month"
        case returnThreeMonth = "return_three_month"
        case returnThreeYear = "return_three_year"
        case returnTwoYear = "return_two_year"
        case totalUnit = "total_unit"
        case type
        case typeID = "type_id"
    }
}


//MARK: CHARTS


struct Welcome: Codable {
    let code: Int?
    let message, error: String?
    let data: [String: DatumValue]?
    let totalData: Int?

    enum CodingKeys: String, CodingKey {
        case code, message, error, data
        case totalData = "total_data"
    }
}


// MARK: - DatumValue
struct DatumValue: Codable {
    let data: [DatumElement]?
    let error: String?
}

// MARK: - DatumElement
struct DatumElement: Codable {
    let date: String?
    let value, growth: Double?
}
