//
//  Extensions.swift
//

import Foundation
import UIKit

/* Optional Value */
protocol Defaultable {
    static var defaultValue: Self { get }
}

extension Optional where Wrapped: Defaultable {
    var unwrappedValue: Wrapped { return self ?? Wrapped.defaultValue }
}

extension Int: Defaultable {
    static var defaultValue: Int { return 0 }
}

extension String: Defaultable {
    static var defaultValue: String { return "" }
}

extension Bool: Defaultable {
    static var defaultValue: Bool { return false }
}

extension Array: Defaultable {
    static var defaultValue: Array<Element> { return [] }
}

extension String {
    var westernArabicNumeralsOnly: String {
        let pattern = UnicodeScalar("0")..."9"
        return String(unicodeScalars
            .flatMap { pattern ~= $0 ? Character($0) : nil })
    }
}
