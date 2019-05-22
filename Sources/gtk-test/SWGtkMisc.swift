//
// Created by Andreas Schulz on 05.06.16.
//

import Foundation
import Gtk


class SWGtkMisc: SWGtkWidget {
    var ptrGtkMisc: UnsafeMutablePointer<GtkMisc>

    init(_ ptr: UnsafeMutablePointer<GtkMisc>) {
        ptrGtkMisc = ptr
        super.init(unsafeBitCast(ptrGtkMisc, to: UnsafeMutablePointer<GtkWidget>.self))
    }
}
