//
// Created by Andreas Schulz on 05.06.16.
//

import Foundation
import Gtk


struct SWGtkOrientation : OptionSet {
    let rawValue : GtkOrientation

    init(rawValue: GtkOrientation) {
        self.rawValue = rawValue
    }

    init() {
        rawValue = GTK_ORIENTATION_HORIZONTAL
    }
    mutating func formUnion(_ other: SWGtkOrientation) {}
    mutating func formIntersection(_ other: SWGtkOrientation) {}
    mutating func formSymmetricDifference(_ other: SWGtkOrientation) {}

    static let Horizontal = SWGtkOrientation(rawValue: GTK_ORIENTATION_HORIZONTAL)
    static let Vertical = SWGtkOrientation(rawValue: GTK_ORIENTATION_VERTICAL)
}

extension GtkOrientation: ExpressibleByIntegerLiteral {
    public typealias IntegerLiteralType = Int

    public init(integerLiteral: IntegerLiteralType) {
        self.init(UInt32(integerLiteral))
    }
}