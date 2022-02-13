//
//  Extentions.swift
//  Now
//
//  Created by Дэвид Бердников on 13.02.2022.
//

import Foundation

extension Date {
    func dateToTimestamp() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}
