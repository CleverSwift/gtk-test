//
// Created by Andreas Schulz on 05.06.16.
//

import Foundation
import Gtk


class SWGtkImage: SWGtkMisc {
    var ptrGtkImage: UnsafeMutablePointer<GtkImage>

    init(fromIcon icon: SWGIcon, size: SWGtkIconSize) {
        ptrGtkImage = unsafeBitCast(gtk_image_new_from_gicon(icon.ptrSWGIcon, size.rawValue), to: UnsafeMutablePointer<GtkImage>.self)
        super.init(unsafeBitCast(ptrGtkImage, to: UnsafeMutablePointer<GtkMisc>.self))
    }
}