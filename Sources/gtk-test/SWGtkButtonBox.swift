//
// Created by Andreas Schulz on 05.06.16.
//

import Foundation
import Gtk


class SWGtkButtonBox: SWGtkBox {
    var ptrGtkButtonBox: UnsafeMutablePointer<GtkButtonBox>

    init(orientation: SWGtkOrientation) {
        ptrGtkButtonBox = unsafeBitCast(gtk_button_box_new(orientation.rawValue), to: UnsafeMutablePointer<GtkButtonBox>.self)
        super.init(unsafeBitCast(ptrGtkButtonBox, to: UnsafeMutablePointer<GtkBox>.self))
    }
}
