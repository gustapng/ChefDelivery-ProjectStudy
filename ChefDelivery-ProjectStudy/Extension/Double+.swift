//
//  Double+.swift
//  ChefDelivery-ProjectStudy
//
//  Created by Gustavo Ferreira dos Santos on 07/01/25.
//

import Foundation

extension Double {
    func formatPrice() -> String {
        let formatedString = String(format: "%.2f", self)
        return formatedString.replacingOccurrences(of: ".", with: ",")
    }
}
