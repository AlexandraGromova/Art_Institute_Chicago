import Foundation

class DateFormating {
    
    func getFormattedDate(date: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let newDate = formatter.date(from: date)
        formatter.dateFormat = "YY, MMM d"
        var y = formatter.string(from: newDate ?? Date()) //todo
        return y
    }
}

extension String {
    func toDate() -> Date {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter.date(from: self) ?? Date()
    }
    
    func toUIDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let newDate = formatter.date(from: self)
        formatter.dateFormat = "MMM d"
        var y = formatter.string(from: newDate ?? Date()) //todo
        return y
    }
}
