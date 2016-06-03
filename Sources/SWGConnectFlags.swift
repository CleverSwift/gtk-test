//
// Created by aschulz on 03.06.16.
//

import Foundation
import Gtk


struct SWGConnectFlags : OptionSet {
    let rawValue : GConnectFlags

    init(rawValue: GConnectFlags) {
        self.rawValue = rawValue
    }

    init() {
        rawValue = GConnectFlags(0)
    }
    mutating func formUnion(_ other: SWGConnectFlags) {}
    mutating func formIntersection(_ other: SWGConnectFlags) {}
    mutating func formSymmetricDifference(_ other: SWGConnectFlags) {}

    static let None = SWGConnectFlags(rawValue: GConnectFlags(0))
    static let After = SWGConnectFlags(rawValue: G_CONNECT_AFTER)
    static let Swapped = SWGConnectFlags(rawValue: G_CONNECT_SWAPPED)
}

extension GConnectFlags: IntegerLiteralConvertible {
    public typealias IntegerLiteralType = Int

    public init(integerLiteral: IntegerLiteralType) {
        self.init(UInt32(integerLiteral))
    }
}