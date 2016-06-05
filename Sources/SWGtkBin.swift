//
// Created by Andreas Schulz on 05.06.16.
//

import Foundation
import Gtk


class SWGtkBin: SWGtkContainer {
    var ptrGtkBin: UnsafeMutablePointer<GtkBin>

    init(_ ptr: UnsafeMutablePointer<GtkBin>) {
        ptrGtkBin = ptr
        super.init(unsafeBitCast(ptrGtkBin, to: UnsafeMutablePointer<GtkContainer>.self))
    }
}
