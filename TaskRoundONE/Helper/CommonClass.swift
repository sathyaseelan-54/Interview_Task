//
//  CommonClass.swift
//  TaskRoundONE
//
//  Created by Sathya on 12/07/25.
//

import Foundation

class CommonClass {
    func formatDisplayDate(from isoString: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        var inputDate: Date?
        inputDate = isoFormatter.date(from: isoString)
        if inputDate == nil {
            isoFormatter.formatOptions = [.withInternetDateTime]
            inputDate = isoFormatter.date(from: isoString)
        }

        guard let date = inputDate else {
            return isoString
        }

        let calendar = Calendar.current

        if calendar.isDateInToday(date) {
            return "Today, \(formatTime(from: date))"
        } else if calendar.isDateInTomorrow(date) {
            return "Tomorrow, \(formatTime(from: date))"
        } else if calendar.isDateInYesterday(date) {
            return "Yesterday, \(formatTime(from: date))"
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy, h:mm a"
            return formatter.string(from: date)
        }
    }

    func formatTime(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: date)
    }
}
