//
// Created by Andreas Schulz on 05.06.16.
//

import Foundation
import Gtk


class SWGtkStyleContext: SWGObject {
    var ptrGtkStyleContext: UnsafeMutablePointer<GtkStyleContext>

    init(_ ptr: UnsafeMutablePointer<GtkStyleContext>) {
        ptrGtkStyleContext = ptr
        super.init(unsafeBitCast(ptrGtkStyleContext, to: UnsafeMutableRawPointer.self))
    }

    func addClass(_ cls: String) {
        gtk_style_context_add_class(ptrGtkStyleContext, cls)
    }
}
