//
//  Date+Extension.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import Foundation

extension Date {
    public var isToday: Bool {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "ko_kr")!
        let todayComponents = calendar.dateComponents([.year, .month, .day], from: Date())
        let today = calendar.date(from: todayComponents)!
        return calendar.isDate(self, inSameDayAs: today)
    }
}
