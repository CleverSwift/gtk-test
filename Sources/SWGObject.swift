//
// Created by Andreas Schulz on 05.06.16.
//

import Foundation
import Gtk


class SWGObject {
    var ptrGObject: UnsafeMutablePointer<Void>
    var signalConnections = [(UInt, SWCallbackContainer)]()

    init(_ ptr: UnsafeMutablePointer<Void>) {
        ptrGObject = ptr
    }

    func connect(signal: String, callback: () -> Void) {
        // Allocate new container for callback
        let container = SWCallbackContainer(callback: callback)

        // Create c function pointer which unwraps void* to container and calls callback
        let _functor: @convention(c) (UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>) -> Void = { sender, data in
            let con = unsafeBitCast(data, to: SWCallbackContainer.self)
            con.callback()
        }

        // Cast c function pointer to GCallback
        let gcallback = unsafeBitCast(_functor, to: GCallback.self)

        // Obtain pointer to container, cast that pointer to void*
        let containerptr = unsafeBitCast(unsafeAddress(of: container), to: UnsafeMutablePointer<Void>.self)

        let handlerID = g_signal_connect_data(ptrGObject, signal, gcallback, containerptr, nil, SWGConnectFlags.None.rawValue)

        // Save container in member variable to prevent it from deallocating
        signalConnections.append((handlerID, container))
    }
}
