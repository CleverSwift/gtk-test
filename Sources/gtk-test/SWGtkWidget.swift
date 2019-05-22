//
// Created by Andreas Schulz on 05.06.16.
//

import Foundation
import Gtk


class SWGtkWidget: SWGObject {
    var ptrGtkWidget: UnsafeMutablePointer<GtkWidget>

    var styleContext: SWGtkStyleContext {
        get {
            return SWGtkStyleContext(gtk_widget_get_style_context(ptrGtkWidget))
        }
    }

    init(_ ptr: UnsafeMutablePointer<GtkWidget>) {
        ptrGtkWidget = ptr
        super.init(UnsafeMutableRawPointer(ptrGtkWidget))
    }

    func showAll() {
        gtk_widget_show_all(ptrGtkWidget)
    }

    func destroy() {
        gtk_widget_destroy(ptrGtkWidget)
    }
}
