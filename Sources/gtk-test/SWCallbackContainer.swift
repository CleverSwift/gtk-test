//
// Created by Andreas Schulz on 04.06.16.
//

import Foundation


class SWCallbackContainer {
    var callback: () -> Void

    init(callback: @escaping () -> Void) {
        self.callback = callback
    }
}