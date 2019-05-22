//
// Created by Andreas Schulz on 05.06.16.
//

import Foundation
import Gtk


class SWGtkContainer: SWGtkWidget {
    var ptrGtkContainer: UnsafeMutablePointer<GtkContainer>
    var widgets = [SWGtkWidget]()

    init(_ ptr: UnsafeMutablePointer<GtkContainer>) {
        ptrGtkContainer = ptr
        super.init(unsafeBitCast(ptrGtkContainer, to: UnsafeMutablePointer<GtkWidget>.self))
    }

    func addWidget(_ widget: SWGtkWidget) {
        widgets.append(widget)
        gtk_container_add(ptrGtkContainer, widget.ptrGtkWidget)
    }
}
