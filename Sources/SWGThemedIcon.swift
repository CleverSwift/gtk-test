//
// Created by Andreas Schulz on 04.06.16.
//

import Foundation
import Gtk


class SWGThemedIcon: SWGIcon {
    var ptrSWGIcon: OpaquePointer

    init(iconName: String) {
        ptrSWGIcon = g_themed_icon_new(iconName)
    }

    deinit {
        g_object_unref(unsafeBitCast(ptrSWGIcon, to: UnsafeMutableRawPointer.self))
    }
}
