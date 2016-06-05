//
// Created by Andreas Schulz on 05.06.16.
//

import Foundation
import Gtk


class SWGtkBox: SWGtkContainer {
    var ptrGtkBox: UnsafeMutablePointer<GtkBox>

    init(orientation: SWGtkOrientation, spacing: Int32) {
        ptrGtkBox = unsafeBitCast(gtk_box_new(orientation.rawValue, spacing), to: UnsafeMutablePointer<GtkBox>.self)
        super.init(unsafeBitCast(ptrGtkBox, to: UnsafeMutablePointer<GtkContainer>.self))
    }

    init(_ ptr: UnsafeMutablePointer<GtkBox>) {
        ptrGtkBox = ptr
        super.init(unsafeBitCast(ptrGtkBox, to: UnsafeMutablePointer<GtkContainer>.self))
    }
}
