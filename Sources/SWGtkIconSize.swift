//
// Created by Andreas Schulz on 05.06.16.
//

import Foundation
import Gtk


struct SWGtkIconSize : OptionSet {
    let rawValue : GtkIconSize

    init(rawValue: GtkIconSize) {
        self.rawValue = rawValue
    }

    init() {
        rawValue = GTK_ICON_SIZE_INVALID
    }
    mutating func formUnion(_ other: SWGtkIconSize) {}
    mutating func formIntersection(_ other: SWGtkIconSize) {}
    mutating func formSymmetricDifference(_ other: SWGtkIconSize) {}

    static let Invalid = SWGtkIconSize(rawValue: GTK_ICON_SIZE_INVALID)
    static let Menu = SWGtkIconSize(rawValue: GTK_ICON_SIZE_MENU)
    static let SmallToolbar = SWGtkIconSize(rawValue: GTK_ICON_SIZE_SMALL_TOOLBAR)
    static let LargeToolbar = SWGtkIconSize(rawValue: GTK_ICON_SIZE_LARGE_TOOLBAR)
    static let Button = SWGtkIconSize(rawValue: GTK_ICON_SIZE_BUTTON)
    static let DragAndDrop = SWGtkIconSize(rawValue: GTK_ICON_SIZE_DND)
    static let Dialog = SWGtkIconSize(rawValue: GTK_ICON_SIZE_DIALOG)
}

extension GtkIconSize: IntegerLiteralConvertible {
    public typealias IntegerLiteralType = Int

    public init(integerLiteral: IntegerLiteralType) {
        self.init(UInt32(integerLiteral))
    }
}
