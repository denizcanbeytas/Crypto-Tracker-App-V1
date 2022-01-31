//
//  Double.swift
//  IosProjectV1
//
//  Created by Deniz on 15.01.2022.
//

import Foundation


/// Converts a double into a Currency with 2 decimal places
/// ```
/// Convert 1234,5 to $1,234.5
/// ```

extension Double {
    //---
    private var currencyFormatter2: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
       // formatter.locale = .current // <- default value
       // formatter.currencyCode = "usd" // <- change currency
       // formatter.currencySymbol = "$" // <- change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.000"
    }
    //----
    /// Converts a double into a Currency with 2-6 decimal places
    /// ```
    /// Convert 1234,5 to $1,234.5
    /// ```
        private var currencyFormatter6: NumberFormatter{
            let formatter = NumberFormatter()
            formatter.usesGroupingSeparator = true
            formatter.numberStyle = .currency
           // formatter.locale = .current // <- default value
           // formatter.currencyCode = "usd" // <- change currency
           // formatter.currencySymbol = "$" // <- change currency symbol
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 6
            return formatter
        }
        func asCurrencyWith6Decimals() -> String {
            let number = NSNumber(value: self)
            return currencyFormatter6.string(from: number) ?? "$0.000"
        }
    //----
    
    func asNumberString() -> String{
        return String(format: "%2.f",self)
    }
    
    func asPercentString() -> String{
        return asNumberString() + "%"
    }
    
    // bu kısımları ne için yaptık:
    // double olan değerleri manual olarak değilde oromatik olarak string ifadeye çevirdik
    // Ayrıca, coin değerinin yazımını düzgün bir biçimde düzenledik
}
