//
//  DateUtils.swift
//  MarvelApp
//
//  Created by Chiller Rafaele on 10/1/23.
//

import Foundation

class DateUtils {
    
    /**
     Method that convert date to String.
     
     - Parameters:
        - date: Date will be converted to string
     
     - Returns: Date's string
     */
    static func dateToStringOnUTC(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter.string(from: date)
    }
    
    /**
     Method return a date given a date's string
     
     - Parameters:
        - dateString: String represent to a date.
     
     - Returns: A date value
     */
    static func dateStringToDate(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from: dateString)!
    }
    
    /**
     Method that return a medium date an time from date.
     - Parameters:
        - date: Date is going to be formatted
     - Returns: String formatted.
     */
    static func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        //dateFormatter.timeStyle = .medium
        return dateFormatter.string(from: date)
    }
}
