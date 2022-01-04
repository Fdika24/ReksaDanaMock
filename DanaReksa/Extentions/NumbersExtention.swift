//
//  NumbersExtention.swift
//  DanaReksa
//
//  Created by Farhandika on 04/01/22.
//

import Foundation

//MARK: Integer
let sejuta = 1000000
let seribu = 1000
let semilyar = 1000000000
let setrilyun = 1000000000000


extension Int {
    func getNumType() -> String {
        var ans = ""
        if self >= setrilyun {
            ans =  "\(String(format: "%.2f", Float(self)/Float(setrilyun))) Triliun"
        }
        else if self >= semilyar {
            ans =  "\(String(format: "%.2f", Float(self)/Float(semilyar))) Miliar"
        }
        else if self >= sejuta {
            ans =  "\(String(format: "%.1f", Float(self)/Float(sejuta))) Juta"
        }
        else if self >= seribu {
            ans = "\(self/seribu) Ribu"
        }
        else {
            ans = "\(self)"
        }
        return ans.replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
    }
}

//MARK: Float
//MARK: Double
extension Double {
    func getNumType() -> String {
        var ans = ""
        if self >= Double(setrilyun) {
            ans =  "\(String(format: "%.2f", Float(self)/Float(setrilyun))) Triliun"
        }
        else if self >= Double(semilyar) {
            ans =  "\(String(format: "%.2f", Float(self)/Float(semilyar))) Miliar"
        }
        else if self >= Double(sejuta) {
            ans =  "\(String(format: "%.1f", Float(self)/Float(sejuta))) Juta"
        }
        else if self >= Double(seribu) {
            ans = "\(self/Double(seribu)) Ribu"
        }
        else {
            ans = "\(self)"
        }
        return ans.replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
    }
}
