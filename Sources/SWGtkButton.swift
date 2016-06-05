//
// Created by Andreas Schulz on 04.06.16.
//

import Foundation
import Gtk


class SWGtkButton: SWGtkBin {
    var ptrGtkButton: UnsafeMutablePointer<GtkButton>

    init() {
        ptrGtkButton = unsafeBitCast(gtk_button_new(), to: UnsafeMutablePointer<GtkButton>.self)
        super.init(unsafeBitCast(ptrGtkButton, to: UnsafeMutablePointer<GtkBin>.self))
    }

    init(label: String) {
        ptrGtkButton = unsafeBitCast(gtk_button_new_with_label(label), to: UnsafeMutablePointer<GtkButton>.self)
        super.init(unsafeBitCast(ptrGtkButton, to: UnsafeMutablePointer<GtkBin>.self))
    }
}
